# Interruptores, inactividad y salvapantallas

Mucho de lo que cambiás día a día no es realmente un ajuste. Es un modo que prendés por una hora y después apagás: luz nocturna cuando trabajás hasta tarde, no molestar mientras presentás, mantener activo mientras mirás algo. Omarchy los llama interruptores (toggles), y todos funcionan igual — un atajo, una opción del menú y un comando, que mueven el mismo interruptor.

### El menú Alternar

`Super + Ctrl + O` abre directamente _Acciones > Alternar_, o podés llegar ahí desde el menú de Omarchy (`Super + Space`). Todo lo de esa lista es un interruptor que podés prender o apagar sin pensar dónde se guarda el estado. Al lado, en _Acciones > Apariencia_, están los interruptores de cómo se ve el escritorio.

Desde la terminal, los mismos interruptores son `omarchy toggle <thing>`. Ejecutá `omarchy toggle` solo para ver todo el grupo.

| Interruptor | Atajo | Comando |
| ------ | ------ | ------- |
| Luz nocturna | `Super + Ctrl + N` | `omarchy toggle nightlight` |
| Silenciar notificaciones | `Super + Ctrl + ,` | `omarchy toggle notification silencing` |
| Mantener activo (sin bloqueo por inactividad) | `Super + Ctrl + I` | `omarchy toggle idle` |
| Captura de fallos | — | `omarchy toggle crash-capture` |
| Salvapantallas | — | `omarchy toggle screensaver` |
| Sincronizar el tema de [Herdr](https://herdr.dev) | — | `omarchy toggle theme sync` |
| Barra de menú | `Super + Shift + Space` | `omarchy toggle bar` |
| Touchpad | `XF86TouchpadToggle` | `omarchy toggle touchpad` |
| Pantalla táctil | — | `omarchy toggle touchscreen` |
| Suspender | — | `omarchy toggle suspend` |
| GPU híbrida | — | `omarchy toggle hybrid gpu` |

Los interruptores de touchpad, pantalla táctil y GPU híbrida están en _Acciones > Hardware_ (`Super + Ctrl + H`) y no en Alternar, porque aparecen solo cuando de verdad tenés ese hardware. Los de touchpad y pantalla táctil sobreviven a una recarga de Hyprland — el nombre del dispositivo desactivado se guarda en un pequeño archivo de estado que Hyprland lee al arrancar para volver a desactivarlo.

_Acciones > Apariencia_ tiene la barra de menú y las animaciones, más algunas cosas que no son comandos `omarchy toggle` pero se comportan igual: el porcentaje de batería en la barra, la distribución predeterminada de los espacios de trabajo, los espacios entre ventanas (`Super + Shift + Backspace`) y el formato cuadrado con una sola ventana (`Super + Ctrl + Backspace`).

La mayoría son simplemente un archivo marcador en `~/.local/state/omarchy/toggles/`. Si querés hacer algo distinto según uno de ellos en un script, `omarchy-toggle-enabled` te da un código de salida en vez de obligarte a ir a buscarlo:

```bash
omarchy-toggle-enabled screensaver-off && echo "screensaver is off"
```

Los marcadores llevan el nombre del estado apagado — `screensaver-off`, `suspend-off`, `bar-off` — así que si existen, la función está desactivada.

### Indicadores en la barra

Cuando un modo está prendido, aparece un glifito en el medio de la barra superior, al lado del reloj. Es el widget de indicadores, y muestra dictado, grabación de pantalla, recordatorios pendientes, luz nocturna, no molestar y mantener activo.

Los indicadores apagados están ocultos. Pasá el cursor por cualquier parte de la barra y aparecen atenuados, así podés hacer clic en uno para prenderlo sin saberte el atajo. Si hacés clic en uno prendido, se apaga. Si preferís verlos todos siempre, poné `alwaysShow` en `true` en la entrada `omarchy.indicators` de `~/.config/omarchy/shell.json` — mirá [la barra superior](05-the-top-bar.md) para ver cómo se configuran los widgets de la barra.

### Luz nocturna

`Super + Ctrl + N` vuelve más cálida la pantalla, a 4000K, y si lo apretás otra vez vuelve a 6500K. Lo maneja hyprsunset, que el interruptor arranca por vos si todavía no está corriendo.

Por defecto, hyprsunset no le hace absolutamente nada a la pantalla. `~/.config/hypr/hyprsunset.conf` viene con un perfil neutro justamente para que la pantalla quede intacta hasta que pidas calidez. Si preferís que cambie según la hora, reemplazalo por un perfil horario:

```
profile {
    time = 20:00
    temperature = 4000
}
```

Después hacé que hyprsunset arranque al iniciar sesión agregando `o.launch_on_start("hyprsunset")` a `~/.config/hypr/autostart.lua`. El par 4000K/6500K que usa el interruptor es fijo, así que si querés otra temperatura, el archivo de configuración es el lugar.

### No molestar

`Super + Ctrl + ,` silencia las notificaciones. Mientras está prendido no aparece ningún aviso, y el indicador de la campana tachada queda en la barra para recordarte por qué el escritorio está tan callado.

Igual no se pierde nada. Una notificación silenciada se guarda directamente en tu historial de notificaciones, que es justo el registro que querés cuando volvés y te preguntás qué te perdiste. Abrilo con `Super + Shift + Alt + ,`. Mirá [avisos](10-notices.md) para el resto de la historia de las notificaciones.

Hay dos tipos de mensaje que pasan igual: los avisos de confirmación de Omarchy por algo que acabás de hacer ("Theme changed", "Screenshot saved") y las alertas críticas enviadas desde la línea de comandos. Las apps de chat que marcan todo como crítico para meterse delante tuyo no cuentan.

### Inactividad

La shell de Omarchy se encarga del comportamiento por inactividad, y los tiempos están en un bloque `idle` en el nivel superior de `~/.config/omarchy/shell.json`:

```json
{
  "version": 1,
  "idle": {
    "screensaver": 150,
    "lock": 300
  }
}
```

Los dos números son segundos contados desde que quedaste inactivo — no uno a partir del otro. Así que, con los valores predeterminados, el salvapantallas aparece a los dos minutos y medio y la pantalla de bloqueo toma el control a los cinco, haya aparecido el salvapantallas o no. Guardá el archivo y la shell toma los tiempos nuevos al instante.

Si cerrás el salvapantallas antes del momento del bloqueo, eso cuenta como actividad y el bloqueo pendiente se cancela. No te quedás afuera por echarle un vistazo a la máquina.

Para que deje de bloquearse por inactividad del todo, `Super + Ctrl + I` — o `omarchy toggle idle` — prende mantener activo, y aparece en la barra el indicador de la taza de café. Es el que conviene apretar antes de una presentación larga o de una compilación que querés seguir. Apretalo otra vez para volver a lo normal. `omarchy toggle idle status` muestra el estado actual como JSON, por si lo necesitás desde un script.

Esto es sobre el bloqueo y el salvapantallas, no sobre la energía. Suspender e hibernar tienen su propia configuración en [suspensión del sistema](36-system-sleep.md).

### El salvapantallas

El salvapantallas de Omarchy es arte ASCII pasando por efectos de texto aleatorios, uno por monitor. Cualquier tecla o movimiento del mouse lo cierra.

Podés arrancarlo cuando quieras desde _Sistema > Salvapantallas_ (`Super + Esc`), que lo muestra aunque hayas apagado el salvapantallas por inactividad. Por defecto no tiene atajo.

`omarchy toggle screensaver` es lo que apaga el de inactividad, si preferís pasar directo de trabajar a bloqueado. Necesita una terminal que sepa configurar — Alacritty, Foot, Ghostty o Kitty — y te avisa si tu terminal predeterminada es otra.

El logo que dibuja lo podés cambiar en _Estilo > Salvapantallas_. Subí un png o un svg y Omarchy lo convierte a ASCII. Mirá [branding](41-branding.md).

### La pantalla de bloqueo

`Super + Ctrl + L` bloquea la máquina. Eso abre la pantalla de bloqueo de la shell de Omarchy, apaga la pantalla, vuelve tu distribución de teclado a la primera para que no escribas la contraseña en el alfabeto equivocado y — si lo tenés abierto — bloquea 1Password de paso.

La pantalla de bloqueo acepta una contraseña, y también una huella digital una vez que configures una. Eso, y las demás formas de autenticarte, se explican en [autenticación por hardware](37-hardware-authentication.md).
