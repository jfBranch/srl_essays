# Ajustes administrativos

Estado verificado: `main` es la rama predeterminada y `main-quality` está activo.
El propietario aplicó ambos ajustes manualmente. Los comandos siguientes se
conservan como referencia; no crear otro ruleset duplicado.

Los archivos versionados no activan por sí mismos un ruleset ni cambian la rama
predeterminada. El conector utilizado para preparar este repositorio permite
escribir contenido, pero no ofrece esas operaciones administrativas.

Configuración objetivo:

1. Rama predeterminada: `main`.
2. Integración de PR: squash; borrar automáticamente las ramas fusionadas.
3. Ruleset `main-quality` activo sobre `main` con PR obligatorio, cero
   aprobaciones externas, conversaciones resueltas, historial lineal, bloqueo
   de eliminación y force push, y comprobación `LaTeX / build` obligatoria.

El ruleset completo está en `.github/rulesets/main.json`. Esperar a que exista
una ejecución correcta del workflow antes de activarlo. No activar exigencias
de firma ni aprobaciones externas sin preparar antes ese flujo.

## Aplicación con GitHub CLI

Con una sesión propia de `gh` autorizada para administrar el repositorio,
desde la raíz del clon:

```sh
gh repo edit jfBranch/srl_essays --default-branch main --enable-squash-merge --delete-branch-on-merge
gh api --method POST repos/jfBranch/srl_essays/rulesets --input .github/rulesets/main.json
```

El segundo comando crea un ruleset nuevo: ejecutarlo una sola vez. Para actualizar
uno existente, obtener su ID con `gh api repos/jfBranch/srl_essays/rulesets` y
usar `--method PUT repos/jfBranch/srl_essays/rulesets/ID` con el mismo archivo.

También puede importarse el JSON desde Settings → Rules → Rulesets → New ruleset
→ Import a ruleset. Cambiar la rama predeterminada desde Settings → General.
La plantilla reside en `template/`; la rama original `base-template` no debe
usarse como almacén permanente de la plantilla.

Verificar después:

```sh
gh repo view jfBranch/srl_essays --json defaultBranchRef
gh api repos/jfBranch/srl_essays/rulesets
```
