# Configuración común. scripts/build.py la carga desde cualquier documento.
# pdf_mode=5 selecciona XeLaTeX; latexmk ejecuta Biber cuando corresponde.
$pdf_mode = 5;
$out_dir = 'build';
$xelatex = 'xelatex -interaction=nonstopmode -no-shell-escape -halt-on-error -file-line-error %O %S';
