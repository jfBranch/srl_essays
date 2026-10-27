# Logos y figuras

Los logos todavía no están incluidos. Cuando se añadan, use PNG con transparencia:

- `srl-cover.png`: logo de portada, máximo 7 cm de ancho y 2,2 cm de alto.
- `srl-header.png`: logo de encabezado, máximo 2,5 cm de ancho y 0,7 cm de alto.

Se conserva siempre la proporción de la imagen. También puede cambiar los nombres
mediante `\SRLCoverLogo` y `\SRLHeaderLogo` en `config/options.tex`.
Si no existen los archivos, se omiten; no se dibuja un logo de reemplazo.
La portada nunca lleva el logo del encabezado.

El interruptor de colores cambia el texto; no convierte los PNG a escala de grises.
Para una entrega totalmente monocroma, suministre logos monocromos o deje vacías
sus rutas. Puede colocar aquí otras figuras empleadas por el ensayo.
