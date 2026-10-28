# Flujo de trabajo

## Ramas y revisión

Se usa [GitHub flow](https://docs.github.com/en/get-started/using-github/github-flow).
`main` reúne la plantilla y los ensayos; cada cambio se prepara en una rama
temporal y se integra mediante un PR con **Squash and merge**.
Las carpetas identifican documentos; las etiquetas, versiones.

Convenciones de ramas:

- `template/tema`: cambios de la plantilla.
- `essay/tema`: redacción de un ensayo.
- `fix/tema`: correcciones puntuales.
- `chore/tema`: infraestructura.

Antes de crear una rama:

```sh
git switch main
git pull --ff-only
git switch -c essay/tema
```

Al terminar, revisar y fusionar el PR y borrar la rama temporal. Las reglas de
integración se mantienen en [configuración de GitHub](github-settings.md).
Para preparar un documento, seguir [iniciar un ensayo](../essays/README.md#iniciar-un-ensayo).

## Compilación

Instalar Python 3 y TeX Live **2026** con XeLaTeX, latexmk y Biber.
Desde la raíz del repositorio:

```sh
python3 scripts/build.py                            # todos los documentos
python3 scripts/build.py template/main.tex         # la plantilla
python3 scripts/build.py essays/2026-tema/main.tex  # un ensayo
python3 scripts/build.py --list                    # documentos detectados
```

En Windows puede usarse `py -3`. El script también puede invocarse por su ruta
desde otro directorio. `latexmk` ejecuta las pasadas necesarias de XeLaTeX y Biber;
la configuración común está en `latexmkrc`. El PDF queda en `<documento>/build/main.pdf`.

## Edición

Usar UTF-8, LF y nombres de archivo sin espacios ni tildes. Escribir una oración
por línea facilita revisar los cambios; una línea vacía delimita un párrafo.
Agrupar los commits por argumento, revisión bibliográfica o ajuste de formato.

Versionar `.tex`, `.bib`, recursos y documentación propia. Guardar las salidas
en `build/`. Los libros, artículos y materiales del curso permanecen fuera del
repositorio público; las figuras PDF utilizadas por el documento sí se versionan.

## Integración continua

[El workflow LaTeX](../.github/workflows/latex.yml) descubre `template/main.tex`,
`essays/*/main.tex` y la prueba técnica `ci/smoke/main.tex`. Comprueba citas,
referencias y caracteres; [las pruebas de plantilla](../ci/check-template.sh)
ejercitan las opciones de presentación, fuentes y recursos opcionales.

Para revisar el resultado, abrir **Actions → LaTeX → ejecución → Artifacts**.
Los PDF, logs y versiones de herramientas se conservan 30 días; los registros de
fallos, 7 días. Revisar visualmente el PDF y aplicar los
[criterios editoriales](template-requirements.md) antes de entregar.

Las acciones se fijan a commits y TeX Live al año indicado. Dependabot propone
actualizaciones mensuales. Para conservar una entrega, archivar su PDF exacto.

## Versiones y entregas

Etiquetas sugeridas:

- `template-v1.0.0`: plantilla aprobada.
- `essay-2026-tema-v1.0.0`: primera entrega de un ensayo.
- `essay-2026-tema-v1.0.1`: corrección posterior.

Cada etiqueta apunta a un commit del repositorio completo. Crear una Release
con esa etiqueta, una descripción breve, el PDF presentado y `toolchain.txt`.
Las etiquetas de entregas publicadas permanecen fijas. Las Releases se crean
manualmente.
