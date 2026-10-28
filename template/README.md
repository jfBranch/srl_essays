# Plantilla Chicago-Deusto / SRL

Guía para escribir y configurar un ensayo. Para crear su carpeta, seguir los
[pasos de inicio](../essays/README.md); para generar el PDF, consultar
[compilación](../docs/workflow.md#compilación).

## Archivos

| Ruta | Contenido |
| --- | --- |
| `main.tex` | Orden de las partes del documento. |
| `metadata.tex` | Datos de portada; el subtítulo puede quedar vacío. |
| `config/options.tex` | Opciones de presentación. |
| `sections/*.tex` | Introducción, desarrollo y conclusión. |
| `references.bib` | Datos de las ediciones consultadas. |
| [fonts/](fonts/README.md) | Configuración de familias tipográficas y OTF. |
| [figures/](figures/README.md) | Colores, logos y otras figuras. |
| [notes/](notes/README.md) | Apuntes fuera del documento compilado. |

`config/preamble.tex` carga los paquetes. Los archivos `fonts.tex`, `colors.tex`,
`logos.tex` y `layout.tex` contienen la configuración editorial.

Al empezar, sustituir los párrafos y referencias de ejemplo por el contenido
y las fuentes del ensayo.

## Bosquejo y títulos

En `config/options.tex`, `\SRLOutlinetrue` genera el bosquejo a partir de los
títulos del desarrollo. Con `\SRLOutlinefalse`, describir el recorrido argumental
en la introducción.

```latex
\section{Argumento principal}
\subsection{Razón que lo sostiene}
\subsubsection{Detalle pertinente}
```

Escribir los títulos con inicial mayúscula y sin punto final. El tercer nivel
agrega el punto y continúa con el texto en la misma línea. Introducción y
conclusión usan `\section*`.

## Citas y bibliografía

```latex
Una paráfrasis con localizador.\autocite[202]{clave}
\enquote{Una cita breve}.\autocite[25]{clave}
\autocite[Véase][25-27]{clave}
\footnote{Comentario propio; véase \cite[25]{clave}.}
```

Para una cita de 40 palabras o más:

```latex
\begin{SRLblockquote}
Texto de la cita, sin comillas.\autocite[45]{clave}
\end{SRLblockquote}
```

La bibliografía se genera con las entradas citadas de `references.bib`.
Usar `shorttitle` para ajustar el título abreviado; `urldate` para la fecha de
consulta de páginas web; `translator` para traducciones; `booktitle` y `pages`
para capítulos.

Los [criterios editoriales](../docs/template-requirements.md) reúnen las reglas
de formato y las decisiones de adaptación de la guía SRL.
