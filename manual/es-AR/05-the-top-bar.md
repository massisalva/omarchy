# La barra superior

La franja de arriba de la pantalla es la barra de Omarchy. No es una barra de estado agregada a la fuerza, sino parte de la shell de Omarchy: el único proceso de Quickshell, siempre en ejecución, que también dibuja el menú, las notificaciones, los avisos en pantalla (OSD) y la pantalla de bloqueo. Por eso combina perfecto con todo lo demás y por eso un panel se abre al instante en vez de lanzar una aplicación nueva.

También es la única parte del escritorio que está siempre en pantalla, así que vale la pena saber qué hacen todos esos glifitos.

## Qué trae por defecto

La barra tiene tres secciones. A la izquierda están el logo de Omarchy (que abre el menú) y los indicadores de espacios de trabajo. En el centro tenés los indicadores de estado, el reloj, Elsewhen (un reloj mundial), el clima y una insignia de actualización de Omarchy. A la derecha: la bandeja del sistema, la distribución de teclado (cuando hay más de una configurada), agentes, bluetooth, red, audio, pantalla y energía.

Algunos aparecen solo cuando tienen algo para decir. La distribución de teclado aparece solo si configuraste más de una. La insignia de actualización aparece solo cuando hay una actualización de Omarchy esperando. Y el ícono de agentes aparece la primera vez que Omarchy encuentra uso de IA para programar en la máquina (mirá [IA](17-ai.md)).

## A hacer clic

Casi todos los widgets hacen algo con el clic izquierdo, el derecho y el del medio, y varios responden a la rueda del mouse. Esta es la parte que la gente se pierde — en los botones derecho y del medio se esconde mucho de lo bueno.

| Widget | Izquierdo | Derecho | Medio / rueda |
| --- | --- | --- | --- |
| Menú | Menú de Omarchy | Terminal nueva | — |
| Espacios de trabajo | Mostrar ese espacio de trabajo en este monitor | — | Rueda: espacio siguiente/anterior |
| Reloj | Calendario | Cambiar el formato de la etiqueta | Medio: elegir zona horaria |
| Clima | Pronóstico | Clima completo como notificación | Medio: actualizar |
| Audio | Panel de audio | Silenciar | Medio: panel · rueda: volumen |
| Micrófono | Silenciar el micrófono | — | Medio: panel de audio · rueda: volumen de entrada |
| Red | Panel de red | — | — |
| Bluetooth | Panel de Bluetooth | Prender/apagar la radio | — |
| Pantalla | Panel de pantalla | — | Rueda: brillo |
| Energía | Panel de energía | Mostrar/ocultar el porcentaje de batería | — |
| Multimedia | Reproducir/pausar | Portada del disco | Medio: siguiente · rueda: anterior/siguiente |
| Agentes | Panel de agentes | Abrir tu agente | Medio: siguiente suscripción |
| Bandeja | Pasá el cursor para abrir el cajón | Derecho en la flechita para administrar | — |
| Actualización de Omarchy | Ejecutar la actualización | — | — |

No todo lo de esa tabla viene en la barra de entrada. El widget de multimedia (lo que está sonando según MPRIS, con el tema y el artista desplazándose) y el widget de micrófono vienen incluidos pero apagados por defecto — agregalos si los querés, como se explica más abajo.

## Los paneles

Al hacer clic en un ícono de la barra se abre un panel, que es una ventanita en serio, con deslizadores, listas y navegación con teclado, no un simple tooltip. Cada uno tiene además su atajo, así nunca tenés que apuntarle a un glifo de 16 píxeles:

| Atajo | Panel |
| --- | --- |
| `Super + Ctrl + A` | Audio |
| `Super + Ctrl + N` | Red |
| `Super + Ctrl + B` | Bluetooth |
| `Super + Ctrl + D` | Pantalla |
| `Super + Ctrl + P` | Energía |
| `Super + Ctrl + Alt + D` | Calendario |
| `Super + Ctrl + Alt + E` | Reloj mundial |
| `Super + Ctrl + 1-9` | Abrir/cerrar el panel número n de la sección derecha |

Los paneles no son solo para mirar. Ahí es donde hacés las cosas de verdad:

