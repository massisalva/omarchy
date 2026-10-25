# GUI

## Archivos

Files (Nautilus) es el administrador de archivos gráfico. `Super + Shift + F` lo abre, y `Super + Shift + Alt + F` lo abre en la carpeta donde está parada tu terminal, lo que te ahorra un montón de clics. `Ctrl + L` te deja escribir una ruta, y apretando `Space` sobre cualquier archivo ves una vista previa rápida sin abrir nada.

Enchufá un pendrive o una tarjeta SD y se monta solo, así que aparece directamente en la barra lateral. Para cualquier cosa más complicada — formatear una unidad, revisar la salud SMART, crear particiones — abrí _Discos_ desde el lanzador de aplicaciones (`Super + Space`).

El doble clic hace lo que uno espera: las imágenes se abren en imv, los videos en mpv, los PDF en Document Viewer y el texto plano en Neovim.

## Disktree

Cuando el disco se llena y no tenés idea de qué se lo está comiendo, abrí [Disktree](https://github.com/tobi/disktree) desde el lanzador de aplicaciones (`Super + Space`). Muestra un mapa gráfico de tu carpeta personal. Los bloques más grandes ocupan más lugar; entrá a las carpetas con el teclado o el mouse, marcá lo que tiene que irse y revisá lo que elegiste antes de borrar nada. Ejecutá `disktree --disk` para analizar todo el disco.

## Obsidian

[Obsidian](https://obsidian.md/) es una aplicación para tomar notas, gratuita y muy extensible, que guarda todo en archivos Markdown comunes.

Obsidian es gratis para cualquier uso, incluido el personal, el comercial y el sin fines de lucro.

Obsidian también ofrece un [servicio pago de sincronización](https://obsidian.md/sync) con las apps para iOS y Android. (https://obsidian.md/pricing).

Abrís Obsidian con `Super + Shift + O`. Para que siga el tema del sistema, tenés que elegir el tema `Omarchy` en los ajustes.

## Omawrite

[Omawrite](https://github.com/omacom-io/omawrite) es la app de escritura en Markdown súper simple de Omarchy. Sin bóvedas, sin plugins, solo vos y las palabras.

Abrís Omawrite con `Super + Shift + W`.

## Pinta

[Pinta](https://www.pinta-project.com/) es un editor de imágenes básico, ideal para recortar, cambiar el tamaño y otros retoques simples. Eso sí, no esperes una alternativa a Photoshop. ¡Pero igual tiene Varita Mágica y capas!

Abrís Pinta desde el lanzador de aplicaciones (`Super + Space`).

## Aether

[Aether](https://github.com/bjarneo/aether) es una app de temas que puede sacar los colores de una imagen de fondo y convertirlos en un tema completo y coherente. Es la forma más fácil de [hacer tu propio tema](43-making-your-own-theme.md).

Abrís Aether desde el lanzador de aplicaciones (`Super + Space`).

## LocalSend

[LocalSend](https://localsend.org/) te deja mandar archivos a otros dispositivos de la misma red que tengan la app, como el AirDrop de Apple. Pero es multiplataforma, así que podés mandar y recibir archivos de Windows, macOS, Android, iOS y, por supuesto, Linux.

Podés abrir el menú Compartir con `Super + Ctrl + S` o en _Acciones > Compartir_ en el menú de Omarchy. Te da cuatro opciones:

- **Portapapeles** manda lo que hayas copiado como archivo de texto. Ideal para pasar un enlace o un fragmento al celular sin mandarte un mail a vos mismo.
- **Archivo** abre un selector de archivos donde podés elegir varios a la vez.
- **Carpeta** manda una carpeta entera.
- **Recibir** abre LocalSend en sí para que otro dispositivo te pueda mandar algo.

Lo mismo funciona desde la terminal con `omarchy share clipboard`, `omarchy share file [path]` y `omarchy share folder [path]`. Si no ponés la ruta, te aparece el selector.

También podés mandar directo desde el administrador de archivos: hacé clic derecho en cualquier selección en Nautilus y elegí _Send via LocalSend_.

El firewall de Omarchy viene cerrado por defecto salvo el puerto de LocalSend, así que esto funciona de entrada en una instalación nueva. Mirá [seguridad](48-security.md).

## LibreOffice

[LibreOffice](https://www.libreoffice.org/) es un paquete de oficina completo, con procesador de texto, planilla de cálculo, presentaciones, app de dibujo y más. Es compatible con los archivos de Microsoft Office, así que es una gran forma de abrir esos documentos de Word.

Abrís LibreOffice desde el lanzador de aplicaciones (`Super + Space`).

## Hype

[Hype](https://github.com/omacom/hype) es la app de presentaciones súper simple de Omarchy. Tu presentación es un solo archivo Markdown con sus imágenes y videos al lado: escribís cada diapositiva debajo de una vista previa en vivo, las arrastrás para ordenarlas y después presentás a pantalla completa o exportás a PDF y PowerPoint. Hasta toma tu tema de Omarchy.

Abrís Hype desde el lanzador de aplicaciones (`Super + Space`). Apretá `?` adentro para ver todos los atajos.

## Signed

[Signed](https://github.com/omacom/signed) es la forma súper simple de Omarchy de firmar y completar PDFs. Poné tu firma guardada, texto y la fecha de hoy en cualquier parte de una página, y después guardá una copia firmada al lado del original. Mirá [Completar PDFs](27-filling-out-pdfs.md) para ver cómo.

Abrís Signed desde el lanzador de aplicaciones (`Super + Space`), o abrís un PDF con él desde el administrador de archivos.

## Omacalc

[Omacalc](https://github.com/omacom-io/omacalc) es la calculadora súper simple de Omarchy, que se abre en una ventana flotante.

Abrís Omacalc con `Super + Shift + Q` (o con la tecla de calculadora, si tu teclado tiene una).

## Signal

[Signal](https://signal.org/) es el pionero de la mensajería cifrada de punta a punta, y una gran opción para comunicarte si preferís no pasar por uno de los grandes conglomerados tecnológicos.

Abrís Signal con `Super + Shift + G`. No viene en la instalación base, así que la primera vez que lo aprietes, Omarchy te va a ofrecer instalarlo (también está en _Instalar > Servicio_ en el menú de Omarchy).

## mpv

[mpv](https://mpv.io/) es un reproductor multimedia simple y rápido que reproduce casi cualquier cosa, venga de donde venga. Ideal para ver videos.

Abrís mpv desde el lanzador de aplicaciones (`Super + Space`) o simplemente haciendo doble clic en un video en el administrador de archivos.

## Omacut

[Omacut](https://github.com/omacom-io/omacut) es el recortador de video súper simple de Omarchy. Cuando lo único que necesitás es cortar el principio y el final de un clip, le gana por lejos a abrir un editor de video completo.

Abrís Omacut desde el lanzador de aplicaciones (`Super + Space`).

## Monologue

[Monologue](https://github.com/omacom/monologue) es el grabador de webcam súper simple de Omarchy. Elegí la cámara y el micrófono una vez, después apretá `Space` para grabar, y otra vez para pausar y seguir con la misma toma. Siempre graba a la máxima resolución de tu cámara, con un medidor de micrófono en vivo para que revises los niveles antes de arrancar.

Cortá la toma y se abre al toque en un editor integrado. Hacé doble clic en un clip para dividirlo, arrastrá los controles para recortar cada parte y sacá lo que no quieras. Después guardalo como MP4. Tu grabación original se conserva hasta que la descartes, así que siempre podés volver y cortarla de otra manera.

Abrís Monologue desde el lanzador de aplicaciones (`Super + Space`).
