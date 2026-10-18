# Suspensión del sistema

Omarchy viene con la suspensión y la hibernación activadas, pero si tenés problemas con alguna de las dos en tu máquina, las podés apagar.

En las máquinas NVIDIA GB10, como la DGX Spark y la ASUS Ascent GX10, la suspensión y la hibernación vienen apagadas, igual que en el DGX OS de NVIDIA, porque todavía no se comprobó que la suspensión funcione en ese hardware. Ahí no aplican ni el interruptor de suspensión ni la configuración de hibernación. Para volver a activarlas, borrá `/etc/systemd/sleep.conf.d/omarchy-sleep-disabled.conf` con `sudo rm`; Suspender vuelve a aparecer en el menú, y la hibernación se puede configurar como en las demás máquinas. Ejecutar `sudo omarchy apply hardware --install-user "$USER"` vuelve a poner el archivo.

### Perfiles de energía

En una notebook, Omarchy recuerda tu perfil de energía por separado para cuando está enchufada y cuando anda con batería, y cambia entre los dos cuando la enchufás y desenchufás. De entrada, eso es rendimiento enchufada y equilibrado con batería.

Podés ver qué ofrece tu máquina con `omarchy powerprofiles list`, y elegir el que querés para el estado en el que estás ahora con `omarchy powerprofiles set autodetect power-saver`. Para configurar el otro estado sin desenchufar nada, nombralo directamente: `omarchy powerprofiles set battery power-saver`. Lo que elijas es lo que vas a tener la próxima vez que estés en ese estado.

### Activar o desactivar la suspensión

La suspensión se prende y se apaga ejecutando `omarchy toggle suspend` en la terminal. Eso solo muestra u oculta la opción en _Sistema_ (o `Super + Esc`), y después podés ver si anda bien siempre en tu sistema. Si no, la volvés a ocultar con el mismo comando.

### Activar o desactivar la hibernación

La hibernación se configura ejecutando `omarchy hibernation setup` en la terminal. La hibernación crea un subvolumen /swap en tu disco de arranque del tamaño de tu RAM física, así que asegurate de tener lugar de sobra. En una máquina de 32GB, siempre vas a necesitar más de 32GB libres para este volumen. La hibernación también necesita el gestor de arranque Limine que viene por defecto.

Una vez configurada, vas a ver la opción de hibernar en _Sistema_ (o `Super + Esc`), y después podés ver si anda bien siempre en tu sistema. Si no, la sacás de nuevo ejecutando `omarchy hibernation remove`.
