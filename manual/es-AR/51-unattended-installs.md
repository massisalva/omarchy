# Instalaciones desatendidas

La ISO de Omarchy se puede instalar sola, sin nadie frente al teclado. Si el instalador encuentra una segunda unidad con la etiqueta `cidata` que tiene sus archivos de configuración, los copia, se saltea por completo el asistente de configuración y reinicia solo en el sistema terminado. Sin una compilación especial de la ISO, sin una entrada extra en el menú de arranque: si no hay una unidad así conectada, no cambia nada y te aparece el asistente de siempre.

Eso hace que Omarchy sea genial como imagen base para entornos de desarrollo descartables: creá una máquina virtual en Proxmox o con Packer, arrancala, andá a hacer otra cosa y después entrá por SSH. `cidata` es la etiqueta `NoCloud` de cloud-init, así que todas las herramientas de virtualización comunes ya saben cómo conectar una unidad así.

## Los archivos de configuración

Los archivos son exactamente los que escribe el propio asistente del instalador, así que la forma más fácil de conseguir un primer juego es hacer una instalación interactiva (en una máquina virtual, por ejemplo) y copiar lo que dejó en `/root`:

| Archivo | Requerido | Propósito |
|------|----------|---------|
| `user_configuration.json` | Sí | Disco, nombre del equipo, zona horaria, teclado |
| `user_credentials.json` | Sí | Nombre de usuario y hash de la contraseña |
| `user_encrypt_installation.txt` | No | `true` cuando la configuración tiene un bloque `disk_encryption` |
| `authorized_keys` | No | Claves públicas SSH, una por línea |
| `tailscale_authkey` | No | Clave de autenticación de Tailscale para sumarse a tu tailnet en el primer arranque |

Generá el hash de la contraseña para `user_credentials.json` con `openssl passwd -6 "yourpassword"`.

El nombre y el mail de los commits de git no forman parte de la instalación. Configuralos cuando la máquina ya esté andando, por ejemplo por SSH, con `omarchy setup git --name "Jane Doe" --email jane@example.com`.

También podés dejar un archivo vacío llamado `defer-provisioning` en lugar de `user_credentials.json`. Eso hace la misma [instalación para otro dueño](02-getting-started.md) que podés activar de forma interactiva: la máquina se instala sin datos personales, y quien la arranque primero elige su teclado y crea su usuario. Ese es el modo para los equipos que generan imágenes, donde la unidad no debería tener las credenciales de nadie.

## Acceso por SSH

Si está `authorized_keys`, la instalación pone esas claves como el `~/.ssh/authorized_keys` del usuario, activa `sshd` y le abre el firewall. (Una instalación base de Omarchy trae openssh con el servicio apagado y el puerto cerrado, así que, si no, a una máquina desatendida no habría forma de llegar.) La instalación solo agrega tus claves: no afloja ningún otro ajuste de autenticación del demonio SSH.

Si está `tailscale_authkey`, la máquina se suma a tu tailnet en el primer arranque: Tailscale se instala desde los paquetes que trae la ISO, el firewall permite la interfaz de la tailnet y una tarea en segundo plano hace el ingreso apenas la máquina tiene red, reintentando hasta lograrlo. Usá una clave reutilizable y preautorizada, así una misma imagen de la unidad sirve para muchas máquinas.

## Crear la unidad cidata

Sirve cualquier sistema de archivos con la etiqueta correcta. Una ISO chiquita es lo más fácil:

```bash
mkdir cidata
cp user_configuration.json user_credentials.json authorized_keys cidata/
genisoimage -output cidata.iso -volid cidata -joliet -rock cidata/
```

Después conectala a la máquina virtual junto con la ISO de Omarchy. Este es un ejemplo completo con Proxmox:

```bash
qm create 101 --name my-omarchy \
  --bios ovmf --machine q35 --cpu host --cores 4 --memory 8192 \
  --ostype l26 --scsihw virtio-scsi-single \
  --efidisk0 local-lvm:0,efitype=4m,pre-enrolled-keys=0 \
  --scsi0 local-lvm:40,discard=on,iothread=1 \
  --net0 virtio,bridge=vmbr0 --vga virtio --serial0 socket \
  --ide2 local:iso/omarchy.iso,media=cdrom \
  --ide3 local:iso/cidata.iso,media=cdrom \
  --boot order='scsi0;ide2'

qm start 101
```

El orden de arranque pone el disco primero a propósito: en el primer arranque, el disco vacío pasa la posta a la ISO, y de ahí en adelante el sistema instalado arranca siempre desde el disco.

## Dos advertencias

Las instalaciones desatendidas cifradas no son del todo desatendidas: alguien igual tiene que escribir la frase de contraseña de LUKS en el primer arranque. Y el bloque `disk_encryption` de `user_configuration.json` tiene esa frase en texto plano, así que tratá una unidad cidata hecha a partir de una instalación cifrada como el secreto que es.
