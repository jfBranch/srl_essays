# Ensayos

Cada ensayo ocupa una carpeta estable `AAAA-tema-en-minusculas`, con un
`main.tex` propio y la estructura descrita en `../template/README.md`.
No hace falta duplicar los workflows, scripts o la configuración de latexmk.

Ejemplo futuro: `2026-la-primera-resurreccion/`.
El ensayo sobre la primera resurrección tiene un límite de 3600 palabras y
requiere al menos diez fuentes bibliográficas. Estos requisitos son particulares
de ese trabajo; no deben imponerse a todos los cursos del repositorio.

Al iniciar un ensayo:

1. Crear una rama temporal desde `main`, por ejemplo `essay/primera-resurreccion`.
2. Copiar la plantilla validada a su carpeta dentro de `essays/`, incluidos
   `fonts/` y `figures/logos/`, sin la carpeta de resultados `build/`.
3. Registrar título, curso, requisitos, versión de la plantilla y estado en el README del ensayo.
4. Redactar, compilar y revisar el PDF mediante un pull request hacia `main`.
5. Fusionar con squash cuando el cambio esté listo; pueden integrarse avances
   coherentes sin esperar al ensayo completo.
6. Para la entrega, crear una etiqueta y una Release con el PDF exacto presentado.


En cada copia, editar `metadata.tex`, `sections/`, `references.bib` y
`config/options.tex`. `\SRLFontName` selecciona la familia; `\SRLColorsfalse`
pone los títulos en negro y selecciona los logos `*-bw.png`. Curso y fecha
permanecen negros. Verificar el contenido de los PNG: el archivo BW de portada
actual es idéntico al de color. La numeración es simple, arriba a la derecha;
la portada cuenta como página 1 sin imprimir el número.
