# Criterios editoriales

Referencias normativas:

- «Guía breve - Manual de estilo Chicago Deusto - SRL», especialmente pp. 14-18.
- «Guía de redacción para ensayos de teología - SRL», sección III.

## Base LaTeX

- [turabian-formatting](https://ctan.org/pkg/turabian-formatting): clase
  `turabian-researchpaper`, basada en Turabian 9.ª edición.
- [biblatex-chicago](https://ctan.org/pkg/biblatex-chicago): Chicago 17.ª edición,
  modalidad notas-bibliografía, localización `cms-spanish` y Biber.
- `fontspec`: familias OpenType con XeLaTeX.

## Formato

| Elemento | Criterio |
| --- | --- |
| Papel | Carta. |
| Márgenes | 3 cm en los cuatro lados; encabezados en la zona marginal. |
| Cuerpo y portada | 12 pt, doble espacio; cuerpo justificado. |
| Párrafos | Primera línea de 1,25 cm, también después de títulos; hasta diez renglones. |
| Portada | Centrada y en mayúsculas. |
| Partes | Portada, bosquejo, introducción, desarrollo, conclusión y bibliografía en hojas independientes. |
| Hoja única | Bosquejo, introducción, conclusión y bibliografía; la compilación advierte si desbordan. |
| Bosquejo | Tres niveles, doble espacio, sin negrita, números de página ni puntos guía. |
| Títulos primarios | I., II.; centrados y en negrita. |
| Títulos secundarios | A., B.; a la izquierda y en negrita. |
| Títulos terciarios | 1., 2.; sangría de 1,25 cm, negrita y punto final; texto a continuación. |
| Citas extensas | 12 pt, espacio sencillo, sangría izquierda de 1 cm, sin comillas ni negrita. |
| Notas | 10 pt, espacio sencillo, alineadas a la izquierda y con la familia del cuerpo. |
| Citación | Primera nota completa; siguientes abreviadas, sin «Ibíd.». |
| Autoría múltiple | Cuatro o más autores: primero y «et al.» en notas; lista completa en bibliografía. |
| Bibliografía | 12 pt, doble espacio, sangría francesa de 1,25 cm y orden alfabético. |
| Paginación | Número simple arriba a la derecha, serie arábiga continua; portada contada sin número visible. |

## Decisiones de adaptación

La guía breve tiene prioridad sobre la de redacción para el formato del bosquejo.
Este puede sustituirse por el recorrido argumental en la introducción.

Se usa bloque desde 40 palabras. El papel Carta y la sangría francesa de 1,25 cm
completan valores que las guías no especifican. La paginación sigue la
[referencia Chicago/Turabian](https://cmosshoptalk.com/2018/06/12/how-do-i-format-margins-and-page-numbers-in-turabian-chicago-style/),
con el bosquejo SRL integrado en la serie del ensayo.

La tipografía y la identidad visual son opciones de presentación. La elección de
Minion Pro se aparta de Times New Roman o Arial prescritas por la guía.
Su configuración se documenta en [tipografía](../template/fonts/README.md) y
[colores y logos](../template/figures/README.md).

## Revisión editorial

Comprobar el argumento, las transcripciones, las ediciones y los localizadores
bibliográficos; revisar el PDF y la extensión de sus partes. Los requisitos
particulares de extensión y fuentes se registran con cada ensayo, siguiendo
[su organización](../essays/README.md).