- **Audio** tiene un deslizador de volumen general, un selector de dispositivo de salida y un mezclador por aplicación, así podés bajarle el volumen a esa pestaña del navegador sin tocar todo lo demás.
- **Red** busca redes Wi-Fi, muestra la intensidad de la señal, se conecta y te deja elegir un proveedor de DNS.
- **Bluetooth** lista tus dispositivos con conectar/desconectar y nivel de batería.
- **Energía** muestra estadísticas de la batería, cambia de perfil de energía (recuerda una elección distinta para batería y para enchufado) y muestra algo de información del sistema.
- **Pantalla** trae un deslizador de brillo, tamaño de texto, escalas predefinidas para el monitor y — cuando tenés más de una pantalla — controles por monitor. Mirá [monitores](33-monitors.md) para la historia completa.
- **Reloj** abre una grilla del mes con números de semana ISO y botones para cambiar de mes.
- **Reloj mundial** tiene una fila por ciudad, con su clima y cómo le va yendo el día. La búsqueda encuentra pueblos y ciudades además de zonas horarias, así que Fort Lauderdale es Fort Lauderdale y no Nueva York. Si la línea de arriba nombra la ciudad equivocada, hacé clic y decí dónde estás; si elegís un lugar con otra zona horaria, el reloj del sistema también se mueve ahí, algo práctico cuando viajás. Pasá el mouse por una ciudad y hacé clic en el botón de persona para decir quién vive ahí: nombres comunes, o usuarios de GitHub con `@` para que aparezcan sus caras.

Todos los paneles se manejan tanto con el teclado como con el mouse: las flechas mueven, Return activa, Tab pasa al panel de al lado y Escape cierra.

`Super + Ctrl + 1-9` cuenta los paneles de izquierda a derecha en la sección derecha, salteando la bandeja porque no tiene panel propio. Así el número coincide con el ícono al que apuntarías.

### Tailscale y Dropbox

Hay dos widgets más que aparecen en la barra solo cuando instalás el servicio correspondiente desde **Instalar → Servicio**, y conviene conocerlos porque hacen más que mostrar un estado.

El panel de **Tailscale** conecta y desconecta la tailnet, cambia de cuenta y elige un nodo de salida (en esa lista aparecen tanto tus máquinas como las regiones de Mullvad). También te deja recorrer tus máquinas — y con una elegida, `s` le manda archivos por Taildrop, que es la forma más rápida de pasar un archivo a tu celular o a otra notebook. `c` copia la IP de la máquina, `n` su nombre y `d` su nombre DNS completo. Si preferís hacer clic, cada máquina tiene también un botón de enviar. Lo mismo desde la terminal es `omarchy tailscale send <machine> [file...]`.

El panel de **Dropbox** se encarga del inicio de sesión, muestra cuánto almacenamiento usaste y lista los archivos sincronizados hace poco.

Si desinstalás cualquiera de los dos servicios, su widget desaparece de la barra.

## Indicadores

El grupito del centro es el widget de indicadores. Son glifos de estado para los modos que activaste: no molestar, luz nocturna, un [recordatorio](09-reminders.md) pendiente, una grabación de pantalla en curso, mantener activo y [dictado](11-text-extraction-dictation.md). Se prenden cuando el modo está activo y, si no, no molestan — pasá el cursor por cualquier parte de la barra para ver los que están apagados. Hacer clic en un indicador activa o desactiva ese modo. Hay uno más que solo muestra estado: una sesión remota se prende en rojo mientras alguien está conectado a esta máquina por gliff.

Si preferís que estén siempre visibles, poné `alwaysShow` en `true` en el widget. Y si solo te interesan algunos, listá los que querés en `items`: `["Dnd", "Reminder", "NightLight"]`. Podés tener más de un widget de indicadores, así cada sección muestra un grupo distinto.

## Reacomodar la barra

La barra se configura sola. No hace falta abrir ningún archivo de configuración para mover cosas.

Agarrá un pedazo vacío de la barra, cerca del centro, y arrastralo hacia otro borde de la pantalla: la barra se muda ahí — izquierda, derecha, arriba o abajo, y cada widget se adapta (las barras verticales pasan a versiones compactas, solo con íconos). Hacer clic y mantener apretado arranca el mismo arrastre. Hacé doble clic izquierdo en ese mismo espacio vacío para que el fondo de la barra vaya de transparente a cristalino a opaco. Y arrastrá cualquier widget para reordenarlo o mandarlo a otra sección; los demás widgets se corren para hacerle lugar donde va a caer.

