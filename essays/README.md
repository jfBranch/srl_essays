# Ensayos

Cada ensayo ocupa una carpeta `AAAA-tema-en-minusculas`, con su propio `main.tex`.

## Iniciar un ensayo

1. Partir de `main` actualizado, después de fusionar los cambios de la plantilla.
2. Crear una rama temporal, por ejemplo `essay/primera-resurreccion`.
3. Copiar `template/` a `essays/2026-la-primera-resurreccion/`, incluidos sus recursos,
   sin `build/` ni los README de la plantilla.
4. Crear un README con los datos del ensayo: título, curso,
   requisitos, commit o etiqueta de la plantilla y estado de redacción. Enlazar
   la [guía de escritura](../template/README.md) sin copiar sus instrucciones.
   La copia conserva su configuración para que las futuras modificaciones de
   la plantilla no alteren el ensayo.
5. Sustituir el contenido de ejemplo siguiendo la [guía de escritura](../template/README.md).
6. Compilar y revisar los avances mediante un PR hacia `main`, según el
   [flujo de trabajo](../docs/workflow.md).

Los requisitos de extensión y fuentes se registran en el README de cada ensayo.
