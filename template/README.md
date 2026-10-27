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
| `figures/logos/` | Logos PNG de portada y encabezado, variantes `color` y `bw`. |
| `fonts/` | Cuatro OTF de Minion Pro incluidos; familia local configurable. |
| `notes/` | Notas que no se compilan. |

`config/preamble.tex` carga paquetes; `fonts.tex`, `colors.tex`, `logos.tex` y `layout.tex`
contienen las adaptaciones editoriales. Normalmente no se modifican por ensayo.

## Fuente

Editar esta línea de `config/options.tex`, sin añadir una segunda definición:

```latex
\newcommand{\SRLFontName}{MinionPro}
```

`MinionPro` es el identificador local configurado para los OTF incluidos.
Por ejemplo, cambiarlo a `TeX Gyre Pagella` o `Times New Roman` si está instalada.
Para Minion Pro instalada en el sistema, usar su nombre de familia `Minion Pro`.
Se priorizan los archivos locales configurados para esa familia; después la
instalación del sistema. Si no se encuentra, se usa `TeX Gyre Termes` con una
advertencia explícita. El log informa `SRL-FONT` y `SRL-FONT-SOURCE`.

Minion Pro es la excepción solicitada por el autor; la guía prescribe Times New
Roman o Arial. Una previsualización con la alternativa no acredita ni el aspecto
ni la paginación final con Minion Pro. Véase [la integración de OTF](fonts/README.md).

## Colores de texto y logos

```latex
\SRLColorstrue   % Activados por defecto; cambiar por \SRLColorsfalse.
```

| Nombre | RGB | Aplicación automática |
| --- | --- | --- |
| `redSRL` | 177,35,51 | Título/subtítulo de portada y títulos de los tres niveles, incluidos los no numerados. |
| `yellowSRL` | 252,186,99 | Disponible para uso posterior. |
| `darkgreySRL` | 237,235,232 | Disponible para uso posterior; no se aplica a curso ni fecha. |
| `lightgreySRL` | 247,245,242 | Disponible para uso posterior. |

**Curso y fecha quedan negros en ambos modos.** Las cuatro definiciones RGB se
conservan; los enlaces quedan negros y sin recuadros.

El mismo booleano elige los recursos de portada y encabezado:

| Opción | Títulos | Portada | Encabezado |
| --- | --- | --- | --- |
| `\SRLColorstrue` | Rojo SRL | `figures/logos/srl-cover-color.png` | `figures/logos/srl-header-color.png` |
| `\SRLColorsfalse` | Negro | `figures/logos/srl-cover-bw.png` | `figures/logos/srl-header-bw.png` |

Las rutas se configuran con `\SRLCoverLogoColor`, `\SRLCoverLogoBW`,
`\SRLHeaderLogoColor` y `\SRLHeaderLogoBW`. No se convierten las imágenes al compilar.
Si falta el archivo seleccionado, el logo se omite sin usar la otra variante.

**Estado de los recursos:** los dos PNG de portada suministrados tienen contenido
idéntico y a color. El interruptor selecciona correctamente `srl-cover-bw.png`,
pero para una portada monocroma hay que sustituir ese archivo por la versión BW.
El encabezado sí dispone de variantes distintas. Véase [figures/README.md](figures/README.md).

## Numeración de páginas

Se mantiene el número simple en negro, arriba a la derecha, en la misma familia.
La portada cuenta como página 1 sin mostrar el número; la siguiente hoja muestra 2,
haya o no bosquejo. Se corrige así el reinicio anterior tras la portada.

La [recomendación oficial Chicago/Turabian](https://cmosshoptalk.com/2018/06/12/how-do-i-format-margins-and-page-numbers-in-turabian-chicago-style/)
indica esa ubicación, cuenta la portada y presenta numeración simple. No se encontró
una aceptación explícita de «# de #» en las fuentes oficiales consultadas, por lo
que no se añade como formato Chicago. Esto no equivale a afirmar que esté
expresamente prohibido; se podría adoptar como excepción si el docente lo autoriza.
El bosquejo SRL se trata como hoja del ensayo, sin una serie romana independiente.

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

El workflow compila el modelo con los cuatro OTF de Minion Pro y los logos incluidos,
y una copia en la que solo cambia el booleano de color. Comprueba las rutas efectivas
`color`/`bw`; esto no certifica que los píxeles de un archivo BW sean monocromos.
También prueba otra familia instalada, otros OTF locales, la fuente alternativa,
y la ausencia de los PNG seleccionados sin recurrir a los de color. Las copias de
prueba solo se generan en `build/`, excluido de Git.

Revisar visualmente el PDF. Se avisa si bosquejo, introducción, conclusión o
bibliografía exceden una página, sin encoger ni recortar texto. El límite de diez
renglones por párrafo y los requisitos propios del curso requieren revisión.

Véase [la matriz de requisitos](../docs/template-requirements.md).
