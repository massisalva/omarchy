# Solución de problemas

### ¡Rompí el sistema con una actualización!

Primero probá [restaurar tu sistema](47-system-snapshots.md) a como estaba antes de la última actualización. Si eso no funciona, usá `omarchy-debug` para compartir tu problema en #omarchy-help en Discord. Y si todo eso falla, podés reinstalar las configuraciones y los paquetes predeterminados con `omarchy-reinstall`.

### ¿Por qué algunas apps se ven tan grandes en mi pantalla?

Omarchy da por sentado que tenés una pantalla de alta resolución 2x, lo que requiere poner `GDK_SCALE` en 2 en `~/.config/hypr/monitors.lua`. Pero si tu pantalla es 1x, podés cambiar `local omarchy_gdk_scale = 2` a 1 (y después reiniciar cualquier app que se vea gigante). Mirá [el capítulo sobre monitores](33-monitors.md).

En Spotify, podés usar `Ctrl + Minus` para achicar la interfaz (y `Ctrl + Plus` para agrandarla).

### ¿Por qué dejaron de andar todos mis atajos con Super?

En algunas notebooks ASUS ROG y TUF, `Fn + Super` es una combinación fácil de apretar sin darte cuenta que activa un bloqueo de la tecla Windows en el firmware (pensado para juegos, así no salís de uno sin querer). Nada en la pantalla te avisa que pasó. Mientras el bloqueo está activado, Super no manda nada, así que todos los atajos de Omarchy que usan Super dejan de andar y parece que se rompió Hyprland.

Apretá `Fn + Super` una vez antes de ponerte a revisar `~/.config/hypr/`, y si con eso Super no vuelve, apretalo de nuevo para no dejar el bloqueo activado. Esto no es el bloqueo de Fn, que solo cambia lo que hace la fila de teclas F.

### Mi Wi-Fi, Bluetooth, audio o touchpad dejó de andar de la nada

Antes de reiniciar todo, probá reiniciar solo la parte que está fallando. _Actualizar > Hardware_ en el menú de Omarchy tiene Wi-Fi, Bluetooth, Audio y Touchpad, y recargar uno de esos resuelve la mayoría de los casos de «hace cinco minutos andaba»: unos auriculares Bluetooth que no se vuelven a conectar, un touchpad que dejó de responder después de suspender, un sonido que desapareció cuando desenchufaste un monitor.

### ¿Por qué no suenan mis parlantes externos?

Seguramente porque no están configurados como salida principal. Hacé clic en el ícono del parlante a la derecha de la barra y se abre el panel de volumen, donde podés elegir el dispositivo de salida (y también mezclar el volumen de cada app).

### Los parlantes de mi notebook suenan raro

En algunas notebooks, Omarchy aplica solo un ajuste que corrige la respuesta en frecuencia de los parlantes integrados. `omarchy audio tuning status` te dice si hay uno activo en tu máquina, y `omarchy audio tuning off` lo apaga si preferís escuchar los parlantes sin procesar.

### ¿Por qué no puedo iniciar sesión ni usar sudo con mi contraseña?

Seguramente la escribiste mal demasiadas veces y te bloquearon. Si te pasa en la pantalla de bloqueo, podés apretar `CTRL + ALT + F2` para abrir otra TTY, iniciar sesión como root y ejecutar `faillock --reset --user [your-username]`. Eso saca el bloqueo y listo.

### ¿Por qué no aparecen los pedidos de autorización de 1Password para el agente SSH o la CLI de 1Password?

Puede pasar por 2 motivos:

Para que aparezca el pedido de aprobación completo, tiene que estar activada la opción Settings > Advanced > Use Hardware Acceleration. _Nota: hay que reiniciar para que empiece a funcionar._

 ![troubleshooting-1password](images/troubleshooting-1password.webp)

O, si no abriste 1Password desde que arrancaste la máquina, el pedido no va a aparecer.
