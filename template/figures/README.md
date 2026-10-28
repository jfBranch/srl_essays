# Colores, logos y figuras

## Modo de color

Editar el booleano en `config/options.tex`, relativo a la carpeta del documento:

```latex
\SRLColorstrue   % Usar \SRLColorsfalse para el modo sin colores.
```

| Modo | Títulos y subtítulo de portada | Logos |
| --- | --- | --- |
| `\SRLColorstrue` | Rojo SRL | Archivos `*-color.png`. |
| `\SRLColorsfalse` | Negro | Archivos `*-bw.png`. |

El resto del texto queda negro. Los enlaces se muestran sin recuadros.

La paleta se define en `config/colors.tex`:

| Nombre | RGB | Uso |
| --- | --- | --- |
| `redSRL` | 177,35,51 | Títulos. |
| `yellowSRL` | 252,186,99 | Disponible. |
| `darkgreySRL` | 237,235,232 | Disponible. |
| `lightgreySRL` | 247,245,242 | Disponible. |

## Recursos de los logos

| Elemento | Ruta con color | Ruta sin colores | Tamaño máximo |
| --- | --- | --- | --- |
| Portada | `figures/logos/srl-cover-color.png` | `figures/logos/srl-cover-bw.png` | 7 cm × 2,2 cm |
| Encabezado | `figures/logos/srl-header-color.png` | `figures/logos/srl-header-bw.png` | 2,5 cm × 0,7 cm |

Las rutas se configuran con `\SRLCoverLogoColor`, `\SRLCoverLogoBW`,
`\SRLHeaderLogoColor` y `\SRLHeaderLogoBW` en `config/options.tex`.
Se conserva la proporción y transparencia de cada PNG. La selección carga el
archivo correspondiente sin convertir sus colores; si falta o su ruta está vacía,
el logo se omite.

El log registra los recursos efectivos en `SRL-COVER-LOGO` y `SRL-HEADER-LOGO`,
o `none` cuando se omiten.

Las demás figuras del ensayo se guardan fuera de `logos/`.
