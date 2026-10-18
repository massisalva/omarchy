# Navegación

En Omarchy todo se hace con el teclado — _¡TODO!_ Cuando el sistema arranca por primera vez, literalmente no podés hacer nada solo con el mouse. Pero podés apretar `Super + Space` para abrir el menú de Omarchy, y desde ahí hacés prácticamente todo.

Igual, el menú de Omarchy ni siquiera está pensado para ser la forma principal de manejar el sistema la mayor parte del tiempo. ¡Se puede ir más rápido! Todas las aplicaciones más importantes tienen su propio atajo de teclado. Abrís la terminal con `Super + Return` y un navegador con `Super + Shift + Return`. Probá abrir una después de la otra y vas a ver la magia del mosaico de Hyprland en acción:

 ![navigation-browser-terminal](images/navigation-browser-terminal.webp)

Después podés apretar `Super + J` para apilarlas una arriba de la otra en vez de tenerlas lado a lado:

 ![navigation-stacked](images/navigation-stacked.webp)

Apretá `Super + J` de nuevo para volver a ponerlas lado a lado. Después probá `Super + Shift + Arrow Right` parado en el navegador para intercambiar las ventanas.

Ahora probá `Super + Ctrl + T` para abrir el monitor de actividad. Va a aparecer como ventana flotante. Podés meterla en el mosaico con `Super + T` (y apretarlo otra vez para que vuelva a flotar). Ahora apretá `Super + Shift + F` para abrir el administrador de archivos. Te queda un lindo esquema de cuatro ventanas:

 ![navigation-fourway-tiling](images/navigation-fourway-tiling.webp)

Te movés hasta la ventana que querés activar con `Super + Arrow`. Eso cambia el foco y lleva el cursor al centro de la nueva aplicación. En el borde de una pantalla, sigue de largo al monitor que esté de ese lado.

Si apretás `Super + Shift + 2`, mandás la aplicación con foco al segundo espacio de trabajo. `Super + Shift + 1` la trae de vuelta. (Y `Super + Shift + Alt + 2` manda la aplicación con foco al segundo espacio de trabajo sin llevarte a vos ahí).

Con más de un monitor, cada monitor tiene sus propios espacios de trabajo del 1 al 10. `Super + 2` va al segundo espacio de trabajo del monitor donde estás, y la barra superior de cada monitor muestra sus propios espacios de trabajo y cuál está mostrando. `Super + Tab` recorre los espacios de trabajo del monitor donde estás. `Super + Shift + Ctrl + Arrows` manda la ventana donde estás al monitor que está en esa dirección, al espacio de trabajo que ese monitor está mostrando, y `Super + Shift + Alt + Arrows` lleva el espacio de trabajo donde estás al monitor en esa dirección, donde conserva su número si está libre. Un monitor no pierde sus espacios de trabajo cuando lo desenchufás: se suman a los de otra pantalla, numerados después de los que ya tiene, y vuelven a sus números de antes cuando el monitor regresa.

Si mantenés apretado `Super` y hacés clic en una ventana con el mouse, podés cambiarla de lugar. Si mantenés `Super` y usás el botón derecho del mouse, podés cambiarle el tamaño libremente.

Cerrás una ventana con `Super + W` o `Super + Q` (y cerrás todas las ventanas con `Ctrl + Alt + Delete`).

También podés pasar a pantalla completa con `Super + F`, o solo a todo el ancho (sin tapar la barra superior) con `Super + Alt + F`, o a pantalla completa dentro de una ventana con `Super + Ctrl + F` (¡ideal para YouTube!).

### Distribución dwindle vs. desplazamiento

La distribución predeterminada de Omarchy se llama dwindle. Mantiene siempre visibles todas las ventanas que abrís en un mismo espacio de trabajo, aunque tenga que achicarlas.

 ![navigation-dwindle-layout](images/navigation-dwindle-layout.webp)

Pero también podés pasar un espacio de trabajo a la distribución con desplazamiento, donde las ventanas se alinean una al lado de la otra, más allá del borde visible de la pantalla. Pasás un espacio de trabajo a esta distribución con `Super + L`.

Si apretás `Super + L` otra vez, el espacio de trabajo pasa a flotante, donde las ventanas se superponen libremente y las ubicás vos, y una tercera vez lo devuelve a dwindle. `Super + Alt + L` las recorre en el sentido contrario. Una ventana que flota de todos modos — una que sacaste con `Super + T`, o una app que siempre se abre flotante — sigue flotando cuando el espacio de trabajo vuelve al mosaico. La barra superior marca el espacio de trabajo donde estás con su distribución: un cuadrado para dwindle, un círculo para desplazamiento y un triángulo para flotante. Hacer clic en esa marca también cambia la distribución.

 ![navigation-scrolling-layout](images/navigation-scrolling-layout.webp)

