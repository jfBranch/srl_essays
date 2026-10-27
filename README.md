# Ensayos del SRL

Repositorio de ensayos para el Seminario Reformado Latinoamericano, preparados
en LaTeX con **XeLaTeX, TeX Live 2026 y Biber**.

## Organización

Se adopta GitHub flow: `main` reúne la plantilla y todos los ensayos; las ramas
temporales se integran mediante pull requests. Cada ensayo tiene una carpeta,
y cada entrega se identifica con una etiqueta y una Release con su PDF.

| Ruta | Función |
| --- | --- |
| `template/` | Plantilla Chicago-Deusto/SRL con Minion Pro y logos; fuente configurable y un booleano para colores de texto y logos. |
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
`turabian-researchpaper` y `biblatex-chicago`. Ya incluye los cuatro OTF de Minion Pro
y los PNG proporcionados por el autor. La fuente y `\SRLColorstrue` / `\SRLColorsfalse`
se configuran en `template/config/options.tex`; curso y fecha quedan siempre negros.
Véase [su guía](template/README.md) para el uso y el estado de los logos BW.

En GitHub, abrir **Actions → LaTeX → una ejecución correcta → Artifacts** para
descargar los PDF y la información de versiones. Los artefactos se conservan
30 días; las entregas definitivas se archivan en Releases.

## Siguiente etapa

Revisar y aprobar la plantilla del PR; sustituir el PNG de portada BW, que actualmente
es idéntico al de color, para una salida totalmente monocroma. Después iniciar
el ensayo sobre la primera resurrección. Se conserva numeración simple según
la recomendación Chicago/Turabian; la portada se cuenta, pero no muestra número.

- [Estructura prevista de cada documento](template/README.md)
- [Guía de trabajo, versiones y referencias técnicas](docs/workflow.md)
- [Ajustes administrativos y activación del ruleset](docs/github-settings.md)

`main` es la rama predeterminada y el ruleset `main-quality` está activo.
Los cambios se presentan mediante pull requests.
