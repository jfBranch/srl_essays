# Ensayos del SRL

Repositorio de ensayos para el Seminario Reformado Latinoamericano, preparados
en LaTeX con **XeLaTeX, TeX Live 2026 y Biber**.

## Organización

Se adopta GitHub flow: `main` reúne la plantilla y todos los ensayos; las ramas
temporales se integran mediante pull requests. Cada ensayo tiene una carpeta,
y cada entrega se identifica con una etiqueta y una Release con su PDF.

| Ruta | Función |
| --- | --- |
| `template/` | Plantilla reutilizable; implementación Chicago pendiente. |
| `essays/` | Una carpeta autónoma por ensayo. |
| `latexmkrc` | Configuración común de compilación con XeLaTeX. |
| `scripts/build.py` | Compilación local y comprobación de resultados. |
| `ci/smoke/` | Prueba técnica de XeLaTeX, español, Biber y referencias. |
| `.github/workflows/latex.yml` | Compilación y artefactos PDF en GitHub Actions. |
| `.github/rulesets/main.json` | Ruleset preparado para importar; requiere activación administrativa. |
| `docs/` | Flujo de trabajo, decisiones y ajustes de GitHub. |

## Comenzar

Con Python 3 y TeX Live 2026 instalados:

```sh
python3 scripts/build.py
```

Por ahora compila exclusivamente la prueba técnica, cuyo estilo bibliográfico
no corresponde a Chicago. Los futuros `template/main.tex` y
`essays/*/main.tex` se detectarán sin modificar el workflow.

En GitHub, abrir **Actions → LaTeX → una ejecución correcta → Artifacts** para
descargar los PDF y la información de versiones. Los artefactos se conservan
30 días; las entregas definitivas se archivan en Releases.

## Siguiente etapa

Implementar y revisar visualmente la plantilla Chicago Deusto conforme a las
guías del SRL. Después iniciar el ensayo sobre la primera resurrección.

- [Estructura prevista de cada documento](template/README.md)
- [Guía de trabajo, versiones y referencias técnicas](docs/workflow.md)
- [Ajustes administrativos y activación del ruleset](docs/github-settings.md)

La creación de `main` no cambia automáticamente la rama predeterminada:
`base-template` se conserva durante la transición administrativa.
