# Plantilla base

La próxima etapa construirá aquí la plantilla según las guías Chicago Deusto y
de redacción del SRL. No hay todavía una plantilla editorial implementada.

Estructura prevista, autónoma y copiable a `essays/<año>-<tema>/`:

| Ruta | Responsabilidad |
| --- | --- |
| `main.tex` | Documento raíz: carga estilo, metadatos, secciones y bibliografía. |
| `metadata.tex` | Título, autor, curso, profesor y fecha. |
| `config/preamble.tex` | Paquetes, fuentes, márgenes y convenciones editoriales. |
| `sections/01-introduccion.tex` | Problema, tesis y recorrido argumental. |
| `sections/02-argumentacion.tex` | Desarrollo; dividir por argumentos si mejora la lectura. |
| `sections/03-conclusion.tex` | Conclusión del ensayo. |
| `references.bib` | Entradas bibliográficas utilizadas en este documento. |
| `figures/` | Figuras originales o con autorización para incluirlas. |
| `fonts/` | Solo fuentes cuya licencia permita distribuirlas, si son necesarias. |
| `notes/` | Esquemas y notas propias, fuera del texto compilado. |
| `build/` | PDF y auxiliares generados; excluidos de Git. |

Para ensayos breves se usará `\input{sections/01-introduccion}`: `\include`
introduce saltos de página que normalmente no convienen aquí. Cada `main.tex`
se compila desde su propia carpeta; las rutas internas son relativas a ella.

Una vez validada, etiquetar la plantilla, por ejemplo `template-v1.0.0`.
Cada nuevo ensayo copiará esa versión e indicará su etiqueta de origen en su
README. Las mejoras posteriores se adoptarán deliberadamente: no se cambiará
el diseño de ensayos entregados mediante una dependencia compartida mutable.

