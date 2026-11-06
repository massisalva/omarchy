# Instalación con arranque dual

Podés instalar Omarchy en una sola partición junto a Windows u otras instalaciones.

Este método de instalación también trae cifrado LUKS para la partición por defecto, así que en la práctica no cambia nada respecto del disco completo; solo necesita espacio libre en el disco.

## Hacer lugar en Windows

Para instalar junto a Windows, escribí `disk management` en el menú Inicio y elegí la opción **Create and format hard disk partitions**.

 ![dual-boot-1](images/dual-boot-1.webp)

Buscá la partición que corresponda, hacé clic derecho y elegí **Shrink Volume**.

![dual-boot-2](images/dual-boot-2.webp)

 Escribí cuánto querés achicar el volumen. Tené en cuenta que ese va a ser el tamaño de tu futura instalación de Omarchy, partición de arranque incluida.

 ![dual-boot-3](images/dual-boot-3.webp)

Cuando termines, deberías ver algo así, donde la sección de 50 GB es donde vamos a instalar Omarchy en este ejemplo.

 ![dual-boot-4](images/dual-boot-4.webp)

## Instalar Omarchy

La instalación de Omarchy es prácticamente igual a la normal. Después de elegir el disco, te va a aparecer la opción **Free space install**. Elegila para no borrar el disco entero.

 ![dual-boot-5](images/dual-boot-5.webp)

Confirmá que todo esté bien y esperá a que termine la instalación como siempre. Acá también podrías elegir instalar sin cifrado (no recomendado), igual que en una instalación de disco completo.
 ![dual-boot-6](images/dual-boot-6.webp)

## Agregar otras instalaciones al gestor de arranque

Al terminar la instalación de Omarchy, vas a ver que ahora el gestor de arranque predeterminado es Limine. Así que también podés agregarle a Limine opciones para tus otras instalaciones, como Windows.

Para agregar otros sistemas operativos, ejecutá `limine-scan` y seguí las instrucciones para agregar las entradas que quieras a tu configuración de Limine. El menú de arranque queda oculto por defecto y arranca Omarchy después de un segundo. Para elegir Windows u otra entrada, apretá cualquier tecla apenas arranca Limine; cuando aparezca el menú, elegí una entrada con las flechas y apretá Enter. Si Omarchy arranca antes de que aprietes una tecla, reiniciá y probá de nuevo. Si activaste _Configurar > Arranque directo_, el firmware se saltea Limine por completo, así que elegí Limine desde el menú de arranque de tu BIOS o volvé a usar _Configurar > Arranque directo_ para sacar la entrada.

## Bitlocker

Ojo: este método de instalación no es compatible con Bitlocker, porque Bitlocker cifra todo el disco, no solo la partición. Si te aparece un error que dice que Bitlocker está activado, arrancá Windows, entrá a **Settings -> Privacy & Security -> Device encryption** y desactivá Bitlocker. Descifrar el disco puede tardar un rato.

 ![dual-boot-7](images/dual-boot-7.webp)
