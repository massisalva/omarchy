# Fondos

Cada tema trae su propio conjunto de fondos, y podés sumar los tuyos en `~/.config/omarchy/backgrounds/[theme]`. Si querés agregar un fondo extra, por ejemplo, al tema nord, solo tenés que poner el archivo en `~/.config/omarchy/backgrounds/nord`.

La forma más fácil es entrar a _Instalar > Estilo > Fondo_ en el menú de Omarchy. Eso abre la carpeta donde se guardan los fondos de ese tema. Apretá `Super + Shift + F` para abrir otro administrador de archivos, buscá tu fondo y copialo. A partir de ahí va a estar entre los fondos que podés ir cambiando con `Super + Ctrl + Space`.

Los fondos pueden ser videos además de imágenes fijas. Tirá un archivo `mp4`, `m4v`, `mov`, `webm`, `mkv` o `avi` en la misma carpeta y aparece junto a las imágenes. Los videos los reproduce el motor de fondos de pantalla OWE. Decodifica el video una sola vez para todos los monitores, reproduce su sonido por la salida de audio predeterminada y pausa la reproducción cada vez que nada lo puede ver. La pantalla de bloqueo dibuja esa misma decodificación, sin sonido, a través de OWE. Igual, un fondo de video gasta mucha más energía que uno fijo.

Los temas pueden traer una intro corta para un fondo fijo. Para `backgrounds/road.webp`, el video que le corresponde vive en `backgrounds/intros/road.mp4`. Se reproduce solo al arrancar y al pasar a un tema que tenga ese fondo elegido, y después vuelve a la imagen fija. Los videos de intro no aparecen en el selector de fondos y nunca se repiten en loop.

Apagar _Acciones > Apariencia > Animaciones_ también apaga las intros de los fondos. Omarchy lo hace por defecto en una máquina virtual. El comando `omarchy theme bg intro toggle` prende y apaga las intros por separado. Actualizar un tema o elegir otro fondo dentro del mismo tema no reproduce ninguna intro.

Hay una colección enorme de fondos geniales y bien elegidos en https://github.com/dharmx/walls.

Los fondos de video dejan una imagen fija guardada en la pantalla de bloqueo mientras la reproducción está en pausa o no está disponible. Los GIF animados se reproducen en el escritorio y muestran un cuadro fijo en la pantalla de bloqueo.
