# Fuentes locales

La plantilla incluye las cuatro variantes de Minion Pro proporcionadas por el autor:

| Variante | Archivo |
| --- | --- |
| Regular | `MinionPro-Regular.otf` |
| Cursiva | `MinionPro-Italic.otf` |
| Negrita | `MinionPro-Bold.otf` |
| Negrita cursiva | `MinionPro-BoldItalic.otf` |

`\SRLFontName` y `\SRLLocalFontFamily` usan el identificador `MinionPro` en
`config/options.tex`; ambos coinciden y seleccionan estos OTF, tanto localmente
como en CI. El nombre de familia interno para una instalación del sistema es
`Minion Pro` (con espacio). Los nombres de archivo incluyen `Italic`, aunque el
nombre PostScript de esas variantes termine en `It` o `BoldIt`.

Orden de resolución:

1. Los cuatro archivos locales configurados, si la familia local coincide con la
   solicitada y existe el archivo Regular.
2. La familia solicitada instalada en el sistema.
3. `TeX Gyre Termes`, con una advertencia explícita en el registro de compilación.

Para otra familia instalada, cambiar solo `\SRLFontName` por su nombre exacto.
Para otra familia local, cambiar también `\SRLLocalFontFamily` y las cuatro rutas.
Una familia local parcial produce error; no se sintetizan estilos ni se mezclan
familias silenciosamente. El log informa `SRL-FONT` y `SRL-FONT-SOURCE`.
Cambiar de fuente requiere revisar el PDF y su paginación.

Los OTF se aportaron al repositorio; la compilación no descarga fuentes.
Su licencia sigue siendo la de su titular: las instrucciones de esta plantilla
no conceden derechos adicionales sobre los archivos tipográficos.
