# Teclado, mouse y touchpad

Hyprland te deja configurar todos tus dispositivos de entrada con muchísimo detalle. Podés hacer que la repetición del teclado sea supersónica o que el touchpad use desplazamiento natural. Todo eso se cambia en `~/.config/hypr/input.lua`, al que también llegás desde _Configurar > Entrada_ en el menú de Omarchy (`Super + Space`). Lo que pongas ahí reemplaza los valores predeterminados de Omarchy.

Acá tenés un ejemplo:

```lua
hl.config({
  input = {
    -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt
    kb_layout = "us,dk",
    kb_options = "omarchy:shift_caps_compose,grp:alts_toggle",

    -- Change speed of keyboard repeat
    repeat_rate = 40,
    repeat_delay = 600,

    -- Increase sensitivity for mouse/trackpad (default: 0)
    sensitivity = 0.35,

    touchpad = {
      -- Use natural (inverse) scrolling
      natural_scroll = true,

      -- Use two-finger clicks for right-click instead of lower-right corner
      clickfinger_behavior = true,

      -- Control the speed of your scrolling
      scroll_factor = 0.3,
    },
  },
})

-- Scroll faster in the terminal
o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
```

Podés [ver todas las opciones de entrada](https://wiki.hypr.land/Configuring/Basics/Variables/#input) en la wiki de Hyprland.

CapsLock funciona como un Bloq Mayús común, y `Shift + CapsLock` es la tecla de composición para los [emojis rápidos](07-hotkeys.md#quick-emojis) y [otros autocompletados](07-hotkeys.md#quick-completions). Si preferís tener la tecla de composición en otro lado, reemplazá `omarchy:shift_caps_compose` en `kb_options`. Por ejemplo, esto pasa la tecla de composición a Right Alt:

```lua
hl.config({
  input = {
    kb_options = "compose:ralt",
  },
})
```

### Gestos del touchpad

Deslizá los dedos en el touchpad para moverte por el escritorio:

| Gesto | Acción |
| --- | --- |
| Tres dedos a la izquierda / derecha | Espacio de trabajo anterior / siguiente, incluidos los vacíos |
| Tres dedos hacia arriba | Mostrar/ocultar la consola Quake |
| Tres dedos hacia abajo | Abrir el menú de Omarchy |
| Cuatro dedos a la izquierda / derecha | Mover la ventana activa al espacio de trabajo anterior / siguiente |
| Cuatro dedos hacia abajo | Activar/desactivar la pantalla completa |

Para cambiar uno, anulalo en `~/.config/hypr/input.lua` antes de agregar tu propio [gesto del touchpad](https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/), porque Hyprland no acepta dos gestos con los mismos dedos y la misma dirección:

```lua
hl.gesture({ fingers = 3, direction = "up", action = "unset" })
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen" })
```

Para apagar todos los gestos de Omarchy, poné `omarchy_default_gestures = false` cerca del principio de `~/.config/hypr/hyprland.lua`, antes de que se carguen los valores predeterminados de Omarchy.

En las notebooks Dell XPS con touchpad háptico, también podés poner la fuerza del clic en baja, media o alta en _Acciones > Hardware > Respuesta háptica_.

### Escribir en chino, japonés y otros idiomas

Elegí japonés, coreano, chino (simplificado, Pinyin), Taiwán (Zhuyin) o Hong Kong (Cangjie) cuando el instalador te pregunte por el teclado. Omarchy configura solo el teclado y el motor de entrada que corresponde, incluso durante la configuración sin conexión del primer arranque. El japonés usa Mozc, el coreano usa Hangul estándar de dos juegos, el chino simplificado usa Pinyin, Taiwán usa la disposición Zhuyin estándar de Chewing y Hong Kong usa Cangjie con las formas de caracteres de Hong Kong. Japonés (teclado US) trae Mozc con una distribución de teclado US. Las teclas de Hangul, Zhuyin y Cangjie quedan en sus posiciones estándar aunque escribas letras latinas con Dvorak, Colemak o AZERTY. Si agregaste Hangul o Chewing antes de esto, sacalo y volvé a elegirlo en _Configurar > Escritura > Métodos de entrada_ para que sus teclas pasen ahí; Omarchy no toca un motor con el que ya escribís.

La escritura arranca en modo latino. Apretá `Super + I` para recorrer los métodos de entrada configurados, y `Super + Shift + I` para recorrerlos hacia atrás. Tocá `Shift` solo para salir de un método de entrada como Pinyin a letras latinas, y tocalo otra vez para volver, como en Sogou, Microsoft Pinyin y macOS; `Shift` más una letra sigue escribiendo una mayúscula. En los teclados japoneses, 全角/半角 prende y apaga la entrada, 変換 la prende y 無変換 la apaga. Con coreano, 한/영 cambia a Hangul y 한자 convierte a Hanja, tanto si tu teclado tiene teclas propias para eso como si manda Right Alt y Right Ctrl en su lugar, como hacen muchas notebooks, así que ahí Right Alt y Right Ctrl no son modificadores comunes; el dictado mientras mantenés apretado sigue en F9. `Ctrl + Space` sigue libre para Tmux y Herdr; `Shift + CapsLock` sigue siendo la tecla de composición.

El indicador de teclado aparece a la derecha de la barra cuando tenés varias distribuciones de teclado o métodos de entrada. Hacé clic para cambiar el idioma de entrada; el japonés muestra あ para hiragana. Para elegir entre caracteres japoneses, pasá a japonés, escribí una palabra como `nihongo` y apretá Space dos veces. Apretá Enter para aceptar. Si además tenés varias distribuciones de teclado, hacé clic derecho en el indicador para recorrerlas.

Usá _Configurar > Escritura > Teclados_ para elegir distribuciones como inglés y francés, entre las mismas opciones que ofrece la instalación. Usá _Configurar > Escritura > Métodos de entrada_ para elegir qué motores de composición están activos. Los dos selectores se abren dentro del menú de Omarchy con lo que tenés elegido ya marcado. Hacé clic o apretá Enter para marcar o desmarcar una opción; cada cambio se aplica al instante. Desmarcar un método de entrada lo saca del ciclo sin desinstalarlo; el teclado sigue disponible.

Ejecutá `omarchy setup keyboard` o `omarchy setup input` para abrir los mismos selectores. Para sumar un idioma desde la línea de comandos, usá `omarchy setup input mozc`, `hangul`, `pinyin`, `chewing` o `cangjie5`. Quick, Boshiamy y Array vienen en el mismo paquete que Cangjie y aparecen en el selector de métodos de entrada. Tus teclas de cambio personalizadas se conservan. Para otras disposiciones o teclas del motor, instalá `fcitx5-configtool` con `omarchy pkg add fcitx5-configtool` y abrilo desde una terminal. Elegir un idioma de entrada no cambia el idioma del escritorio. Elegir japonés, coreano o chino en _Configurar > Idioma_ suma su método de entrada si todavía no tenés ninguno.

Usá `Super + I` para recorrer los métodos de entrada o las distribuciones de teclado, y `Super + Shift + I` para ir en el otro sentido, así que con tres configurados podés moverte entre dos vecinos. El indicador de entrada aparece a la derecha de la barra solo cuando hay más de un método de entrada o distribución configurados. Este atajo del escritorio funciona junto con tus teclas de cambio de Fcitx; lo podés pisar en `~/.config/hypr/bindings.lua`. Los motores de entrada y las secuencias de composición usan el servicio [Fcitx5](https://fcitx-im.org/) que ya corre en cada sesión.

### Usar ALT como SUPER

En algunos teclados no es cómodo usar la tecla meta principal (la tecla Windows/cmd) como SUPER. Podés hacer que sea ALT con este cambio:

```lua
hl.config({
  input = {
    kb_options = "omarchy:shift_caps_compose,altwin:swap_alt_win",
  },
})
```
