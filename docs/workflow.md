# Flujo de trabajo y decisiones

## Una colección de ensayos en un repositorio

`main` conserva la plantilla y todos los ensayos. Las ramas representan cambios
en curso; las carpetas representan documentos; las etiquetas representan versiones.
Una rama permanente por ensayo es posible, pero separaría los trabajos en árboles
distintos, dificultaría consultarlos juntos y obligaría a propagar infraestructura
entre ramas. Para esta colección se adopta GitHub flow, sin `develop` ni el ciclo
de ramas de release/hotfix de GitFlow.

Convenciones de ramas temporales:

- `template/chicago-srl`: implementación o mejora de la plantilla.
- `essay/primera-resurreccion`: redacción del ensayo.
- `fix/referencias-primera-resurreccion`: corrección acotada.
- `chore/latex-ci`: infraestructura.

Ejemplo de trabajo local (Git y Python 3 instalados):

```sh
git clone https://github.com/jfBranch/srl_essays.git
cd srl_essays
git switch main
git pull --ff-only
git switch -c template/chicago-srl
python3 scripts/build.py
git add template
git commit -m "template: ajustar notas y bibliografía al estilo SRL"
git push -u origin template/chicago-srl
```

Abrir un pull request hacia `main`, revisar el PDF en Actions y fusionar con
**Squash and merge**. Un autor único puede fusionar su propio PR: la propuesta
de ruleset exige PR y compilación correcta, pero cero aprobaciones externas.

## Edición y compilación

Usar UTF-8, LF y nombres de archivo sin espacios ni tildes. En el contenido sí
se escribe español normal. Una oración por línea facilita los diffs; la línea
en blanco sigue delimitando el párrafo en LaTeX. Hacer commits pequeños por
argumento, revisión bibliográfica o cambio de estilo; evitar mezclar una
reformulación del texto con cambios masivos de formato.

Instalar TeX Live **2026** con XeLaTeX, latexmk y Biber. El año corresponde a la
distribución TeX Live, no al nombre de una versión independiente de XeLaTeX.

```sh
python3 scripts/build.py                            # todos los documentos
python3 scripts/build.py essays/2026-tema/main.tex  # un documento existente
python3 scripts/build.py --list                    # documentos detectados
```

En Windows se puede sustituir `python3` por `py -3`. El script no depende de
Bash ni de Make. Se ejecuta desde cualquier directorio. Para compilación manual,
entrar en la carpeta del documento y cargar el `latexmkrc` de la raíz con `-r`.

`latexmk` se ocupa de las pasadas de XeLaTeX, Biber y referencias cruzadas.
El PDF queda en `<documento>/build/main.pdf`. El workflow descubre
`template/main.tex` y `essays/*/main.tex` automáticamente, además de la prueba
`ci/smoke/main.tex`. Comprueba referencias sin resolver y caracteres ausentes.
La compilación correcta no sustituye la revisión visual, exegética o bibliográfica.

Para un ensayo breve basta `\input`; no se necesitan submódulos Git, una clase
personalizada ni `subfiles` desde el principio. Se elegirá la abstracción de
estilo necesaria al implementar Chicago. Cada ensayo conserva una copia del
estilo de la plantilla para poder evolucionar independientemente.

## Versiones y entregas

Etiquetas sugeridas:

- `template-v1.0.0`: primera plantilla aprobada.
- `essay-2026-primera-resurreccion-v1.0.0`: primera entrega.
- `essay-2026-primera-resurreccion-v1.0.1`: corrección posterior.

Una etiqueta apunta a un commit del repositorio completo; su nombre identifica
el documento al que corresponde. No mover etiquetas de entregas ya realizadas.
Crear una Release manual con esa etiqueta, una nota breve, el PDF presentado y
el archivo `toolchain.txt` de la compilación. No se publica ninguna Release
automáticamente al hacer push. Los artefactos de CI duran 30 días y sirven para
revisión; no son el archivo definitivo de entregas.

Se fijan las acciones a commits y el año de TeX Live a 2026. Dependabot propone
actualizaciones mensuales de las acciones. El año no congela cada paquete ni
el contenedor: no se promete reproducción bit a bit. Para una reproducción más
estricta futura, fijar también el digest del contenedor y las versiones de fuentes;
para preservar la entrega, conservar siempre el PDF exacto.

## Fuentes y material de consulta

Versionar `.tex`, `.bib`, scripts, figuras necesarias y documentación propia.
No incorporar archivos auxiliares ni copias completas de libros y artículos al
repositorio público. Los materiales del curso permanecen como fuentes de trabajo;
la bibliografía del ensayo recoge sus datos y las notas citan páginas verificadas.
Las figuras PDF sí pueden ser entradas legítimas: por eso no se ignora `*.pdf`
globalmente. Las salidas van siempre a `build/`.

## Referencias técnicas consultadas

- [GitHub flow](https://docs.github.com/en/get-started/using-github/github-flow).
- [GitFlow y reflexión posterior de su autor](https://nvie.com/posts/a-successful-git-branching-model/).
- [Overleaf: proyectos de varios archivos](https://www.overleaf.com/learn/latex/Multi-file_LaTeX_projects).
- [Overleaf: organización de proyectos](https://www.overleaf.com/learn/latex/Management_in_a_large_project).
- [CTAN: latexmk](https://ctan.org/pkg/latexmk).
- [TeX Live](https://www.tug.org/texlive/).
- [Acción de compilación LaTeX](https://github.com/xu-cheng/latex-action).
- [Reglas disponibles en GitHub](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/available-rules-for-rulesets).
- [Seguridad de GitHub Actions](https://docs.github.com/en/actions/reference/security/secure-use).
- [Releases](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases).

