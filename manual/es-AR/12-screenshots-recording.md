# Capturas de pantalla y grabación

Todo lo que podés capturar de la pantalla sale de la tecla Print Screen. La tecla sola saca una foto, y con modificadores graba, toma un color o saca el texto de una zona. Si tu teclado directamente no tiene tecla Print Screen, `Super + Shift + S` saca la misma captura, y `Super + Ctrl + C` abre todas las opciones como menú.

| Atajo | Función |
| ------ | -------- |
| `Print Screen` | Captura de pantalla |
| `Super + Shift + S` | Captura de pantalla |
| `Alt + Print Screen` | Grabar pantalla (o detener la grabación en curso) |
| `Super + Print Screen` | Selector de color |
| `Super + Ctrl + Print Screen` | Extraer el texto de una zona |
| `Super + Ctrl + C` | Menú de captura |
| `Super + Ctrl + .` | Transcodificar una imagen o un video |

## Capturas de pantalla

Apretá `Print Screen` (o `Super + Shift + S`) y Omasnap captura el monitor con foco antes de mostrar su capa, así nada se te mueve mientras apuntás. Arrastrá para marcar una zona libre, hacé clic en una ventana para capturarla o hacé clic en un espacio vacío para capturar todo el monitor. Apretá `S` antes de marcar para capturar una zona con desplazamiento. ¿Te arrepentiste? Apretá la misma tecla otra vez para cerrar Omasnap.

Cuando marcás una zona, Omasnap guarda la captura, la copia al portapapeles y muestra una vista previa durante 10 segundos. Usá el botón de fijar de la vista previa o `Ctrl + P` para dejarla en pantalla, o elegí Editar para hacerle anotaciones.

El editor de anotaciones puede dibujar flechas, líneas, formas, resaltados, marcadores numerados, texto y tachados seguros; recortar o quitar una parte de la imagen; reconocer su texto con OCR; y ponerle un fondo. En el editor, apretá `Enter` para copiar y guardar el PNG terminado, `Ctrl + C` para copiarlo sin guardarlo o `Ctrl + S` para guardarlo sin copiarlo.

Las capturas guardadas van a `~/Pictures/Screenshots` por defecto, con un nombre como `screenshot-2026-08-13_14-22-05-firefox.png`. Configurá `OMASNAP_SCREENSHOT_DIR` para usar otra carpeta — mirá [las preguntas frecuentes](46-faq.md) para saber dónde poner las variables de entorno de la sesión. Omasnap crea la carpeta cuando guarda la primera captura. Poné `[output] autosave = false` en `~/.config/omasnap/omasnap.conf` para desactivar el guardado automático.

Desde la terminal, `omarchy screenshot` abre la misma capa, y podés elegir el modo con el que arranca: `omarchy capture screenshot region`, `windows`, `fullscreen` o `scroll`. Un segundo argumento, `copy` o `save`, se saltea la vista previa y manda la captura directo a ese destino. Para editarla antes, usá `omarchy screenshot --editor=overlay` para un editor a pantalla completa o `omarchy screenshot --editor=window` para una ventana aparte.

### Manejar la selección con el teclado

Mientras la selección está abierta, no necesitás el mouse para nada:

| Tecla | Función |
| --- | -------- |
| `S` | Activar/desactivar el modo de zona con desplazamiento |
| `Super + Arrow keys` | Moverse entre ventanas en el modo Ventana |
| `Return` | Capturar la ventana resaltada |
| `Ctrl + A` | Capturar todo el monitor con foco |
| `R` | Recuperar la última zona marcada en esta sesión |
| `Esc` | Cerrar Omasnap |

Estos atajos existen solo mientras Omasnap está abierto, así que no pueden chocar con nada de tu configuración.

## Grabación de pantalla

`Alt + Print Screen` abre _Acciones > Capturar > Grabar pantalla_, que te pregunta qué querés en la pista de audio: sin audio, audio del escritorio, escritorio más micrófono, o escritorio más micrófono más webcam. Esta última aparece solo si de verdad tenés una cámara conectada. Elegí una y el selector de grabación de Omarchy te deja marcar una zona o hacer clic en una ventana o un monitor.