El medio de la barra es una caja: lo que esté adentro queda centrado como un solo grupo, y los widgets de cada lado se cuelgan de sus bordes. Mientras arrastrás un widget, la caja se ve como un contorno, o como una línea a lo ancho de la barra cuando está vacía, y podés soltarlo adentro o al costado. Cuando el widget va a caer en la caja, la caja se agranda para recibirlo.

Un widget que querés tener a mano pero no siempre a la vista puede ir en el cajón de la bandeja: arrastralo sobre la bandeja y el cajón se abre para recibirlo. Queda ahí, después de los íconos de las aplicaciones, aparece cada vez que se abre el cajón y lo mantiene abierto mientras su panel esté abierto. Arrastralo de vuelta a la barra para devolverlo a su lugar.

Si preferís elegir desde un menú, **Apariencia → Barra de menú** tiene la posición, y **Fondo de barra** elige cómo se dibuja la barra: **Barra opaca**, **Barra cristalina** (translúcida, con lo de atrás desenfocado) o **Barra transparente**.

Todo esto también tiene comandos, que es lo que te conviene para una configuración con [dotfiles](31-dotfiles.md):

```bash
omarchy bar position bottom
omarchy bar background glassy  # opaque, glassy, none, or cycle
omarchy bar move omarchy.weather --section centerBegin --index 0
omarchy bar move omarchy.bluetooth --section tray  # into the tray's drawer
omarchy bar set omarchy.clock format "HH:mm"
omarchy bar defaults          # back to the shipped layout
```

Para agregar o sacar un widget del todo, usá los comandos de plugins. `omarchy plugin list` muestra todos los widgets que conoce la shell con su id, y después:

```bash
omarchy plugin enable omarchy.media --section centerEnd
omarchy plugin disable omarchy.weather
```

## Ocultar la barra

`Super + Shift + Space` oculta la barra y la vuelve a mostrar sin cerrar la shell — los paneles y los atajos siguen andando, solo recuperás esos píxeles. También está en el menú, en **Apariencia → Barra de menú → Ocultar barra**.

## El archivo de configuración

Todo se guarda en `~/.config/omarchy/shell.json`, bajo la clave `bar`. Acá tenés una versión recortada:

```json
{
  "version": 1,
  "bar": {
    "position": "top",
    "background": "opaque",
    "layout": {
      "left": [{ "id": "omarchy.menu" }, { "id": "omarchy.workspaces" }],
      "centerBegin": [{ "id": "omarchy.indicators" }],
      "center": [{ "id": "omarchy.clock", "format": "HH:mm" }],
      "centerEnd": [{ "id": "omarchy.weather" }],
      "right": [{ "id": "omarchy.audio" }, { "id": "omarchy.power" }]
    }
  }
}
```

Cada widget es una entrada en uno de los cinco arreglos de `layout`, y sus ajustes van directamente en esa entrada — no hay un archivo de ajustes aparte ni un subobjeto `config`. El `format` del reloj, el `formatAlt` (al que cambia el clic derecho) y el `verticalFormat` están todos ahí mismo, en `{ "id": "omarchy.clock" }`.

`center` es la caja del medio de la barra: todo lo que tenga adentro queda centrado en la pantalla como un solo grupo. `centerBegin` y `centerEnd` se cuelgan a cada lado de la caja, y así el reloj queda clavado en el centro aunque el clima y la insignia de actualización aparezcan y desaparezcan. Si ponés más de un widget en `center`, se centran juntos; si lo dejás vacío, `centerBegin` y `centerEnd` se juntan en el medio de la barra.

Una regla que conviene tener clara: **una vez que tenés tu propio `shell.json`, ese es el que manda**. Hasta que personalices algo, la shell lee el archivo predeterminado de Omarchy. En cuanto arrastrás un widget, ejecutás `omarchy bar` o editás el archivo a mano, pasa a ser tuyo — no hay fusión profunda, así que los widgets predeterminados nuevos de futuras versiones de Omarchy no van a aparecer solos en tu barra. `omarchy bar defaults` vuelve a poner la distribución original cuando quieras empezar de cero.

El mismo archivo también guarda tus tiempos de inactividad en el nivel superior, fuera de la clave `bar`: `idle.screensaver` e `idle.lock`, los dos en segundos desde que quedaste inactivo. Así, por defecto, el salvapantallas arranca a los 150 segundos y el bloqueo a los 300.
