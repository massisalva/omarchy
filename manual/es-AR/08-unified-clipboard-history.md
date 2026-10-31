# Portapapeles e historial unificados

En Linux, normalmente necesitás `Ctrl + Shift + C/V` para copiar y pegar en la terminal y `Ctrl + C/V` para hacerlo en cualquier otro lado. ¡Eso cuesta muchísimo si no naciste y te criaste en Linux! Y lo mismo pasa con el cambio de super a ctrl, si venís de Mac.

Omarchy resuelve los dos problemas con atajos de portapapeles unificados que funcionan (casi) en todos lados. Son estos:

| Atajo | Comando |
| ------- | ----------- |
| Super + A | Seleccionar todo |
| Super + C | Copiar |
| Super + X | Cortar |
| Super + V | Pegar |
| Super + Ctrl + V | Historial del portapapeles |

_Tené en cuenta que la mayoría de los entornos de agentes usan `Ctrl + V` para pegar imágenes, pero `Super + V` para pegar texto._

Usá `Super + A` y después `Super + C` para copiar todo lo que haya en un campo de texto o en otra app que acepte `Ctrl + A`. En una terminal, `Ctrl + A` te lleva al principio de la línea de comandos en vez de seleccionar el texto.

### Historial del portapapeles

El historial del portapapeles viene con la shell de Omarchy y funciona tanto para texto como para imágenes. Lo abrís con `Super + Ctrl + V`, elegís la entrada con Enter y queda en el portapapeles, lista para pegar con `Super + V`.

 ![clipboard-history](images/clipboard-history.webp)

También podés buscar en el historial con solo empezar a escribir:

 ![clipboard-history-search](images/clipboard-history-search.webp)
