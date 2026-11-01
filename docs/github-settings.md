# Configuración de GitHub

La rama predeterminada es `main`. El ruleset `main-quality` se aplica únicamente
a `refs/heads/main`: PR obligatorio, cero aprobaciones externas, conversaciones
resueltas, bloqueo de eliminación y force push, y comprobación `LaTeX / build`
obligatoria. Permite historial con merge commits. Su definición está en
[main.json](../.github/rulesets/main.json).

Las ramas de trabajo, como `essay/*` y `template/*`, quedan fuera de este ruleset
y admiten reescritura del historial. El procedimiento y el método de integración
se documentan en el [flujo de trabajo](workflow.md).

## Consultar y actualizar

Con GitHub CLI y permisos de administración:

```sh
gh repo view jfBranch/srl_essays --json defaultBranchRef
gh api repos/jfBranch/srl_essays/rulesets
```

Para cambiar las opciones generales:

```sh
gh repo edit jfBranch/srl_essays --default-branch main --enable-merge-commit --delete-branch-on-merge
```

Para actualizar el ruleset, obtener su ID con la consulta anterior y sustituir `ID`:

```sh
gh api --method PUT repos/jfBranch/srl_essays/rulesets/ID --input .github/rulesets/main.json
```

Las opciones generales también se administran en **Settings → General** y las
reglas en **Settings → Rules → Rulesets**.

La fusión mediante merge commit requiere habilitar **Allow merge commits** en
las opciones generales y desactivar **Require linear history** en las reglas
aplicables a `main`. Los demás métodos pueden permanecer disponibles; se elige
el método de integración al fusionar cada PR.

Modificar el JSON versionado no cambia la configuración activa de GitHub.
Actualizar el ruleset existente con el archivo revisado, sin crear otro:
las reglas de varios rulesets se acumulan.
