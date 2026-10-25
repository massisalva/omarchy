# Marca personal

Omarchy te deja poner el logo de tu empresa o tu marca personal en el desbloqueo al arrancar, el salvapantallas y la pantalla Acerca de.

### Desbloqueo al arrancar

Podés usar `omarchy plymouth preview` para ver cómo quedarían tu logo y tus colores. Recibe un color de fondo, un color de texto, un logo en png y una ruta para la imagen de vista previa:

```
omarchy plymouth preview '#1d2021' '#ebdbb2' logo.png preview.png
```

Después aplicá la configuración con `omarchy plymouth set '#1d2021' '#ebdbb2' logo.png`, que además le pone los mismos colores y el mismo logo a la pantalla de inicio de sesión de SDDM. Si querés volver atrás, usá `omarchy plymouth reset`.

 ![branding-plymouth-shopify](images/branding-plymouth-shopify.webp)

### Salvapantallas

Podés cambiar el logo del salvapantallas en _Apariencia > Marca > Salvapantallas_. Es un logo en ASCII, así que podés editar el texto directamente, pero también le podés dar una imagen png o svg y la convertimos a ASCII. Queda bastante bien.

 ![branding-screensaver](images/branding-screensaver.webp)

Ese menú tiene tres opciones:

- **Editar texto** abre `~/.config/omarchy/branding/screensaver.txt` en tu editor. Escribí o pegá lo que quieras: arte ASCII, tu nombre, una puteada. Guardá y salí, y el salvapantallas arranca al toque para que lo veas.
- **Desde una imagen** abre un selector de archivos para un png o svg, lo convierte a ASCII y te muestra el resultado. Los logos con una silueta clara quedan mucho mejor que las fotos.
- **Volver al original** vuelve a poner el logo de Omarchy.

### Pantalla Acerca de

Las mismas tres opciones están en _Apariencia > Marca > Acerca de_ para la pantalla _Acerca de_ que abrís desde el menú de Omarchy, y funcionan igual: el archivo es `~/.config/omarchy/branding/about.txt`, y la ventana Acerca de aparece después de cada cambio. El arte de Acerca de se convierte a un tamaño más chico que el del salvapantallas, porque tiene que entrar en una ventana en vez de llenar toda la pantalla.

Mientras la ventana está abierta, un destello verde le pasa por encima al arte cada pocos segundos y después lo deja quieto otra vez. Tu propio arte también lo tiene, siempre que cada carácter ocupe una columna de ancho, como todo lo que genera _Desde una imagen_. El arte hecho con emojis o caracteres de doble ancho queda quieto, y lo mismo pasa con la pantalla si usás tu propia configuración de fastfetch: en esos casos, un logo quieto es la animación haciéndose a un lado en vez de romperse, porque pasarles un destello por encima dejaría el resto de la línea fuera de lugar.

 ![branding-about](images/branding-about.webp)

### Convertir imágenes vos mismo

Las dos opciones de _Desde una imagen_ simplemente llaman a `omarchy transcode ascii`, que podés ejecutar directamente si querés controlar la conversión:

```
omarchy transcode ascii ~/logo.svg ~/.config/omarchy/branding/screensaver.txt --width 100
```

Acepta `--width` y `--height` en columnas y filas de la terminal, un `--mode` que puede ser `braille` (el predeterminado, y mucho más fino) o `block`, un porcentaje `--threshold` para decidir qué píxeles cuentan como parte del logo, y `--invert` para cuando tu logo es claro sobre fondo oscuro. Si una conversión sale como un manchón, el umbral suele ser la perilla que hay que tocar.

### Palabras en vez de un logo

`omarchy ascii` dibuja texto en Delta Corps Priest 1, la fuente FIGlet con la que está dibujado el propio nombre de Omarchy, así que un salvapantallas puede decir algo en vez de mostrar una imagen:

```
omarchy ascii "Back in five" > ~/.config/omarchy/branding/screensaver.txt
```

Recibe el texto como argumentos, o lo lee de una tubería si no le pasás ninguno. La fuente tiene solo letras y espacios — se dibujó sin dígitos ni signos de puntuación — así que cualquier otra cosa se descarta y se nombra en stderr en vez de desaparecer en silencio.
