#!/usr/bin/env bash
# Pruebas de integración en el contenedor completo TeX Live del workflow.
set -euo pipefail
repo_root=$(pwd)
case_root="$repo_root/ci/template-checks/build"
mkdir -p "$case_root"

copy_case() {
  mkdir -p "$case_root/$1"
  # Solo fuentes; no arrastrar resultados de una compilación anterior.
  tar -C template --exclude='./build' -cf - . | tar -C "$case_root/$1" -xf -
}

compile_case() {
  (
    cd "$case_root/$1"
    latexmk -norc -r "$repo_root/latexmkrc" main.tex
    if grep -Eq 'There were undefined (references|citations)|Missing character:|Please \(re\)run Biber' build/main.log; then
      echo "Referencias o caracteres sin resolver en $1" >&2
      exit 1
    fi
  )
}

# Familia instalada distinta, texto negro y recorrido argumental sin bosquejo.
copy_case monochrome
cat >> "$case_root/monochrome/config/options.tex" <<'TEX'
\renewcommand{\SRLFontName}{TeX Gyre Pagella}
\renewcommand{\SRLLocalFontFamily}{Familia local no solicitada}
\SRLColorsfalse
\SRLOutlinefalse
TEX
compile_case monochrome
grep -q 'SRL-COLORS: false' "$case_root/monochrome/build/main.log"
grep -q 'SRL-FONT-SOURCE: system' "$case_root/monochrome/build/main.log"
grep -q 'SRL-FONT: TeX Gyre Pagella' "$case_root/monochrome/build/main.log"
if [ -f "$case_root/monochrome/build/main.toc" ]; then
  echo 'El bosquejo desactivado sigue presente' >&2
  exit 1
fi

# Ejercitar las cuatro rutas OTF con una familia libre, nunca con falsos Minion.
copy_case local-fonts
for face in regular italic bold bolditalic; do
  cp "$(kpsewhich "texgyretermes-${face}.otf")" "$case_root/local-fonts/fonts/"
done
cat >> "$case_root/local-fonts/config/options.tex" <<'TEX'
\renewcommand{\SRLFontName}{TeX Gyre Termes}
\renewcommand{\SRLLocalFontFamily}{TeX Gyre Termes}
\renewcommand{\SRLFontRegular}{texgyretermes-regular.otf}
\renewcommand{\SRLFontItalic}{texgyretermes-italic.otf}
\renewcommand{\SRLFontBold}{texgyretermes-bold.otf}
\renewcommand{\SRLFontBoldItalic}{texgyretermes-bolditalic.otf}
\SRLColorstrue
\SRLOutlinetrue
TEX
# Cuadrado de prueba de 8 px, no es un logo del SRL. Solo vive en build/.
printf '%s' 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAAFUlEQVR4nGN0c3P7z4AHMOGTHD4KAOM/AeEpVFo0AAAAAElFTkSuQmCC' | base64 -d > "$case_root/local-fonts/figures/srl-cover.png"
cp "$case_root/local-fonts/figures/srl-cover.png" "$case_root/local-fonts/figures/srl-header.png"
compile_case local-fonts
grep -q 'SRL-FONT-SOURCE: files' "$case_root/local-fonts/build/main.log"
grep -q 'SRL-FONT: TeX Gyre Termes' "$case_root/local-fonts/build/main.log"
grep -q 'srl-cover.png' "$case_root/local-fonts/build/main.log"
grep -q 'srl-header.png' "$case_root/local-fonts/build/main.log"
test -s "$case_root/local-fonts/build/main.toc"
echo 'OK: fuente instalada, OTF locales, colores, bosquejo y logos opcionales'
