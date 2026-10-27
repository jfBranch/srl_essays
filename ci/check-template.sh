#!/usr/bin/env bash
# Pruebas de integración en el contenedor completo TeX Live del workflow.
set -euo pipefail
repo_root=$(pwd)
case_root="$repo_root/ci/template-checks/build"
mkdir -p "$case_root"

copy_case() {
  mkdir -p "$case_root/$1"
  tar -C template --exclude='./build' -cf - . | tar -C "$case_root/$1" -xf -
}

compile_case() {
  (
    cd "$case_root/$1"
    latexmk -norc -r "$repo_root/latexmkrc" main.tex
    if grep -Eq 'There were undefined (references|citations)|Missing character:|Please \(re\)run Biber|Some font shapes were not available|Package fancyhdr Warning' build/main.log; then
      echo "Referencias, caracteres o variantes tipográficas sin resolver en $1" >&2
      exit 1
    fi
  )
}

# La compilación principal utiliza los recursos reales incluidos.
grep -q 'SRL-FONT-SOURCE: files' template/build/main.log
grep -q 'SRL-FONT: MinionPro' template/build/main.log
grep -q 'SRL-COVER-LOGO: figures/logos/srl-cover-color.png' template/build/main.log
grep -q 'SRL-HEADER-LOGO: figures/logos/srl-header-color.png' template/build/main.log
if grep -Eq 'Some font shapes were not available|Package fancyhdr Warning' template/build/main.log; then
  echo 'Variantes de Minion Pro sin resolver' >&2
  exit 1
fi

# Cambiar únicamente el booleano selecciona los dos PNG BW y texto negro.
copy_case monochrome
cat >> "$case_root/monochrome/config/options.tex" <<'TEX'
\SRLColorsfalse
TEX
compile_case monochrome
grep -q 'SRL-COLORS: false' "$case_root/monochrome/build/main.log"
grep -q 'SRL-FONT: MinionPro' "$case_root/monochrome/build/main.log"
grep -q 'SRL-COVER-LOGO: figures/logos/srl-cover-bw.png' "$case_root/monochrome/build/main.log"
grep -q 'SRL-HEADER-LOGO: figures/logos/srl-header-bw.png' "$case_root/monochrome/build/main.log"
if grep -Eq 'srl-(cover|header)-color\.png' "$case_root/monochrome/build/main.log"; then
  echo 'El modo sin colores cargó un logo a color' >&2
  exit 1
fi

# Familia instalada distinta; sin bosquejo ni PNG seleccionados. No usar color
# como reemplazo cuando falta BW: los PNG a color permanecen en la copia.
copy_case system-font
cat >> "$case_root/system-font/config/options.tex" <<'TEX'
\renewcommand{\SRLFontName}{TeX Gyre Pagella}
\renewcommand{\SRLLocalFontFamily}{Familia local no solicitada}
\SRLColorsfalse
\SRLOutlinefalse
TEX
rm "$case_root/system-font/figures/logos/srl-cover-bw.png" "$case_root/system-font/figures/logos/srl-header-bw.png"
compile_case system-font
grep -q 'SRL-FONT-SOURCE: system' "$case_root/system-font/build/main.log"
grep -q 'SRL-FONT: TeX Gyre Pagella' "$case_root/system-font/build/main.log"
grep -q 'SRL-COVER-LOGO: none' "$case_root/system-font/build/main.log"
grep -q 'SRL-HEADER-LOGO: none' "$case_root/system-font/build/main.log"
if grep -Eq 'srl-(cover|header)-color\.png' "$case_root/system-font/build/main.log"; then
  echo 'Se cargó un logo a color como reemplazo de BW ausente' >&2
  exit 1
fi
if [ -f "$case_root/system-font/build/main.toc" ]; then
  echo 'El bosquejo desactivado sigue presente' >&2
  exit 1
fi

# Ejercitar otras cuatro rutas OTF con una familia libre.
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
TEX
compile_case local-fonts
grep -q 'SRL-FONT-SOURCE: files' "$case_root/local-fonts/build/main.log"
grep -q 'SRL-FONT: TeX Gyre Termes' "$case_root/local-fonts/build/main.log"
test -s "$case_root/local-fonts/build/main.toc"

# Conservar la alternativa explícita si una familia solicitada no está disponible.
copy_case fallback
cat >> "$case_root/fallback/config/options.tex" <<'TEX'
\renewcommand{\SRLFontName}{SRL Missing Font For CI}
TEX
compile_case fallback
grep -q 'SRL-FONT-SOURCE: fallback' "$case_root/fallback/build/main.log"
grep -q 'SRL-FONT: TeX Gyre Termes' "$case_root/fallback/build/main.log"
echo 'OK: Minion Pro, logos color/BW, fuente instalada, OTF, alternativa y recursos ausentes'
