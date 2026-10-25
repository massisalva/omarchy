# Actualizaciones

Omarchy y tus paquetes se mantienen al día con _Actualizar > Omarchy_ en el menú de Omarchy (`Super + Space`).

Omarchy en sí se instala como paquetes comunes de pacman desde el [Repositorio de paquetes de Omarchy](https://github.com/omacom-io/omarchy-pkgs), así que una actualización instala [la última versión de Omarchy](https://github.com/omacom/omarchy/releases), corre las migraciones pendientes para poner tu sistema al día y actualiza todos los paquetes del sistema desde el [Mirror de Arch de Omarchy](https://github.com/omacom-io/omarchy-mirror) y el [AUR](https://aur.archlinux.org/) (si instalaste algún paquete del AUR).

Cuando salen versiones nuevas, aparece un ícono de flecha circular a la derecha del reloj. Hacé clic y arranca la actualización.

![update-available](images/update-available.webp)

### Cuatro canales

Omarchy se actualiza por cuatro canales: stable, RC, edge y dev. Las instalaciones nuevas arrancan en el canal stable, que sigue las [versiones oficiales](https://github.com/omacom/omarchy/releases/) y el [mirror estable de Arch de Omarchy](https://github.com/omacom-io/omarchy-mirror), que va un mes atrás de lo último, así podemos detectar cualquier incompatibilidad nueva que necesite cambios de configuración antes de que le cause problemas a la gente.

Pero si querés ayudar a encontrar esos problemas, podés usar el canal edge. Así tus paquetes de Omarchy siguen las últimas compilaciones de desarrollo, y podés actualizar a los últimos paquetes de Arch apenas salen. Hacelo solo si tenés experiencia con Linux y sabés cómo recuperar un sistema con problemas.

Antes de cada versión mayor, hacemos la validación final con el canal RC. Si te interesa ayudar con los últimos retoques, date una vuelta por #omarchy-release-candidates en el Discord.

Por último está el canal dev, que conecta Omarchy directamente a una copia git del código fuente en `~/omarchy`, junto con los paquetes de edge. Usalo solo si sos un usuario de Linux con experiencia, trabajás directamente en Omarchy y te bancás que algo se rompa.

Podés cambiar de canal con _Actualizar > Canal_ desde el menú de Omarchy (o con `omarchy-channel-set` en la terminal).

### Cambiar de kernel

Omarchy arranca con su propio kernel, `linux-omarchy`, pero podés tener otros instalados al lado, como el kernel `linux` estándar de Arch o una versión experimental que estés probando. Cuando hay más de uno, _Actualizar > Kernel_ en el menú de Omarchy los lista con una marca al lado del que arranca por defecto. Elegí otro, poné tu contraseña una vez y va a arrancar después del próximo reinicio. Los otros kernels siguen en el menú de arranque, así que igual podés elegir uno a mano si el nuevo predeterminado te da problemas. En la terminal, `omarchy-kernel` muestra el predeterminado actual, `omarchy-kernel list` lo que está instalado y `omarchy-kernel set <kernel>` cambia de kernel.

### Actualizaciones de firmware

Tus paquetes no son lo único que queda viejo. Muchas notebooks y periféricos distribuyen firmware de BIOS, SSD y docks a través del Linux Vendor Firmware Service, y _Actualizar > Firmware_ en el menú de Omarchy busca e instala lo que tu hardware tenga pendiente. La primera vez que lo usás instala `fwupd`. Mucho firmware solo se puede escribir durante un reinicio, así que no te sorprendas si te pide uno.

### Ojo con actualizar directo con pacman/yay

Si ya conocés Arch, capaz te tienta ejecutar `pacman -Syu` o `yay -Syu` por tu cuenta, pero si lo hacés te perdés la instantánea, las migraciones y las actualizaciones de configuración que Omarchy corre junto con los paquetes nuevos. Por eso Omarchy frena una actualización directa del sistema y te manda a usar `omarchy update`. (Si de verdad sabés lo que hacés, la protección te dice cómo saltearla para una sola transacción).

### Deshacer una mala actualización

Si alguna vez tenés un problema después de actualizar, podés volver tu sistema a la instantánea que se sacó antes de la actualización. Reiniciá y, en el menú de arranque, elegí la instantánea de antes de empezar la actualización.

![bootloader](images/bootloader.webp)

Si por algún motivo tus archivos de configuración se rompieron, también podés reinstalar Omarchy con `omarchy reinstall` en la terminal. Eso reinstala todos los paquetes predeterminados de Omarchy, te pasa a stable y baja de versión cualquier paquete demasiado nuevo, y restablece todos los archivos de configuración. ¡Tené en cuenta que esto pisa todos los cambios que le hayas hecho a la configuración predeterminada de Omarchy!
