# Fuentes locales opcionales

La familia preferida es `Minion Pro`. Orden de resolución:

1. Los cuatro archivos locales configurados, si la familia local coincide con la
   solicitada y existe el archivo Regular.
2. La familia solicitada instalada en el sistema.
3. `TeX Gyre Termes`, con una advertencia explícita en el registro de compilación.

Nombres previstos para los archivos que aportará el autor:

- `MinionPro-Regular.otf`
- `MinionPro-It.otf`
- `MinionPro-Bold.otf`
- `MinionPro-BoldIt.otf`

No se incluyen ni se descargan fuentes propietarias. Compruebe que la licencia de
sus OTF permite distribuirlos en este repositorio público antes de incorporarlos.
Si solo puede usarlos localmente, instálelos en su equipo: el CI continuará con la
alternativa y no representará con exactitud la paginación de Minion Pro.

Una familia local parcial produce error; no se sintetizan estilos ni se mezclan
familias silenciosamente. Si sus archivos tienen otros nombres, configure las
cuatro rutas en `config/options.tex`. Para otra familia local, cambie también
`\SRLLocalFontFamily` y haga coincidir `\SRLFontName`.
