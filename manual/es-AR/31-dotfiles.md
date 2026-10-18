# Dotfiles

Omarchy se configura sobre todo con los llamados dotfiles que viven en `~/.config`. Esos son tus archivos, para tus cambios. Los archivos que viven en `/usr/share/omarchy` son de Omarchy, y no deberías andar metiéndoles mano. Si necesitás cambiar algo de `/usr/share/omarchy`, lo que conviene es pisar ese valor desde `~/.config`.

Las configuraciones clave se pueden editar directamente desde el menú de Omarchy (`Super + Space`), como _Configurar > Monitores_, _Configurar > Atajos de teclado_, _Configurar > Entrada_ y _Configurar > Configuración > [archivo]_. Si lo hacés así, cualquier proceso que tenga que reiniciarse después de editar la configuración se reinicia solo cuando salís del editor (Neovim por defecto — ¡`:wq`, acordate! —, pero lo podés cambiar en _Configurar > Predeterminados > Editor_).

Esta es una lista de los archivos clave de `~/.config` y de lo que controla cada uno:

| Archivo                  | Para qué sirve              |
| ----------------------- | --------------------- |
| `~/.config/hypr/hyprland.lua` | La configuración principal de Hyprland. Carga los valores predeterminados de Omarchy más tus archivos de ajustes de abajo. [Más información sobre la configuración de Hyprland](https://wiki.hypr.land/Configuring/).  |
| `~/.config/hypr/bindings.lua` | Tus propios atajos de teclado y los cambios a los predeterminados. |
| `~/.config/hypr/monitors.lua` | Tus monitores, su resolución y su posición. |
| `~/.config/hypr/input.lua` | Tu distribución de teclado y los ajustes del mouse y el touchpad. |
| `~/.config/hypr/looknfeel.lua` | Los espacios, bordes, animaciones y el resto del aspecto. |
| `~/.config/hypr/autostart.lua` | Los procesos extra que arrancan con la sesión. |
| `~/.config/omarchy/shell.json` | La shell de Omarchy: posición, distribución y widgets de la barra, más los tiempos del salvapantallas, el bloqueo y la inactividad. |
| `~/.config/foot/foot.ini` | Tu terminal (foot es la predeterminada). |
| `~/.XCompose` | Tus emojis de acceso rápido y el autocompletado de nombre y mail. Acordate de ejecutar `omarchy-restart-xcompose` después de hacer cambios. |

Si terminás haciendo muchos cambios para ajustar tu configuración, conviene hacer una copia de seguridad de todos estos dotfiles. [Stow es una gran forma de hacerlo](https://www.youtube.com/watch?v=NoFiYOqnC4o).

### Arrancar tus propias apps con la sesión

Si querés que algo corra cada vez que iniciás sesión — un demonio de sincronización, una app de chat, un script tuyo —, ponelo en `~/.config/hypr/autostart.lua`:

```lua
o.launch_on_start("my-service")
```

Así el comando arranca como parte de la sesión, y se cierra como corresponde cuando cerrás sesión.

### Correr scripts ante eventos del sistema

Omarchy dispara hooks en un puñado de momentos, y podés colgar tus propios scripts de ellos. Viven en `~/.config/omarchy/hooks/<event>.d/`, una carpeta por evento, y cada archivo ejecutable que haya adentro se corre cuando pasa el evento:

| Evento | Cuándo se ejecuta |
| ----- | ------------ |
| `post-boot` | Justo después de que arrancó el escritorio |
| `post-update` | Cerca del final de `omarchy update`, después de los paquetes, las migraciones y los reinicios de servicios, y antes de que se actualicen las herramientas de mise |
| `pre-refresh-pacman` | Después de que `omarchy refresh pacman` vuelve a sincronizar la configuración de paquetes y antes de que actualice los paquetes; un cambio de canal lo ejecuta durante ese mismo paso de actualización |
| `theme-set` | Después de un cambio de tema (nombre del tema en `$1`) |
| `font-set` | Después de un cambio de fuente (nombre de la fuente en `$1`) |
| `battery-low` | Cuando queda poca batería (porcentaje en `$1`) |

El hook `pre-refresh-pacman` es el lugar para repositorios propios o líneas `IgnorePkg`, ya que corre antes de la transacción de paquetes. Los dos hooks de actualización corren con tu usuario después de que Omarchy borra su autorización de sudo en caché, así que un hook que use `sudo` necesita su propia autorización y puede pedirte la contraseña.

Cada una de esas carpetas ya trae un archivo `.sample` que muestra cómo es un hook: sacale el `.sample` al nombre para ponerlo a trabajar. Para instalar un script que escribiste en otro lado, usá `omarchy hook install post-boot ~/my-hook`, que lo copia y lo hace ejecutable.

### Agregar tus propias opciones al menú

Podés sumarle tus propias filas al menú de Omarchy (`Super + Space`) editando `~/.config/omarchy/extensions/omarchy-menu.jsonc`. Las opciones se identifican con un id con puntos, y el id es lo que las ubica en el árbol, así que `personal` aparece en el menú raíz y `personal.notes` aparece dentro de él:

```jsonc
"personal": {"icon":"","label":"Personal"},
"personal.notes": {"icon":"󰎞","label":"Notes","action":"omarchy-launch-editor ~/notes"},
```

Si reusás un id que ya existe, pisás esa fila en vez de agregar una nueva. El archivo trae todos los campos disponibles documentados como comentarios.

### Agregar tus propios exports, funciones y alias de shell

Omarchy trae un montón de alias cómodos y funciones útiles, pero es muy común querer sumar los tuyos. Los alias, funciones y exports van en `~/.bashrc`. Ese archivo no se pisa con las actualizaciones. Si querés cambiar algún valor predeterminado de Omarchy, también lo podés hacer ahí sin problema.

### Cambiar archivos internos de Omarchy

Mirá, es tu computadora. Podés hacer lo que quieras con ella, pero te aconsejo no tocar directamente los archivos de `/usr/share/omarchy`. Son del paquete pacman de Omarchy, así que tus cambios se van a pisar en la próxima actualización. Te conviene más pisar los valores predeterminados que no te gusten desde la carpeta `~/.config/*`.

Así podés cambiar casi todo, como los atajos de teclado predeterminados. Por ejemplo, editá `~/.config/hypr/bindings.lua` para reemplazar [Obsidian](https://obsidian.md/) por [Joplin](https://joplinapp.org/) (instalalo con `omarchy-pkg-add joplin-bin`):

```lua
o.rebind("SUPER + SHIFT + O", "Joplin", "joplin-desktop")
```

`o.rebind` saca el atajo existente antes de agregar el reemplazo. Acepta los mismos argumentos que `o.bind`, incluidos los ayudantes de lanzamiento y las opciones del atajo. Usá `o.bind` para agregar un atajo, o `hl.unbind` para sacar uno sin reemplazarlo.

Si insistís en meterle mano a los archivos internos de Omarchy, pasate al canal dev con _Actualizar > Canal > Desarrollo_. Eso conecta Omarchy a una copia git del código fuente en `~/omarchy`, que podés cambiar como se te antoje. ¡Acá nadie te va a decir qué hacer!

### Deshacer cualquier cambio

Si terminás haciendo un lío con la configuración, siempre podés volver a los valores predeterminados con _Actualizar > Configuración_ en el menú de Omarchy. O ejecutando `omarchy reinstall configs` para restablecer todo.