La elección es por espacio de trabajo, y se mantiene. Así podés tener el espacio de trabajo 1 en dwindle para navegar y el 2 con desplazamiento para programar, y van a volver así después de reiniciar.

Si querés usar la distribución con desplazamiento como predeterminada, lo podés configurar en `~/.config/hypr/looknfeel.lua`:

```lua
hl.config({
  general = {
    layout = "scrolling",
  },
})
```

### Espacios de trabajo flotantes

Un espacio de trabajo flotante funciona como un escritorio tradicional: las ventanas se superponen, y las movés y les cambiás el tamaño vos. Cada ventana tiene una barra de título con los colores de tu tema y botones para minimizar, maximizar y cerrar. `Super + M` también minimiza la ventana con foco. Una ventana minimizada espera en el dock; hacé clic en su app para traerla de vuelta. Hacé clic en una ventana para traerla al frente. Cambiale el tamaño desde cualquier borde o esquina. Hacé doble clic en una barra de título para maximizar la ventana sin tapar la barra superior, y otra vez para que vuelva a su tamaño anterior.

Un espacio de trabajo flotante también muestra un dock, con tus apps fijadas, todo lo que está abierto y, detrás del botón de aplicaciones, una grilla con todas las apps, que también abren `Super + Alt + Space` y _Aplicaciones_ en el menú de Omarchy. Hacé clic derecho en una app de la grilla, o apretá `Delete`, para desinstalarla. Hacé clic en una app para abrirla, o para traer su ventana al frente; hacé clic otra vez para ir pasando por sus ventanas. El clic del medio abre una ventana nueva. Arrastrá un ícono por el dock para moverlo; si arrastrás una app abierta entre las demás, queda ahí. Hacé clic derecho para dejar una app fija en el dock, sacarla o cerrarla. El dock se corre cuando hay una ventana en pantalla completa. Hacé clic derecho en el botón de aplicaciones para mover el dock a otro borde o para que se esconda hasta que el puntero llegue a ese borde. La posición también está en _Acciones > Apariencia > Dock > Posición del dock_, y `omarchy dock position left` y `omarchy dock autohide on` configuran las dos cosas desde una terminal. Las apps que dejás fijas en el dock se ven atenuadas mientras no están abiertas.

Los espacios de trabajo nuevos, y cualquiera al que no le hayas dado una distribución propia con `Super + L`, usan la distribución predeterminada. Si cambiás la predeterminada, todos los espacios de trabajo sin ventanas pasan a ella, mientras que los que tienen ventanas conservan la que tienen. Una ventana minimizada en el dock sigue contando como ventana del espacio de trabajo de donde salió. Elegila en _Acciones > Apariencia > Distribución de espacios de trabajo_: Mosaico, Desplazamiento o Flotante. `omarchy-hyprland-workspace-layout-default scrolling` la configura desde una terminal.

### Agrupar ventanas

Las ventanas se pueden agrupar con `Super + G`. Una vez que estás en un grupo, cada ventana que abras mientras esté activo va a pertenecer al grupo. Te movés entre las ventanas agrupadas con `Super + Ctrl + Arrow Left/Right`, o con `Super + Alt + 1/2/3/4` para ir directo a una ventana del grupo según su orden.

Podés sacar una ventana del grupo con `Super + Alt + G` o desarmar todo el grupo apretando `Super + G` de nuevo. Por último, podés meter en el grupo ventanas que están afuera con `Super + Alt + Arrows`.

### Despegar ventanas

Podés despegar una ventana de su espacio de trabajo con `Super + O`. Eso la deja fija como ventana flotante que te sigue a cualquier espacio de trabajo al que vayas. Ideal para reproductores de video y cosas así.

 ![navigation-popped-window](images/navigation-popped-window.webp)

### Espacio de trabajo scratchpad

Por último, hay un espacio de trabajo especial, el scratchpad, que se despliega encima de cualquier espacio de trabajo donde estés, muy parecido a una consola de Quake. Lo mostrás y lo escondés con `Super + Grave` o `Super + S`, y mandás una ventana ahí con `Super + Shift + Grave` o `Super + Alt + S`.

Funciona especialmente bien para una terminal con un agente corriendo, o para controles que querés usar rápido sin salir del espacio de trabajo actual. Para sacar una ventana del scratchpad, mandala directo a otro espacio de trabajo con algo como `Super + Shift + 1`.

Mientras el scratchpad tiene una sola ventana, se despliega como un panel centrado en vez de ocupar toda la pantalla. Poné una segunda app y vuelve a todo el ancho, así las dos tienen lugar para estar lado a lado.

### ¡Cuesta acostumbrarse!

Lleva un tiempito acostumbrarse a moverse así por el escritorio, pero una vez que le agarrás la mano, ¡te va a costar volver a un escritorio tradicional manejado con el mouse!
