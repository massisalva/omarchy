# Monitores

Omarchy da por sentado que usás una pantalla tipo retina, apta para 2x. Es lo que necesitás para tener esas fuentes de programador lindas y nítidas. Es para lo que están optimizadas casi todas las notebooks premium nuevas con pantallas de alta resolución. Y es lo que querrías usar en un [Apple Studio Display](https://www.apple.com/studio-display/)/[ProArt PA27JCV](https://www.asus.com/us/displays-desktops/monitors/proart/proart-display-5k-pa27jcv/)/[Samsung S9](https://www.samsung.com/us/computing/monitors/5k/27-viewfinity-s9-5k-monitor-with-thunderbolt-4-matte-display-and-smart-features-ls27c900panxza/)/[Kuycon G27P](https://kuycon.us/monitors/G27P/) de 27" 5K o un [Apple XDR](https://www.apple.com/pro-display-xdr/)/[ProArt PA32QCV](https://www.asus.com/displays-desktops/monitors/proart/proart-display-6k-pa32qcv/)/[Kuycon G32P](https://kuycon.us/monitors/G32P/) de 32" 6K.

Pero si tu pantalla no llega a 218 PPI, vas a querer cambiar la configuración del monitor. Por ejemplo, si tenés un 4K de 27" o 32", podés usar escalado fraccional abriendo `~/.config/hypr/monitors.lua` (desde _Configurar > Monitores_ en el menú de Omarchy) y pasando a la recomendación para esa combinación:

```lua
local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 1.6
```

Si usás una pantalla de 1080p o 1440p, probablemente te convenga escalado 1x, así que podés usar:

```lua
local omarchy_gdk_scale = 1
local omarchy_monitor_scale = 1
```

Los cambios en `GDK_SCALE` se aplican a las aplicaciones que abras después del cambio (y GTK solo acepta números enteros, así que dejalo en el entero más cercano a la escala de tu monitor). Así que asegurate de cerrar las ventanas que hayan quedado gigantes después del cambio (¡o cerrá todas las ventanas con `Ctrl + Alt + Del`!).

También podés recorrer rápido las escalas de monitor principales (1x, 1.25x, 1.6x, 2x, 3x, 4x) con `Super + /` para subir y `Super + Alt + /` para bajar, o elegir una desde el panel del monitor en la barra de arriba. Estos atajos cambian solo el monitor que tiene el foco, así que la pantalla de la notebook y un monitor externo pueden tener cada uno su escala. La elección se guarda en `~/.config/hypr/monitors.lua` como una regla `hl.monitor` para ese monitor, así que se mantiene después de reiniciar y tiene prioridad sobre `omarchy_monitor_scale`, que sigue siendo la escala de todos los monitores que no tengan una regla propia. Como `GDK_SCALE` es un solo valor para todas las pantallas, estos cambios lo toman del monitor con la escala más baja: las apps de X11 se ven un poco chicas en la pantalla más densa, en vez de enormes en la otra.

### Agrandar o achicar el texto

La escala del monitor cambia el tamaño de todo. Si lo único que querés es agrandar o achicar el _texto_, hay un solo control para eso:

```
omarchy display text size 14
```

Acepta un tamaño en píxeles entre 9 y 20, y cambia juntos la shell de Omarchy, las aplicaciones GTK y tu terminal, así todo el escritorio queda proporcionado. Ejecutalo sin argumento para ver el valor actual, y `omarchy display text size reset` para volver al predeterminado. Foot es el único que queda atrás: no tiene forma de recargar su configuración, así que las terminales abiertas mantienen el tamaño viejo hasta que abras una nueva.

### Extender y duplicar la pantalla de la notebook

Cuando conectás una pantalla externa a la notebook, el escritorio se extiende automáticamente. Pero podés pasar a duplicar la pantalla con _Acciones > Hardware_ en el menú de Omarchy o con `Super + Ctrl + Alt + Delete`. Viene especialmente bien si esa pantalla externa es un proyector y querés mostrar algo mientras trabajás.

Cuando estás extendiendo, al cerrar la tapa de la notebook se apaga sola la pantalla interna. Al abrir la tapa se vuelve a prender. También lo podés controlar a mano con _Acciones > Hardware_ en el menú de Omarchy o con `Super + Ctrl + Delete`.

### Acomodar varias pantallas

Hyprland anda muy bien con varias pantallas. Leé más sobre cómo acomodarlas en [la documentación de monitores de Hyprland](https://wiki.hypr.land/Configuring/Basics/Monitors/). En Omarchy, eso va en `~/.config/hypr/monitors.lua` como entradas `hl.monitor` — el archivo trae ejemplos comentados para fijar un monitor en particular a una resolución, una posición y una rotación.

Cada monitor tiene sus propios espacios de trabajo del 1 al 10, así que `Super + 1` siempre es el primer espacio de trabajo del monitor donde estás. Por detrás, Hyprland sigue numerando los espacios de trabajo entre todos los monitores: la pantalla de la notebook (o el primer monitor) tiene del 1 al 10, el siguiente monitor del 11 al 20, y así, y cada monitor conserva su bloque cada vez que lo enchufás. Usá esos números si escribís [reglas de espacios de trabajo](https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/) o reglas de ventanas para un monitor en particular: el espacio de trabajo 12 es el segundo de tu segundo monitor. `~/.local/state/omarchy/monitor-workspaces` lista qué bloque tiene cada monitor.

Las flechas funcionan entre monitores que comparten un borde en tu distribución. Las pantallas que solo se tocan en una esquina, o que tienen un espacio entre ellas, no son vecinas, así que para pasar de una a otra usá `Ctrl + Alt + Tab`.

| Atajo | Entre monitores |
| --- | --- |
| `Super + Arrow` | Pasa el foco al monitor de ese lado cuando ya no quedan ventanas en esa dirección |
| `Super + Shift + Arrow` | Intercambia con una ventana del monitor de ese lado |
| `Super + Alt + Arrow` | Mete la ventana en un grupo del monitor de ese lado |
| `Super + Shift + Ctrl + Arrow` | Manda la ventana al monitor de ese lado, al espacio de trabajo que está mostrando |
| `Super + Shift + Alt + Arrow` | Manda el espacio de trabajo al monitor de ese lado, conservando su número si está libre |
| `Ctrl + Alt + Tab` / `Ctrl + Alt + Shift + Tab` | Pasa el foco al monitor siguiente o anterior, sin importar la distribución |
| `Super + 1-0`, `Super + Tab`, `Super + Scroll Wheel` | Se quedan en el monitor donde estás |

Si querés una TUI que te ayude a ubicar varias pantallas, también podés probar [Hyprmon](https://github.com/erans/hyprmon/).

### Controlar el brillo

El brillo del monitor se controla con las teclas de función para subir y bajar el brillo. Si mantenés apretado shift mientras las apretás, vas al brillo máximo o mínimo. Las teclas controlan la pantalla que tiene el foco, así que los monitores externos que hablan DDC/CI se ajustan igual que la pantalla de la notebook.

### Pantallas de Apple

Si usás una pantalla de Apple, las teclas de brillo comunes del teclado también funcionan solas cuando el foco está en esa pantalla. Eso se hace con el comando `asdcontrol`.

Tené en cuenta que si usás una pantalla Apple 6K XDR, puede que veas una pantalla fantasma en la lista de `hyprctl monitors`. La podés apagar con algo como `hl.monitor({ output = "DP-2", disabled = true })` desde _Configurar > Monitores_.

En las máquinas Intel, conviene conectar las pantallas de Apple con un cable Thunderbolt común. En otras máquinas sin Thunderbolt, en general vas a tener que usar un [cable DP + USB-A -> USB-C](https://www.amazon.com/dp/B0BNX7MS6N) para que funcione.
