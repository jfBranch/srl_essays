# Ensayos del SRL

Repositorio de ensayos para el Seminario Reformado Latinoamericano, preparados
en LaTeX con **XeLaTeX, TeX Live 2026 y Biber**.

## Organización

Se adopta GitHub flow: `main` reúne la plantilla y todos los ensayos; las ramas
temporales se integran mediante pull requests. Cada ensayo tiene una carpeta,
y cada entrega se identifica con una etiqueta y una Release con su PDF.

| Ruta | Función |
| --- | --- |
| `template/` | Plantilla Chicago-Deusto/SRL, con fuente y colores configurables. |
| `essays/` | Una carpeta autónoma por ensayo. |
| `latexmkrc` | Configuración común de compilación con XeLaTeX. |
| `scripts/build.py` | Compilación local y comprobación de resultados. |
| `ci/smoke/` | Prueba técnica de XeLaTeX, español, Biber y referencias. |
| `.github/workflows/latex.yml` | Compilación y artefactos PDF en GitHub Actions. |
| `.github/rulesets/main.json` | Definición del ruleset main-quality, activado en GitHub. |
| `docs/` | Flujo de trabajo, decisiones y ajustes de GitHub. |

## Comenzar

Con Python 3 y TeX Live 2026 instalados:

```sh
python3 scripts/build.py
```

Compila la prueba técnica y la plantilla `template/main.tex`. Los documentos de
`essays/*/main.tex` se detectan sin modificar el workflow. La plantilla usa
`turabian-researchpaper` y `biblatex-chicago`; Minion Pro es configurable y, mientras
falta, se utiliza una alternativa con advertencia. Véase [su guía](template/README.md).

En GitHub, abrir **Actions → LaTeX → una ejecución correcta → Artifacts** para
descargar los PDF y la información de versiones. Los artefactos se conservan
30 días; las entregas definitivas se archivan en Releases.

## Siguiente etapa

Revisar la plantilla, incorporar los OTF y logos proporcionados por el autor y
comprobar su paginación final. Después iniciar el ensayo sobre la primera resurrección.

- [Estructura prevista de cada documento](template/README.md)
- [Guía de trabajo, versiones y referencias técnicas](docs/workflow.md)
- [Ajustes administrativos y activación del ruleset](docs/github-settings.md)

`main` es la rama predeterminada y el ruleset `main-quality` está activo.
Los cambios se presentan mediante pull requests.
