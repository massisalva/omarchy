# Terminal

[Foot](https://codeberg.org/dnkl/foot) es la terminal predeterminada de Omarchy. Es rápida, liviana y anda bien hasta en computadoras viejas. Eso sí, no tiene pestañas ni divisiones propias.

Si usás Tmux, capaz no te importa, pero si no, también soportamos por completo _Alacritty_, _Ghostty_ y _Kitty_ como alternativas. Elegí la que prefieras en _Instalar > Terminal_ en el menú de Omarchy.

Abrís una terminal nueva con `Super + Return`. (Ese atajo apunta automáticamente a la terminal que hayas instalado en _Instalar > Terminal_, y podés cambiar entre las terminales instaladas en _Configurar > Predeterminados > Terminal_.)

## Tmux

Tmux te da una interfaz consistente y programable para paneles, ventanas (o sea, pestañas) y sesiones que se pueden retomar, sin importar qué terminal uses. Funciona incluso en equipos remotos, así que cuando entrás por SSH a un servidor podés trabajar igual.

Arrancás una sesión nueva de Tmux en una terminal nueva con `Super + Alt + Return`, y como Tmux es un proceso que queda corriendo, podés retomar la sesión aunque cierres esa terminal. Apretá `Ctrl + Space` (la llamada tecla prefijo) y después `s` para ver todas tus sesiones activas.

Omarchy trae una configuración de Tmux pensada para la ergonomía, con un montón de atajos para aprender, así que tené [la hoja de referencia a mano](07-hotkeys.md#tmux).

## Funciones de distribución de Tmux

Como Tmux es programable, podemos usar funciones para armar distribuciones. Omarchy trae cuatro funciones distintas para distribuciones de desarrollo comunes.

`tdl [agent]` arma una interfaz dividida en tres, al estilo de un IDE, con el `$EDITOR` a la izquierda, el agente de IA que elijas a la derecha (por ejemplo `c` para opencode, `cx` para Claude o `codex` para OpenAI) y una terminal abajo.

Así, `tdl c` arrancaría esto (o directamente `ic`):

 ![tmux-tdl](images/tmux-tdl.webp)

También podés sumar un segundo agente con `tdl c cx` (opencode + claude) (o directamente `icx`):

 ![tmux-tdl2](images/tmux-tdl2.webp)

También está `tds`, que arma un cuadrado de cuatro partes con el editor arriba a la izquierda, un visor de diferencias en vivo arriba a la derecha, una terminal abajo a la izquierda y opencode abajo a la derecha.

Además podés armar esta distribución para cada subcarpeta de la carpeta actual con `tdlm [agent]`, y después moverte con `alt + 1/2/3/4/5/...`:

 ![tmux-tdlm](images/tmux-tdlm.webp)

Por último, podés lanzar un enjambre de agentes con `tsl [panes] [command]`. Así, `tsl 4 c` te da una grilla con cuatro agentes de opencode:

 ![tmux-tsl](images/tmux-tsl.webp)
