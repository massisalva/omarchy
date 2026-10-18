# Autenticación por hardware

### Autenticación con huella digital

Muchas notebooks vienen con un lector de huellas para autenticarte. Lo podés usar con Omarchy abriendo _Configurar > Seguridad > Huella digital_ en el menú de Omarchy (`Super + Space`).

Eso instala el paquete de huellas, registra tu huella, la verifica y listo: ya podés usar tu huella para desbloquear desde la pantalla de bloqueo (que activás con `Super + Ctrl + L`), entrar en modo sudo y autorizar pedidos del sistema.

Cuando la pantalla de bloqueo apaga la pantalla, el lector descansa para ahorrar energía, así que despertá la pantalla con cualquier tecla o con el touchpad antes de tocarlo.

Con la tapa de la notebook cerrada, el pedido de huella se saltea solo, así que vas directo al pedido de contraseña en vez de esperar a un lector al que no llegás. Si en otra situación necesitás trabajar con un teclado externo sin lector, apretá `CTRL + C` cuando `sudo` te pida la huella.

Podés sacar la autenticación con huella en _Eliminar > Seguridad > Huella digital_ en el menú de Omarchy.

### Autenticación con Fido2

Si usás un dispositivo Fido2, lo podés configurar para autenticar `sudo` con _Configurar > Seguridad > FIDO2_ en el menú de Omarchy (`Super + Space`). Eso sí, cubre `sudo` y los pedidos de autorización del sistema, no el desbloqueo de la computadora.

Podés sacar la autenticación con fido2 en _Eliminar > Seguridad > FIDO2_ en el menú de Omarchy.
