# TUI

## Lazygit

[Lazygit](https://github.com/jesseduffield/lazygit) es una alternativa encantadora a algo como la aplicación GitHub Desktop, y corre dentro de la terminal.

Lo podés usar directamente: andá a cualquier carpeta manejada por git y ejecutá `lazygit`. O podés usarlo dentro de Neovim, donde se abre con `Space G G`.

Saltás entre los distintos paneles con `Tab`. En el panel Files, elegís los archivos que van al área de preparación con `Space`, y después podés crear un commit nuevo con `c`. Con `?` ves todos los comandos disponibles.

## Btop

[Btop](https://github.com/aristocratos/btop) es un monitor de recursos hermoso que muestra el uso de memoria, CPU, disco y red. También lista todos los procesos activos y te deja administrarlos.

Omarchy lo llama Activity, y lo abrís con `Super + Shift + T`. Se abre como ventana flotante, que podés meter en el mosaico con `Super + T`.

## Herdr

[Herdr](https://github.com/omacom-io/herdr) es un administrador de espacios de trabajo para la terminal que te da espacios de trabajo, pestañas y paneles, y los mantiene todos corriendo en una sesión persistente de la que podés desconectarte y a la que podés volver después.

Lo abrís (o te reconectás a tu sesión) con `Super + Ctrl + Return`. Omarchy trae una configuración de Herdr que copia la de Tmux, así que acá la tecla prefijo también es `Ctrl + Space`. Podés ver todos los atajos de teclado con `Super + Ctrl + K`.

## Fastfetch

[Fastfetch](https://github.com/fastfetch-cli/fastfetch) muestra información del sistema, como la versión del kernel, el tiempo encendido, el tema, la CPU, la memoria y más. Es el sucesor de la popular herramienta neofetch.

Omarchy lo empaquetó como _Acerca de_ en el menú de Omarchy (`Super + Space`).

## Cliamp

[Cliamp](https://www.cliamp.stream/) es un reproductor de música retro para la terminal inspirado en Winamp 2.x, con radios lo-fi incluidas. Abrilo con `Super + Shift + Alt + M`, o desde el menú de Omarchy en _Aplicaciones_. Apretá `?` para ver la lista completa de atajos de teclado.

## ¿Y el Wi-Fi y el Bluetooth?

No vas a encontrar TUIs para Wi-Fi y Bluetooth: de eso se encarga la shell de Omarchy. Hacé clic en el ícono de Wi-Fi de la barra superior (o apretá `Super + Ctrl + N`) para ver las redes y conectarte, y hacé clic en el ícono de Bluetooth (o apretá `Super + Ctrl + B`) para emparejar y conectar dispositivos. Mirá [redes](35-networking.md) para la historia completa.

## Sumar las tuyas

Cualquier programa de terminal puede tener el tratamiento completo de aplicación. Andá a _Instalar > TUI_ en el menú de Omarchy (`Super + Space`), dale un nombre, un comando para abrirlo, un estilo de ventana y un ícono, y va a aparecer en el lanzador de aplicaciones como cualquier otra aplicación. La podés sacar de nuevo en _Eliminar > TUI_.
