# Tipografía

La familia predeterminada es Minion Pro. Sus cuatro variantes están en esta carpeta:

| Variante | Archivo |
| --- | --- |
| Regular | `MinionPro-Regular.otf` |
| Cursiva | `MinionPro-Italic.otf` |
| Negrita | `MinionPro-Bold.otf` |
| Negrita cursiva | `MinionPro-BoldItalic.otf` |

## Elegir una familia

Editar `config/options.tex`, relativo a la carpeta del documento:

```latex
\newcommand{\SRLFontName}{MinionPro}
```

Para una familia instalada, usar su nombre exacto, por ejemplo `TeX Gyre Pagella`.
El nombre de Minion Pro instalada en el sistema es `Minion Pro`, con espacio.

Para una familia local, hacer coincidir `\SRLLocalFontFamily` con `\SRLFontName`
y configurar `\SRLFontDirectory`, `\SRLFontRegular`, `\SRLFontItalic`,
`\SRLFontBold` y `\SRLFontBoldItalic`.

La resolución sigue este orden:

1. Archivos locales, si coincide la familia y existe el archivo regular.
2. Familia instalada en el sistema.
3. `\SRLFallbackFont`, cuyo valor predeterminado es `TeX Gyre Termes`.

Una familia local requiere las cuatro variantes. El log informa la familia
efectiva en `SRL-FONT` y su procedencia en `SRL-FONT-SOURCE`; también advierte
cuando usa la alternativa. Revisar la paginación después de cambiar la fuente.

Los OTF conservan la licencia de su titular.
