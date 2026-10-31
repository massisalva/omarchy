# Instantáneas del sistema

Sacamos instantáneas automáticamente en cada actualización de Omarchy, pero si querés crear las tuyas, podés usar `omarchy-snapshot create`.

Para arrancar desde una instantánea y restaurarla, la elegís en el gestor de arranque Limine. (Si hoy arrancás directo a la pantalla de descifrado de Omarchy, primero vas a tener que elegir Limine como opción de arranque desde el BIOS).

En esa pantalla, elegí la instantánea desde la que querés arrancar según la fecha y la versión. La versión de Omarchy del momento de la instantánea se ve en la esquina de abajo a la izquierda.

 ![snapshots-bootloader](images/snapshots-bootloader.webp)

Una vez adentro, aparece una notificación que te avisa que estás en una instantánea de arranque y, si le hacés clic, arranca la restauración. Si no, también podés usar `omarchy-snapshot restore`.

 ![snapshots-restore](images/snapshots-restore.webp)

Esto restaura tu sistema de archivos raíz, pero no tu `/home`. Así que sirve para deshacer una actualización del sistema que salió mal, pero no para recuperar archivos personales perdidos.

Eso también significa que tu carpeta `~/.config` queda tal cual. Así que si volvés a una versión anterior de una biblioteca o aplicación que guarda la configuración en un formato nuevo, lo vas a tener que resolver a mano.

Lo mismo pasa con el registro que lleva Omarchy de las migraciones que ya corrieron: vive en tu carpeta personal, así que sobrevive a la restauración. Las migraciones que corrieron después de sacar la instantánea siguen marcadas como hechas, aunque los cambios que hicieron en el sistema de archivos raíz se hayan deshecho, y el próximo `omarchy update` no las vuelve a correr. Así que si actualizás de nuevo después de restaurar y sigue faltando algo que había configurado una actualización anterior, lo más probable es que sea por eso.

_Nota: Esta función solo está disponible en instalaciones que usan el gestor de arranque Limine, que es el predeterminado desde Omarchy 2.0. No está disponible si usás GRUB o systemd-boot._

### Saltear el menú de arranque

Si nunca tocás el menú de arranque y solo querés que la computadora vaya directo a la pantalla de descifrado, abrí _Configurar > Arranque directo_ en el menú de Omarchy. Eso agrega una entrada EFI que apunta directamente a Omarchy, así el firmware lo arranca sin frenar en Limine.

La contra es la que mencionamos al principio: con el arranque directo activado, para llegar a una instantánea primero tenés que elegir Limine desde el menú de arranque del BIOS. Abrí _Configurar > Arranque directo_ de nuevo para sacar la entrada y volver a arrancar con Limine. Algunos firmwares no se llevan bien con entradas EFI personalizadas, así que la configuración no se ejecuta en firmwares de American Megatrends ni de Apple.
