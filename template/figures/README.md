# Logos y figuras

Los PNG suministrados están en `logos/`. El mismo booleano `\ifSRLColors` controla
el color de los títulos y la selección de ambos logos:

| Elemento | `\SRLColorstrue` | `\SRLColorsfalse` | Tamaño máximo |
| --- | --- | --- | --- |
| Portada | `logos/srl-cover-color.png` | `logos/srl-cover-bw.png` | 7 cm × 2,2 cm |
| Encabezado | `logos/srl-header-color.png` | `logos/srl-header-bw.png` | 2,5 cm × 0,7 cm |

Se conserva la proporción y transparencia de cada recurso. La portada no lleva
el logo del encabezado. Curso y fecha permanecen negros en ambos modos.

Para usar otros nombres, editar `\SRLCoverLogoColor`, `\SRLCoverLogoBW`,
`\SRLHeaderLogoColor` y `\SRLHeaderLogoBW` en `config/options.tex`.
`config/logos.tex` resuelve `\SRLCoverLogo` y `\SRLHeaderLogo` después de leer las
opciones. El log informa los recursos efectivos mediante `SRL-COVER-LOGO` y
`SRL-HEADER-LOGO`, o `none` si no existen. Una ruta vacía también omite el logo.
Si falta una variante seleccionada, no se carga automáticamente la otra.

No se convierten ni recolorean los PNG durante la compilación. **Los dos archivos
de portada suministrados actualmente son idénticos y contienen color.** Para
obtener una portada monocroma, reemplazar `logos/srl-cover-bw.png` con la versión
correcta. Los dos archivos de encabezado sí son distintos; el BW es visualmente
monocromo. El CI comprueba la selección de rutas; no certifica el color de sus
píxeles. Revisar el PDF tras sustituir cualquier recurso.

Las demás figuras del ensayo pueden colocarse aquí, fuera de `logos/`.
