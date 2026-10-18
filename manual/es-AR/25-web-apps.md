# Web apps

Podés agregar tus propias web apps con _Instalar > Aplicación web_ en el menú de Omarchy (`Super + Space`). Te va a pedir el nombre de la app, su URL y la URL del ícono, si no lo puede sacar del favicon. Hay íconos PNG buenísimos para muchas web apps populares en [Dashboard Icons](https://dashboardicons.com).

Después vas a encontrarlas en el lanzador de aplicaciones (`Super + Space`), y usan la hermosa ventana de web app sin bordes.

Si querés sacar una web app, andá a _Eliminar > Aplicación web_ en el menú de Omarchy.

Conviene que inicies sesión en todas tus cuentas con un navegador común antes de usar los atajos de las web apps. El marco finito que las envuelve no se lleva bien con 1password, así que es más fácil haber iniciado sesión directamente antes.

Todos los atajos de teclado de estas web apps se pueden cambiar en `~/.config/hypr/bindings.lua`.

Cuando estás en una web app, podés copiar la URL actual al portapapeles con `Shift + Alt + L`.

Omarchy ya viene de fábrica con un surtido de apps:

## HEY

[HEY](https://www.hey.com/) es un servicio de mail y calendario que es una gran alternativa para la gente cansada de Gmail, Outlook o Apple Mail. Lo hace [37signals](https://37signals.com/), donde nació Omarchy.

Abrís HEY Email con `Super + Shift + E`, vas directo a escribir un mail nuevo con `Super + Shift + Alt + E` y abrís HEY Calendar con `Super + Shift + C`.

## Basecamp

[Basecamp](https://basecamp.com/) es un servicio de gestión de proyectos que ayuda a los equipos chicos a moverse más rápido y avanzar más. En vez de emparchar una mezcla de Trello, Slack, Asana, Notion o lo que sea, tenés todo en un solo lugar con Basecamp. Lo hace [37signals](https://37signals.com/), donde nació Omarchy.

Abrís Basecamp desde el lanzador de aplicaciones (`Super + Space`)

## ChatGPT

[ChatGPT](https://chatgpt.com) es el chatbot de IA más popular del mundo.

Abrís ChatGPT con `Super + Shift + A`.

## Grok

[Grok](https://grok.com) es el chatbot de xAI.

Abrís Grok con `Super + Shift + Alt + A`.

## WhatsApp

[WhatsApp](https://www.whatsapp.com/) es uno de los servicios de mensajería más populares del mundo, y la versión web es una gran opción para Linux.

Abrís WhatsApp con `Super + Shift + Alt + G`.

## Apps de Google

Google Messages, Google Photos, Google Maps y Google Contacts también vienen como web apps.

Abrís Google Messages con `Super + Shift + Ctrl + G`, Google Photos con `Super + Shift + P` y Google Maps con `Super + Shift + Alt + S`. Google Contacts está en el lanzador de aplicaciones (`Super + Space`).

## X

X es donde salen primero las noticias.

Abrís X con `Super + Shift + X` y vas directo a escribir un posteo nuevo con `Super + Shift + Alt + X`.

## YouTube

[YouTube](https://youtube.com/) es la plataforma de video más popular del mundo.

Abrís YouTube con `Super + Shift + Y`.

## Zoom

[Zoom](https://zoom.us/) es el sistema de videollamadas más usado en Estados Unidos. Muy buenas conexiones en todo el mundo. Y se pueden hacer reuniones de 40 minutos sin cuenta paga. Omarchy envuelve el cliente web de Zoom, y los enlaces a reuniones de Zoom se abren directo ahí.

Abrís Zoom desde el lanzador de aplicaciones (`Super + Space`).

## Discord

[Discord](https://discord.com/) es donde se junta la mayoría de las comunidades de videojuegos y de código abierto, incluida [la de Omarchy](https://discord.gg/tXFUdasqhY).

Abrís Discord desde el lanzador de aplicaciones (`Super + Space`).

## Apps de Microsoft

Elegí _Instalar > Servicio > Microsoft_ para agregar Outlook, Word, Excel, PowerPoint, Teams y OneDrive como web apps. Cada app tiene su propio lanzador y se abre directamente, con las URLs comerciales de Microsoft 365 y el perfil de navegador que ya tenés. Se abren en las mismas ventanas de navegador que las demás web apps de Omarchy; no instalan el cliente aparte de Teams para Linux.

Sacá el paquete completo con _Eliminar > Servicio > Microsoft_, o apps sueltas con _Eliminar > Aplicación web_. También podés instalar solo las apps que quieras con _Instalar > Aplicación web_.

Para una nube gubernamental o soberana, editá la URL en la línea `Exec=` del lanzador que corresponda en `~/.local/share/applications/`, como `Microsoft Teams.desktop`, con la URL que te dé tu organización. Escribí cualquier `%` literal de esa línea como `%%`. Los cambios se aplican la próxima vez que la abras. Si volvés a ejecutar el instalador del paquete, sus lanzadores vuelven a las URLs predeterminadas.

Para mantener separados los inicios de sesión del trabajo, agregá una carpeta de datos del navegador a la línea `Exec=` de cada lanzador:

```ini
Exec=omarchy-launch-webapp "https://teams.cloud.microsoft/" --user-data-dir=/absolute/path/to/work-browser-profile
```

Reemplazá la carpeta de ejemplo por una ruta absoluta que elijas y usá la misma ruta en los seis lanzadores para que compartan los inicios de sesión del trabajo. Las web apps usan el navegador compatible que tengas elegido en Omarchy, y si el navegador predeterminado no es compatible, usan Chromium.
