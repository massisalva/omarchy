# Juegos

Omarchy no es solo para la _pRoDUcTiViDaD_, también es para divertirse, ¿y qué hay más divertido que jugar? Omarchy trae un montón de opciones para jugar: Steam y RetroArch para juegos nativos y retro, Battle.net, Lutris y Heroic para tiendas que no son Steam, Moonlight para jugar por streaming desde una PC, Xbox Cloud Gaming + NVIDIA GeForce NOW para la nube, y el infaltable Minecraft.

Gracias al trabajo increíble de Valve con [la capa de compatibilidad Proton](https://en.wikipedia.org/wiki/Proton_(software)), hoy hay decenas de miles de juegos modernos que se pueden jugar en Linux. Ah, ¿sabías que la [Steam Deck](https://store.steampowered.com/steamdeck/) en realidad corre Arch?

Todos los instaladores de juegos están en _Instalar > Juegos_ en el menú de Omarchy (`Super + Space`). Si alguna vez querés deshacer alguno, usá _Eliminar > Juegos_.

## Steam

Instalá [Steam](https://store.steampowered.com/) eligiendo _Instalar > Juegos > Steam_ en el menú de Omarchy (`Super + Space`).

Una vez instalado, vas a poder abrir Steam con `Super + Space`.

Tené en cuenta que Steam puede tardar 10-20 segundos en arrancar, y no da ninguna señal visual de que está cargando.

 ![gaming-steam](images/gaming-steam.webp)

## RetroArch

Instalá [RetroArch](https://www.retroarch.com/) eligiendo _Instalar > Juegos > RetroArch_ en el menú de Omarchy (`Super + Space`). Viene con el conjunto completo de núcleos libretro, así que todas las consolas clásicas están cubiertas.

RetroArch viene totalmente preconfigurado con el hermoso shader CRT Royale para ese look retro perfecto.

Para arrancar:

1. Poné tus archivos de BIOS en `~/Games/bios` y tus ROMs en `~/Games/roms`.
2. Abrí RetroArch con `Super + Space` escribiendo `retro`.
3. Escaneá la carpeta `~/Games/roms` y listo para jugar.

También podés darle a un juego favorito su propia entrada en el lanzador de aplicaciones con _Instalar > Juegos > Lanzador RetroArch_, que te deja elegir un núcleo y una ROM y saltar directo al juego desde `Super + Space`.

 ![gaming-retroarch](images/gaming-retroarch.webp)

## Xbox Cloud Gaming

Instalá la web app de Xbox Cloud Gaming eligiendo _Instalar > Juegos > Xbox Cloud Gaming_ en el menú de Omarchy (`Super + Space`). Es «solo» una web app del servicio, pero arranca rápido y anda bárbaro a 1080p.

Si ya tenés Xbox Game Pass, es una muy buena forma de jugar Fortnite y otros títulos que no podés correr de forma nativa en Linux.

 ![gaming-xbox-cloud](images/gaming-xbox-cloud.webp)

## NVIDIA GeForce Now

Instalá el servicio de juegos en la nube [NVIDIA GeForce NOW](https://www.nvidia.com/en-us/geforce-now/) eligiendo _Instalar > Juegos > NVIDIA GeForce NOW_ en el menú de Omarchy (`Super + Space`). Otra gran forma de jugar títulos que no existen de forma nativa en Linux.

 ![gaming-geforce-now](images/gaming-geforce-now.webp)

## Minecraft

Instalá Minecraft eligiendo _Instalar > Juegos > Minecraft_ en el menú de Omarchy (`Super + Space`).

Igual que con Steam, tené en cuenta que después de iniciar sesión o de arrancar puede tardar un rato en aparecer la siguiente pantalla, y no vas a ver ninguna señal mientras esperás.

 ![gaming-minecraft](images/gaming-minecraft.webp)

## Joysticks de Xbox

Instalá el soporte para joysticks Bluetooth de Xbox eligiendo _Instalar > Juegos > Controles de Xbox_ en el menú de Omarchy (`Super + Space`). Emparejá los joysticks por Bluetooth (`Super + Ctrl + B`) y van a funcionar en todos tus juegos. No necesitás esto si conectás el joystick con un cable USB-C.

## Moonlight (jugar por streaming desde una PC)

El [cliente Moonlight](https://github.com/moonlight-stream/moonlight-qt) viene preinstalado en Omarchy, así que podés jugar por streaming desde una PC con Windows que tenga [Sunshine](https://app.lizardbyte.dev/Sunshine/) de una. Abrí Moonlight con `Super + Space`.

Si tanto tu máquina con Omarchy como la PC gamer remota están conectadas por cable, la experiencia es igual a jugar en local. Subí la resolución a la nativa, poné la frecuencia de actualización en 120Hz y la tasa de bits al máximo: es la mejor forma de jugar shooters competitivos como Fortnite en Linux.

También podés convertir una máquina con Omarchy en el host ejecutando `omarchy install service sunshine`, que instala Sunshine y abre los puertos de streaming de Moonlight para tu red local y Tailscale.

## Battle.net

Instalá [Battle.net](https://eu.shop.battle.net/en-us) eligiendo _Instalar > Juegos > Battle.net_ en el menú de Omarchy (`Super + Space`). Eso te da títulos como Diablo, Starcraft y World of Warcraft como una instalación independiente que corre con GE-Proton: no hace falta Steam, Lutris ni Heroic.

 ![gaming-starcraft](images/gaming-starcraft.webp)

## Lutris (juegos de Windows)

Instalá [Lutris](https://lutris.net/) eligiendo _Instalar > Juegos > Lutris_ en el menú de Omarchy (`Super + Space`). Lutris es la forma de jugar juegos de Windows de tiendas como EA y Ubisoft Connect que no tienen su propio instalador más arriba.

La instalación es medio tosca y a veces parece que no pasa nada: tené paciencia, está trabajando en segundo plano.

## Heroic Launcher (Epic Games)

Instalá el [Heroic Launcher](https://heroicgameslauncher.com/) eligiendo _Instalar > Juegos > Heroic (Epic Games)_ en el menú de Omarchy (`Super + Space`). Heroic te deja correr títulos de Epic Games que no dependen de un anti-cheat, como OddSparks, además de juegos de GOG y Amazon Prime Gaming. Lamentablemente, eso significa que no hay Fortnite ni Rocket League: hasta que Tim Sweeney llegue a Linux, esto es lo más cerca que se puede estar.

Igual que Lutris, puede sentirse lento y tosco al instalar juegos. Dale tiempo.
