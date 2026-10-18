# Navegadores

Omarchy viene con [Chromium](https://www.chromium.org/) como navegador predeterminado. Es la versión simple de código abierto, con un tema que combina con el resto del sistema, y es lo que abre `Super + Shift + Return` y dentro de lo que corre cada [web app](25-web-apps.md).

Si Chromium no te convence, no estás obligado a usarlo. En _Instalar > Navegador_, en el menú de Omarchy, vas a encontrar Chrome, Edge, Brave, Brave Origin, Firefox y [Zen](https://zen-browser.app/). Elegí uno y Omarchy lo instala, configura su carpeta de políticas y le aplica tu tema actual.

## Hacerlo predeterminado

Instalar un navegador no lo convierte en el predeterminado. Una vez que está en la máquina, andá a _Configurar > Predeterminados > Navegador_ y elegilo: el menú lista solo los navegadores que de verdad tenés instalados, y marca el predeterminado actual con un tilde.

Desde la terminal es:

```bash
omarchy default browser firefox
```

Ejecutalo sin argumento y te dice cuál es el predeterminado. Esto define el manejador XDG, así que no son solo los atajos de Omarchy los que siguen el cambio: cualquier cosa que abra un enlace, desde una app de chat hasta un comando de terminal, va al navegador que elegiste.

## Copiar URL y descargar video

Los navegadores de la familia Chromium (el propio Chromium, Chrome, Edge y Brave) vienen con dos extensiones de Omarchy que se salen del navegador y llegan al resto del sistema.

**Copy URL** copia la dirección de la pestaña actual al portapapeles con `Alt + Shift + L`. Es más rápido que hacer clic en la barra de direcciones y copiar, y como pasa por el portapapeles del sistema y no por el del navegador, te llega una notificación de Omarchy que lo confirma y la URL queda disponible al instante en el [historial del portapapeles](08-unified-clipboard-history.md) y en todas las demás apps. También tiene un botón en la barra de herramientas, si preferís hacer clic.

**Download Video** baja el video que se está reproduciendo en la página que estás mirando con `Alt + Shift + D`. Le pasa la URL a [yt-dlp](https://github.com/yt-dlp/yt-dlp), así que funciona en mucho más que YouTube, y la descarga va a `~/Videos`. El progreso aparece en el mismo indicador en pantalla que usan el volumen y el brillo, que se actualiza ahí mismo en vez de apilar notificaciones. Definí `OMARCHY_YTDLP_DIR` si preferís que los archivos vayan a otro lado; mirá las [preguntas frecuentes](46-faq.md) para saber dónde poner las variables de entorno.

Las dos extensiones hablan con Omarchy a través de un pequeño host de mensajería nativa, que se instala junto con el navegador. Esa es la pieza que hace que el video de una página web termine en tu carpeta personal y que una URL termine en tu administrador de portapapeles, algo que una extensión común no puede hacer sola.

Son solo para la familia Chromium. Firefox y Zen no las tienen.

## Firefox y Zen

Firefox y Zen son otra familia, así que reciben otro trato: Omarchy instala un archivo de políticas con valores predeterminados razonables y los pasa a modo Wayland nativo, que es lo que querés para el escalado fraccional y un desplazamiento suave con el touchpad.

No tienen las extensiones de Chromium de arriba, y Omarchy no les aplica el tema, así que esas partes de la experiencia las tenés que configurar vos.

## Volver a sacarlo

Todo lo que hayas instalado acá se puede sacar en _Eliminar > Navegador_. Chromium no está en esa lista: es parte del sistema base.
