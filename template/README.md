# Plantilla Chicago-Deusto / SRL

Base: clase `turabian-researchpaper` de `turabian-formatting` y
`biblatex-chicago` en modalidad **notas y bibliografía**, con Biber y español.
Compilar con **XeLaTeX de TeX Live 2026**.

Los párrafos y tres referencias demuestran el formato; no constituyen un ensayo
ni acreditan consulta de las obras originales. Sustituirlos al empezar.

## Uso

Desde la raíz del repositorio:

```sh
python3 scripts/build.py template/main.tex
```

En Windows puede usarse `py -3`. El resultado es `template/build/main.pdf`.
Para iniciar un ensayo, copiar esta carpeta a `essays/AAAA-tema/`, sin `build/`.
Registrar el commit o etiqueta de la plantilla en el README del ensayo.
El CI descubrirá su `main.tex`; no copiar workflows ni scripts de la raíz.

| Ruta | Qué editar |
| --- | --- |
| `metadata.tex` | Datos de portada; subtítulo vacío si no se necesita. |
| `config/options.tex` | Fuente, booleanos y rutas de recursos. |
| `sections/*.tex` | Introducción, desarrollo y conclusión. |
| `references.bib` | Datos de las ediciones efectivamente consultadas. |
| `figures/` | Logos PNG y figuras; logos todavía no incluidos. |
| `fonts/` | Familia local opcional; Minion Pro todavía no incluida. |
| `notes/` | Notas que no se compilan. |

`config/preamble.tex` carga paquetes; `fonts.tex`, `colors.tex` y `layout.tex`
contienen las adaptaciones editoriales. Normalmente no se modifican por ensayo.

## Fuente

Editar esta línea de `config/options.tex`, sin añadir una segunda definición:

```latex
\newcommand{\SRLFontName}{Minion Pro}
```

Por ejemplo, cambiarla a `TeX Gyre Pagella` o `Times New Roman` si está instalada.
Se priorizan los archivos locales configurados para esa familia; después la
instalación del sistema. Si no se encuentra, se usa `TeX Gyre Termes` con una
advertencia explícita. El log informa `SRL-FONT` y `SRL-FONT-SOURCE`.

Minion Pro es la excepción solicitada por el autor; la guía prescribe Times New
Roman o Arial. Una previsualización con la alternativa no acredita ni el aspecto
ni la paginación final con Minion Pro. Véase [la integración de OTF](fonts/README.md).

## Colores

```latex
\SRLColorstrue   % Activados por defecto; cambiar por \SRLColorsfalse.
```

| Nombre | RGB | Aplicación automática |
| --- | --- | --- |
| `redSRL` | 177,35,51 | Título/subtítulo de portada y títulos de los tres niveles, incluidos los no numerados. |
| `yellowSRL` | 252,186,99 | Disponible para uso posterior. |
| `darkgreySRL` | 237,235,232 | Curso y fecha en portada. |
| `lightgreySRL` | 247,245,242 | Disponible para uso posterior. |

`darkgreySRL`, pese al nombre, es muy claro sobre blanco. Se mantiene el RGB
solicitado; revisar su legibilidad antes de entregar. Desactivar colores no
modifica los PNG ni elimina las cuatro definiciones. Los enlaces quedan negros
y sin recuadros en ambos modos.

## Bosquejo y títulos

`\SRLOutlinetrue` genera una hoja con los títulos reales del desarrollo.
`\SRLOutlinefalse` la omite: en ese caso describir el recorrido argumental en la
introducción, sin repetirlo en otra parte, como autoriza la guía de redacción.

```latex
\section{Argumento principal}       % I., centrado y negrita.
\subsection{Razón que lo sostiene}  % A., izquierda y negrita.
\subsubsection{Detalle pertinente}  % 1., sangría y texto a continuación.
```

Usar inicial mayúscula normal, sin punto final. El tercer nivel agrega el punto.
Introducción y conclusión usan `\section*`. La guía define solo tres niveles;
no usar `\paragraph` como un cuarto nivel.

## Citas

```latex
Una paráfrasis con localizador.\autocite[202]{clave}
\enquote{Una cita breve}.\autocite[25]{clave}
\autocite[Véase][25-27]{clave}
\footnote{Comentario propio; véase \cite[25]{clave}.}
```

La primera nota es completa; las posteriores usan forma abreviada.
`noibid` conserva la identificación abreviada incluso en notas consecutivas.
La guía admite «Ibíd.», pero no lo exige. Se puede indicar `shorttitle` en el `.bib`.

```latex
\begin{SRLblockquote}
Texto de la cita, sin comillas.\autocite[45]{clave}
\end{SRLblockquote}
```

Se adopta bloque **a partir de 40 palabras**: la guía distingue menores y mayores
de 40, omitiendo el caso exacto. El autor elige el entorno y comprueba el recuento.
Usar `SRLblockquote`, no los entornos genéricos de Turabian.

La bibliografía incluye entradas citadas, ordenadas por autor, título y año.
El paquete gestiona tipos de fuente; el `.bib` debe contener datos correctos.
Para páginas web puede añadirse `urldate`; para traducciones, `translator`;
para capítulos, `booktitle` y `pages`.

## Verificación

El workflow compila el modelo y variantes de colores desactivados, otra fuente
instalada, OTF locales y logos presentes/ausentes. Los recursos de prueba no son
Minion Pro ni logos oficiales; solo se generan en `build/`, excluido de Git.

Revisar visualmente el PDF. Se avisa si bosquejo, introducción, conclusión o
bibliografía exceden una página, sin encoger ni recortar texto. El límite de diez
renglones por párrafo y los requisitos propios del curso requieren revisión.

Véase [la matriz de requisitos](../docs/template-requirements.md).