La grabación usa gpu-screen-recorder, que codifica en la GPU a 60fps y, si no le queda otra, pasa a la CPU. El resultado es un MP4 en `~/Videos`, con un nombre como `screenrecording-2026-08-13_14-22-05.mp4`. Configurá `OMARCHY_SCREENRECORD_DIR` para cambiarlo — pero ojo: a diferencia de la carpeta de capturas, esta tiene que existir de antes, o la grabación no arranca.

Mientras grabás, aparece un indicadorcito en la barra. Hacé clic ahí para detener. También podés detenerla con `Alt + Print Screen` otra vez, o con la opción _Detener grabación de pantalla_ en _Acciones > Capturar > Grabar pantalla_, que aparece solo mientras hay algo grabándose.

Al detenerla, hace un poco de limpieza antes de darte el archivo: recorta el primer cuadro y, si hay audio, lo normaliza a -14 LUFS y silencia el chasquido de captura de PipeWire del principio. Después aparece una notificación con una miniatura de la grabación. Hacé clic para reproducir el archivo en mpv.

### La webcam superpuesta

Cuando grabás con webcam, la cámara aparece como una ventana vertical, fija y recortada, en la esquina de abajo a la derecha de lo que estés grabando. Si te tapa algo que necesitás, cambiale el tamaño sobre la marcha:

| Atajo | Función |
| ------ | -------- |
| `Super + Alt + [` | Achicar la webcam superpuesta |
| `Super + Alt + ]` | Agrandar la webcam superpuesta |

Hay tres tamaños — chico, mediano y grande — y los atajos pasan de uno a otro. Mediano es el predeterminado. Son proporcionales a la grabación, así que la cámara ocupa la misma porción del cuadro tanto si grabás un monitor 1080p como uno 6K. Y si grabaste una zona en vez de toda la pantalla, la webcam se ancla a la esquina de esa zona y no a la del monitor, así queda dentro de la toma.

También la podés controlar directamente con `omarchy-capture-webcam-resize small`, o `reset` para volver a mediano.

## Texto, códigos QR y colores

`Super + Ctrl + Print Screen` marca una zona y manda su texto al portapapeles con OCR. Eso se explica bien en [Extracción de texto y dictado](11-text-extraction-dictation.md).

_Acciones > Capturar > Código QR_ hace el mismo truco con códigos QR. Marcá la zona donde está el código y el valor decodificado va al portapapeles. Busca solo códigos QR — si no, el contenido denso de la pantalla tiende a confundirse con códigos de barras. Conviene saberlo: el valor decodificado va al portapapeles y a ningún otro lado. No se muestra, no aparece en la notificación y está marcado como sensible para que no quede en el [historial del portapapeles](08-unified-clipboard-history.md). Los códigos QR muchas veces traen secretos — por ejemplo, la URI `otpauth://` detrás de un código para configurar 2FA — y eso no lo querés en un registro. Pegar funciona igual.

`Super + Print Screen` (o _Acciones > Capturar > Color_) convierte el cursor en un gotero. Hacé clic en cualquier cosa de la pantalla y el color queda en el portapapeles. Apretá el atajo otra vez para salir sin elegir.

## Transcodificar antes de compartir

Una grabación de pantalla en 4K o un HEIC crudo de tu celular muchas veces pesan demasiado para mandarlos así nomás. `Super + Ctrl + .` (o _Acciones > Transcodificar_) lo resuelve. Te ofrece un selector de archivos con búsqueda difusa sobre `~/Pictures` y `~/Videos`, y después te pide un formato y un tamaño.

Las imágenes pasan a jpg o png en calidad alta, media o baja, que limitan el ancho a 3160, 2160 y 1080 píxeles. Los videos pasan a mp4 o a gif animado en 4k, 1080p o 720p. El archivo convertido se guarda al lado del original, con la resolución en el nombre — `demo-1080p.mp4` — y la ruta se copia al portapapeles como URI de archivo, así la podés pegar directo en una app que acepte arrastrar archivos.

También funciona desde la terminal, si ya sabés lo que querés: `omarchy transcode ~/Videos/demo.mov mp4 1080p`. Además está `omarchy transcode ascii`, que convierte una imagen en arte ASCII — ese es más que nada para [branding](41-branding.md).

## Mandarlo a algún lado

Una vez que tenés el archivo, `Super + Ctrl + S` abre el menú Compartir y lo manda a otro dispositivo de tu red por LocalSend. Mirá [GUIs](22-guis.md) para eso.
