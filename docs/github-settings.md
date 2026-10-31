# Configuración de GitHub

La rama predeterminada es `main`. El ruleset `main-quality` está activo sobre ella:
PR obligatorio, cero aprobaciones externas, conversaciones resueltas, historial
lineal, bloqueo de eliminación y force push, y comprobación `LaTeX / build`
obligatoria. Su definición está en
[main.json](../.github/rulesets/main.json).

La integración se realiza mediante squash. Se recomienda borrar automáticamente
las ramas fusionadas.

## Consultar y actualizar

Con GitHub CLI y permisos de administración:

```sh
gh repo view jfBranch/srl_essays --json defaultBranchRef
gh api repos/jfBranch/srl_essays/rulesets
```

Para cambiar las opciones generales:

```sh
gh repo edit jfBranch/srl_essays --default-branch main --enable-squash-merge --delete-branch-on-merge
```

Para actualizar el ruleset, obtener su ID con la consulta anterior y sustituir `ID`:

```sh
gh api --method PUT repos/jfBranch/srl_essays/rulesets/ID --input .github/rulesets/main.json
```

Las opciones generales también se administran en **Settings → General** y las
reglas en **Settings → Rules → Rulesets**.
