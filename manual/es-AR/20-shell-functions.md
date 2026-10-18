# Funciones de shell

Omarchy trae un conjunto de funciones de shell para simplificar tareas comunes y esconder llamadas con parámetros enredados.

## Compresión

- `compress [file/dir]`: Crea un archivo tar.gz a partir del archivo o la carpeta.
- `decompress [file.tar.gz]`: Descomprime un archivo tar.gz.

## Unidades

- `iso2sd [image.iso]`: Crea una unidad de arranque en una tarjeta SD con el archivo iso indicado, eligiendo la unidad de forma interactiva.
- `format-drive [device] [name]`: Formatea un disco entero con una sola partición exFAT (que también anda en Windows y macOS). Ejecutalo sin argumentos para ver las unidades disponibles. ¡Cuidado con esto!

## Distribuciones de desarrollo

Distribuciones de desarrollo de varios paneles para tmux, al instante:

- `tdl [ai]`: Crea un Tmux Dev Layout con tu editor, un agente de IA y una terminal. Usá los alias de los agentes, como `tdl c` para opencode o `tdl cx` para Claude Code, o pasale un segundo agente para correr los dos, como `tdl c cx`.
- `tds`: Crea un Tmux Dev Square con editor, seguimiento de diferencias (con `hunk diff --watch`), terminal y opencode.
- `tdlm [ai]`: Crea una ventana `tdl` para cada subcarpeta de la carpeta actual.
- `tsl [count] [command]`: Crea un enjambre de paneles en mosaico, en grilla, todos corriendo el mismo comando (ideal para agentes de IA).

Las mismas distribuciones están disponibles para Herdr como `hdl`, `hds`, `hdlm` y `hsl`.

## Worktrees de Git

- `ga [branch]`: Crea un worktree nuevo y una rama al lado del repositorio actual y salta ahí.
- `gd`: Borra el worktree actual y su rama (antes te pide confirmación).

## Vigilantes de rsync

- `rsw [source] [destination]`: Arranca un vigilante en segundo plano que sincroniza con rsync el origen al destino cada vez que algo cambia. El destino puede ser un equipo remoto, como `rsw ~/Work/app nyc-dev:Work/app`.
- `lsw`: Lista todos los vigilantes activos.
- `dsw`: Detiene todos los vigilantes activos.

## Reenvío de puertos por SSH

Ideal para hacer desarrollo web contra una computadora remota con los privilegios de contexto seguro que tiene localhost.

- `fip`: Reenvía uno o más puertos de un equipo remoto a localhost por SSH.
- `dip`: Corta uno o más puertos reenviados.
- `lip`: Lista todos los reenvíos de puertos por SSH activos.

Supongamos que levantás un servidor de desarrollo en el puerto `3000` en una computadora a la que llegás como `nyc-dev`: podés ejecutar `fip nyc-dev 3000` para reenviar ese puerto, así `localhost:3000` en realidad llega a `nyc-dev:3000`, pero sin necesitar certificados SSL para tener el contexto seguro que hace falta para probar web sockets y cosas así.

## Reconexión por SSH

El propio `ssh` está envuelto en una función que limpia la terminal si una conexión se corta mientras un tmux, Herdr o editor remoto la tenía tomada, y después se reconecta sola cuando se cae una sesión interactiva (Ctrl-C corta los reintentos).
