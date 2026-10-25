# Si venís de Mac o Windows

Si pasaste años en macOS o Windows, tus dedos saben cien cosas que tu cerebro ya se olvidó de que alguna vez aprendió. Este capítulo es la capa de traducción: adónde van esos instintos en Omarchy. Las funciones en sí se explican a fondo en otros capítulos — esto es solo el mapa.

### Super es el centro de todo

Toda la memoria muscular que armaste alrededor de Cmd o de la tecla Windows pasa a una sola tecla: Super. Es la tecla Windows en un teclado de PC, y es el ancla de casi todos los atajos de Omarchy.

Tu reflejo de Spotlight, Raycast o el menú Inicio se convierte en `Super + Space`. Eso abre el menú de Omarchy, que abre aplicaciones, cambia ajustes, instala software, captura la pantalla — prácticamente todo. Empezá a escribir para filtrar. `Super + Alt + Space` muestra todas las aplicaciones en una sola grilla, como Launchpad. Mirá [navegación](04-navigation.md).

### No hay dock ni íconos en el escritorio

No hay nada para hacer clic y abrir cosas, ni íconos para acomodar en el escritorio. Las aplicaciones se abren con un atajo (`Super + Return` para la terminal, `Super + Shift + Return` para el navegador y `Super + K` para ver la lista de todo lo que tiene atajo) o desde el menú. La única pieza fija de la interfaz es [la barra superior](05-the-top-bar.md), que cubre lo que antes te resolvían la barra de menús, la bandeja del sistema y el Centro de notificaciones — y casi todos sus widgets hacen algo con clic izquierdo, derecho y del medio.

### Las ventanas se acomodan solas

El cambio de mentalidad más grande: no arrastrás ventanas ni las encajás en mitades de la pantalla. Abrís una ventana y ocupa toda la pantalla. Abrís una segunda y se la reparten. Nunca tenés que rescatar una ventana que quedó abajo de otra, porque las ventanas no se superponen.

Cuando de verdad necesitás una ventana flotante, `Super + T` saca la ventana activa del mosaico (y la vuelve a meter). Pero primero dale una oportunidad en serio al mosaico — es el corazón de todo esto. [Navegación](04-navigation.md) te lo explica paso a paso.

Los espacios de trabajo te van a resultar conocidos: son los Spaces de macOS o los escritorios virtuales de Windows, salvo que acá sí los vas a usar, porque `Super + 1/2/3/4` salta directo a uno y `Super + Shift + 1/2/3/4` manda ahí la ventana activa. Sin demora de animación, solo saltos instantáneos. Así que capaz ni siquiera necesitás varios monitores, si antes estabas acostumbrado a eso.

### Copiar y pegar funciona y listo

En Mac tenías Cmd + C en todos lados. En Windows tenías Ctrl + C en todos lados — menos en la terminal, donde mata tu programa. Omarchy te da `Super + C`, `Super + X` y `Super + V`, y funcionan en todos lados, terminal incluida. No hace falta aprender otro reflejo para la shell.

Gente de Windows: el historial del portapapeles de Win + V está en `Super + Ctrl + V`, y guarda imágenes además de texto. Mirá [portapapeles e historial unificados](08-unified-clipboard-history.md).

### La tabla de traducción

| Lo que buscás | En Omarchy |
| ------------- | ---------- |
| Spotlight / Raycast / menú Inicio | `Super + Space` — el menú de Omarchy |
| AirDrop | LocalSend, con `Super + Ctrl + S` — mirá [GUIs](22-guis.md) |
| Cmd + Shift + 4 / Win + Shift + S | `Super + Ctrl + Alt + C` o `Print Screen` — mirá [capturas y grabación](12-screenshots-recording.md) |
| Centro de notificaciones | Historial de notificaciones en `Super + Shift + Alt + ,` |
| Time Machine (para el sistema) | [Instantáneas del sistema](47-system-snapshots.md) automáticas en cada actualización |
| App Store / descargar un instalador | _Instalar_ en el menú, o `omarchy pkg add` — mirá [otros paquetes](29-other-packages.md) |
| Configuración del sistema / Panel de control | _Configurar_ en el menú, que edita archivos de configuración de texto plano — mirá [dotfiles](31-dotfiles.md) |

### Algunas cosas sí son distintas

Muchos ajustes viven en archivos de texto que editás, no en paneles donde hacés clic. Suena primitivo hasta que te das cuenta de que así cada ajuste se puede ver, copiar a tu próxima máquina y poner bajo control de versiones. El menú _Configurar_ te lleva directo al archivo correcto y, cuando terminás, reinicia lo que haya que reiniciar.

Las actualizaciones llegan con un solo comando — _Actualizar > Omarchy_ — que actualiza Omarchy y todos los paquetes del sistema, sacando antes una instantánea. Nada de actualizadores por aplicación molestándote cuando se les canta. Mirá [actualizaciones](30-updates.md).

El software viene de un gestor de paquetes, no de instaladores descargados.

Y cuando cerrás una ventana, la aplicación se cierra de verdad. No existe ese limbo de macOS donde el programa sigue andando sin ventanas. `Super + W` — o `Super + Q`, si esa es la memoria de dedos que traés — y chau.

### En hardware Mac

Omarchy anda bien en Macs con Intel — mirá [soporte para Mac](44-mac-support.md). Y el teclado te la hace fácil: Omarchy no reasigna nada, y Linux trata la tecla Command como Super, así que Super queda justo donde siempre estuvo Cmd. Tu pulgar ni se va a enterar.

### Dale dos semanas

Los instintos se adaptan más rápido de lo que pensás. Leé una vez por arriba el capítulo de [atajos de teclado](07-hotkeys.md), y cada vez que te olvides de un atajo, apretá `Super + K` — te los muestra todos. Es el único atajo que de verdad tenés que memorizar.
