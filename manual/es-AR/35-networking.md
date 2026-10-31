# Redes

En Omarchy, la red la maneja NetworkManager, y la controlás desde el ícono de red de la [barra superior](05-the-top-bar.md) o con `Super + Ctrl + N`.

Ese panel busca redes Wi-Fi, muestra la intensidad de la señal y se conecta. Ethernet no necesita absolutamente nada: enchufás el cable y anda. Si preferís quedarte en la terminal, `nmtui` te da los mismos controles, y también hay un grupo de comandos `omarchy network`.

## Compartir tu Wi-Fi

En vez de dictar una contraseña larguísima, abrí _Configurar > Red > Código QR_ mientras estás conectado al Wi-Fi. Eso muestra en pantalla un código QR que cualquier cámara de celular puede escanear para conectarse. Es una de esas cosas que, una vez que sabés que existen, usás más de lo que pensabas.

Si de verdad necesitás la contraseña en sí, `omarchy network password <interface>` la muestra.

## DNS

Omarchy usa el DNS que tu red entrega por DHCP. Lo podés cambiar para toda la máquina en _Configurar > Red > DNS_, donde Cloudflare y Google están a un clic. Elegí _Personalizado_ para escribir tus propios servidores.

Desde la terminal, `omarchy dns` muestra el proveedor actual y `omarchy dns Cloudflare` configura uno.

## Fijar la banda del Wi-Fi

Si tu router pone 2.4 GHz, 5 GHz y 6 GHz bajo el mismo nombre de red, a veces tu notebook se queda pegada a la más lenta. `omarchy network band` muestra en qué banda estás, y `omarchy network band 5` la fija. Usá `auto` para que vuelva a elegir sola.

Esto fija la banda, no un punto de acceso en particular, así que te seguís moviendo entre puntos de acceso con normalidad.

## ¿Qué tan rápida es?

_Acciones > Medir velocidad > Velocidad de red_ mide tu velocidad real de subida y de bajada con un par de indicadores. Desde la terminal es `omarchy network speedtest down` o `up`. Mide contra el servicio propio de Omarchy y cuenta solo sus transferencias de prueba. Otras descargas pueden competir por el ancho de banda, pero no se suman al resultado. (En ese mismo menú, al lado, hay una prueba de velocidad de disco, por si estás midiendo el otro cuello de botella.)

## El firewall

El firewall viene activado por defecto y bloquea todo el tráfico entrante, con una excepción: el puerto 53317, para que [LocalSend](22-guis.md) funcione de entrada.

SSH está apagado hasta que lo activás con _Configurar > Seguridad > SSHD_, que arranca el demonio, abre el puerto 22 con límite de conexiones contra ataques de fuerza bruta y autoriza una clave. Docker también está restringido, para que los contenedores no queden expuestos al mundo por accidente. Mirá [seguridad](48-security.md) para la historia completa.

## Tailscale

[Tailscale](https://tailscale.com/) es una VPN en malla que hace fácil y seguro llegar a todas tus computadoras y servidores por internet. Instalalo con _Instalar > Servicio > Tailscale_.

Eso te da un panel de Tailscale en la barra, que conecta y desconecta la tailnet, cambia de cuenta y elige un nodo de salida: en la lista aparecen tus propias máquinas y las regiones de Mullvad. También te deja recorrer tus máquinas, y ahí es donde vive Taildrop: elegí una máquina y apretá `s` para mandarle archivos, o `c`, `n` y `d` para copiar su IP, su nombre o su nombre DNS completo. El equivalente en la terminal es `omarchy tailscale send <machine> [file...]`, y los archivos que te manden llegan solos a `~/Downloads`. La notificación que avisa que llegó algo se queda hasta que hacés clic para abrirlo o la descartás, así que un archivo que llegó mientras no estabas en la compu sigue ahí para que lo atiendas cuando volvés.

Al instalarlo también se agrega una web app para la consola de administración de Tailscale.

## Cuando deja de andar

Antes de reiniciar todo, probá reiniciar solo la parte que está fallando. _Actualizar > Hardware_ tiene Wi-Fi, Bluetooth, Audio y Touchpad, y recargar uno de esos resuelve la mayoría de los casos de «hace cinco minutos andaba». Mirá [solución de problemas](45-troubleshooting.md).
