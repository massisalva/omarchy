# Primeros pasos

Omarchy se instala con una ISO. Podés elegir entre una instalación de disco completo, que ocupa todo el disco, o una instalación en espacio libre, que pone Omarchy en el espacio sin asignar de un disco — así es como hacés arranque dual junto a Windows u otro sistema operativo (mirá [instalación con arranque dual](50-dual-boot-install.md) — tené en cuenta que primero vas a tener que desactivar BitLocker en Windows). En cualquier caso, la instalación usa cifrado completo por defecto, y la opción de disco completo borra el disco elegido, ¡así que asegurate de hacer una copia de seguridad antes de usar uno que ya tengas!

Primero [descargá la ISO de Omarchy](https://omarchy.org/), pasala a un pendrive (usá [balenaEtcher](https://etcher.balena.io/) en Mac/Windows o [caligula](https://github.com/ifd3f/caligula) en Linux) y arrancá desde el pendrive.

_Tenés que desactivar Secure Boot y/o TPM en el BIOS. Si no, no vas a poder instalar Omarchy. Son esquemas de seguridad de Microsoft pensados para Windows y para distribuciones de Linux afiliadas a Microsoft._

Después respondé las preguntas de configuración y confirmalas así:

 ![install-config](images/install-config.webp)

Después elegí un disco para la instalación, relajate y disfrutá el espectáculo. En las máquinas modernas más rápidas puede terminar en menos de un minuto, y no debería tardar más de 5 minutos ni siquiera en una computadora más vieja.

 ![install-done](images/install-done.webp)

¡Ya podés usar Omarchy!

### ¡Usá un teclado con cable o de 2.4ghz!

Con el cifrado completo de disco no vas a poder escribir la contraseña desde un teclado Bluetooth al arrancar. Es lo mismo que pasa con el BIOS de una PC: tampoco podés entrar con un teclado Bluetooth. Vas a necesitar un teclado con dongle de 2.4ghz o con cable (¡que igual es mucho mejor para la latencia!). ¡A mí personalmente me encanta el [Lofree Flow84](https://www.lofree.co/products/lofree-flow-the-smoothest-mechanical-keyboard)!

### Instalar para otro dueño

Si estás preparando una máquina para otra persona — un familiar, un empleado nuevo, un comprador — no deberías responder las preguntas personales por ella. Apretá `Ctrl + C` en la primerísima pantalla del instalador (la de elegir el teclado) y Omarchy te va a ofrecer preparar la máquina para otro dueño. El sistema se instala enseguida, pero toda la configuración personal — distribución de teclado, nombre de usuario, contraseña — queda para cuando la máquina arranque por primera vez. El disco sigue cifrado por defecto, y la contraseña que el nuevo dueño elija en ese primer arranque pasa a ser también la contraseña de cifrado. (Una máquina que ya venías usando también se puede entregar sin reinstalar — mirá [restablecer la computadora](48-security.md).)

### Instalaciones desatendidas

La ISO también puede instalarse completamente sola — sin teclado, sin asistente — cuando le pasás su configuración en un segundo disco. Esa es la forma de usar Omarchy como imagen base para VMs y para las máquinas de una flota. Mirá [instalaciones desatendidas](51-unattended-installs.md).

### Instalaciones sin cifrado

Omarchy se instala cifrado por defecto. Es la opción segura y responsable para cualquier computadora que se pueda perder o que te puedan robar. ¡No querés que cualquiera que agarre tu hardware pueda llevarse tus datos!

Pero en casos especiales, como instalaciones remotas de Omarchy en computadoras protegidas o instalaciones descartables sin datos sensibles, capaz quieras instalar sin cifrado. Podés apretar `Ctrl + C` en la confirmación de formateo del disco para pasar a una instalación sin cifrado.

### Idioma

Omarchy habla 51 idiomas — los 50 de omarchy.org más este español rioplatense — y el inglés es el predeterminado. Para cambiarlo, abrí el menú de Omarchy y andá a _Configurar > Idioma_, o ejecutá `omarchy language <code>` en una terminal (`omarchy language list` muestra los códigos). El menú, el escritorio y las notificaciones de Omarchy cambian de idioma al instante, y también cada aplicación que abras después. Las apps que ya estaban abiertas cambian cuando las reiniciás.

### Ayuda si te trabás

Si te trabás, casi siempre vas a encontrar a alguien con ganas de ayudar en el canal _#omarchy-help_ del [Discord de la comunidad](https://omarchy.org/discord).
