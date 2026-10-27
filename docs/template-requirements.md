# Requisitos de la plantilla SRL

Fuentes facilitadas por el autor: «Guía breve - Manual de estilo Chicago Deusto -
SRL.pdf» (pp. 14-18 del PDF para formato y ejemplos NB anteriores) y «Guía de
redacción para ensayos de teología - SRL.pdf» (especialmente sección III).
Se incorporan las preferencias del autor sobre fuente, RGB y logos suministrados.
No se publican los PDF fuente.

## Paquetes prioritarios

- [turabian-formatting](https://ctan.org/pkg/turabian-formatting): clase
  `turabian-researchpaper`, basada en Turabian 9.ª edición. `noraggedright` y
  `noadjustbib` permiten aplicar texto justificado y bibliografía del SRL.
- [biblatex-chicago](https://ctan.org/pkg/biblatex-chicago): notas-bibliografía de
  Chicago 17.ª edición, localización `cms-spanish` y Biber. No se reimplementan
  sus controladores bibliográficos.
- `fontspec`: familias OpenType con XeLaTeX.

Es una adaptación a la guía breve, no una afirmación de equivalencia exhaustiva
con todo Chicago-Deusto. Fuentes inusuales y datos requieren revisión editorial.

| Requisito | Implementación o decisión |
| --- | --- |
| NB; primera cita completa y siguientes abreviadas | `notes`, `short=false`, `noibid`; localizadores en `\autocite`. |
| Cuatro o más autores abreviados en nota; todos en bibliografía | `maxcitenames=3`, `mincitenames=1`, `maxbibnames=99`. |
| Español y comillas latinas | Babel, `cms-spanish`, `csquotes`; puntuación después de las comillas en texto. |
| Márgenes de 3 cm | `geometry`; encabezados en la zona marginal. |
| Cuerpo, portada y títulos de 12 pt | Clase y tamaños normales. |
| Texto justificado y doble espacio | `noraggedright`, `\justifying` y `\doublespacing` de setspace. |
| Primera línea de 1,25 cm | `\parindent`, también tras los títulos. |
| Portada centrada y en mayúsculas | `\SRLmaketitle`; datos editables en `metadata.tex`. |
| Partes en hojas independientes | Portada, bosquejo, introducción, desarrollo, conclusión y bibliografía. |
| Hoja única donde se exige | Entorno que advierte desbordamiento; no reduce fuente ni recorta. |
| Bosquejo con tres niveles y doble espacio | Títulos reales del desarrollo, sin páginas ni puntos guía. |
| Bosquejo sin negrita | Prioridad a la guía breve, p. 15; la de redacción indica negrita. |
| Bosquejo opcional en prosa en introducción | Booleano `\ifSRLOutline`, autorizado por la guía de redacción. |
| Primarios I., II.: negrita, centrados | `\section`, sin punto al final del título. |
| Secundarios A., B.: negrita, izquierda | `\subsection`, sin punto final. |
| Terciarios 1., 2.: negrita, sangría 1,25 cm | `\subsubsection` en línea, punto y texto a continuación. |
| Citas extensas: espacio simple, izquierda 1 cm, sin comillas/negrita | `SRLblockquote`, 12 pt, sin sangría adicional a la derecha. |
| Notas 10 pt, simples, izquierda, misma familia | Adaptación después de cargar los paquetes. |
| Bibliografía 12 pt, doble espacio, francesa, A-Z | `\bibfont`, `\bibhang=1.25cm`, `sorting=nty`, `sortlocale=es_ES`. |
| Times New Roman o Arial | Excepción solicitada: Minion Pro configurable, alternativa explícita. |
| Colores y logos | Un booleano para títulos y selección de PNG `color`/`bw`; curso y fecha siempre negros. Cuatro RGB exactos disponibles. |
| Numeración | Número simple arriba a la derecha; portada contada como página 1, sin número visible. |

Decisiones donde las guías no fijan valores: papel Carta (`letterpaper`, modificable
en `main.tex`), sangría francesa de 1,25 cm y bloque para citas de exactamente 40 palabras.

Para numeración se sigue la [ficha oficial Chicago/Turabian](https://cmosshoptalk.com/2018/06/12/how-do-i-format-margins-and-page-numbers-in-turabian-chicago-style/):
portada contada sin número impreso y número simple arriba a la derecha. La plantilla
mantiene una serie arábiga continua, incluyendo el bosquejo SRL. No se añade «# de #»:
no se encontró respaldo explícito para atribuir ese formato a Chicago; tampoco se
afirma que exista una prohibición expresa. Consulta realizada el 27 de octubre de 2026.

Permanecen en manos del autor: párrafos de hasta diez renglones; proporción de
citas directas; extensión de introducción y conclusión; calidad de fuentes y
localizadores; requisitos particulares del curso. No se imponen universalmente
las 3600 palabras y diez fuentes del ensayo sobre la primera resurrección.

Los cuatro OTF de Minion Pro y los cuatro PNG ya están incluidos. Cambiar fuente
modifica potencialmente la paginación y requiere revisar el PDF. Curso y fecha
se muestran negros para mejorar el contraste; el gris corporativo sigue definido.
Los archivos `srl-cover-color.png` y `srl-cover-bw.png` son idénticos y contienen
color: falta sustituir este último para obtener una portada monocroma real.
