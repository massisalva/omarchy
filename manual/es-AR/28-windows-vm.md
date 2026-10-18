# Máquina virtual de Windows

Omarchy te da una forma fácil de correr Windows en una máquina virtual con Docker. La instalás con _Instalar > Windows_ desde el menú de Omarchy (`Super + Space`).

Tu computadora necesita virtualización KVM para esto, que la mayoría tiene, aunque a veces está desactivada en el BIOS; si es tu caso, el instalador te avisa. También vas a necesitar espacio en disco: lo que le des a Windows, más unos 10GB para la imagen en sí.

El instalador te pregunta cuánta RAM, cuántos núcleos de CPU y cuánto disco darle (64GB o más es el mínimo razonable), y después un usuario y una contraseña de Windows. Si los dejás vacíos, quedan `docker` / `admin`. La descarga tarda un rato — 10-15 minutos es normal — y podés seguir el progreso en el navegador en `http://127.0.0.1:8006`. El navegador te pide el mismo usuario y contraseña antes de abrir la consola.

 ![windows-vm](images/windows-vm.webp)

## Usarla

Una vez instalada, abrí _Windows_ desde el lanzador de aplicaciones. Eso arranca la máquina virtual si todavía no está corriendo y te conecta por RDP, a pantalla completa. Dale 15-30 segundos si arranca en frío.

La sesión RDP lleva sonido, tu micrófono y un portapapeles compartido, así que copiar texto entre Linux y Windows funciona sin más. La resolución sigue el tamaño de tu ventana, y Omarchy le pasa tu escala de pantalla, así que no se ve todo borroso en una pantalla HiDPI.

Cuando cerrás la ventana de RDP, la máquina virtual se apaga sola. Si preferís dejarla corriendo — por ejemplo, porque tenés algo trabajando adentro — abrila con `omarchy windows vm launch --keep-alive`.

El resto de los controles están en el mismo comando:

```bash
omarchy windows vm status    # is it running?
omarchy windows vm stop      # shut it down
omarchy windows vm launch    # start and connect
```

## Compartir archivos

La carpeta `~/Windows` de tu carpeta personal se comparte automáticamente con la máquina virtual. Poné ahí los archivos que quieras que Windows pueda ver. La máquina virtual no tiene acceso a ninguna otra parte de tu sistema de archivos, así que estás protegido de cualquier cosa fea del lado de Windows. Su propio disco virtual está en `~/.windows`.

Esas rutas conocidas de tu carpeta personal se quedan en sus propios sistemas de archivos. También pueden ser enlaces simbólicos a carpetas que sean tuyas, algo útil cuando el disco virtual vive en una unidad más grande. El instalador mide el espacio libre en el sistema de archivos que de verdad contiene `~/.windows`, que no necesariamente es el de tu carpeta personal.

Mantené las rutas del disco y de la carpeta compartida como carpetas separadas, sin que una quede dentro de la otra. Al desinstalar se vacía a propósito la carpeta del disco, pero se conserva la compartida. Justo antes de desinstalar, Omarchy hace una comprobación de contención con tiempo limitado y no borra nada si esa comprobación se queda sin tiempo o no puede demostrar que los dos árboles están separados.

Antes de que arranque la máquina virtual, Omarchy abre y fija esas dos carpetas, y después monta con bind exactamente esos inodos sobre anclas privadas por usuario en `/var/lib/omarchy/windows/mounts`. Docker solo ve esas anclas protegidas por root. Así se respetan las ubicaciones personalizadas del disco y, al mismo tiempo, se impide que otro proceso que corra con tu usuario cambie una ruta ya comprobada antes de que la use el contenedor privilegiado. Las carpetas del disco y compartida que ya existían pasan a modo `0700` durante la migración, para que otras cuentas locales no puedan ver lo que tienen.

Los puertos de la máquina virtual escuchan solo en localhost, así que nada de tu red puede llegar a la máquina Windows. La consola web además pide el usuario y la contraseña de Windows configurados, lo que impide que otra cuenta local maneje la máquina virtual por el puerto 8006.

## Límites y licencias

Esta configuración no tiene acceso directo a la GPU, así que no sirve para jugar ni para editar video. Es una gran forma de usar Microsoft Office o lo que sea que sí o sí necesites.

La versión instalada es Windows 11 Pro, sin activar. Vas a necesitar tu propia clave de licencia para usar las funciones limitadas.

Si esta computadora vino con Windows, la clave OEM sigue en el firmware aunque hayas instalado Omarchy. Mostrala con `omarchy windows key`. Esa clave está atada a esta computadora: activa un Windows reinstalado en este hardware, pero en general no activa la máquina virtual.

Podés cambiar los recursos asignados más adelante volviendo a ejecutar `omarchy-windows-vm install`, que reescribe la configuración de la máquina virtual según tus respuestas. El archivo compose ahora vive en `/var/lib/omarchy/windows/docker-compose.yml` y es de root: es a propósito, para que un proceso que corra con tu usuario no pueda reescribirlo y hacer que el arranque privilegiado monte todo tu disco en el contenedor. Si necesitás editarlo a mano (por ejemplo, para montar un dispositivo USB), editalo con `sudo` y mirá todas las opciones en [el proyecto Dockur Windows](https://github.com/dockur/windows).

Para borrar todo, usá _Eliminar > Windows_ desde el menú de Omarchy. Eso borra el disco de la máquina virtual y todos sus datos, así que asegurate antes de haber sacado de `~/Windows` todo lo que te importe.
