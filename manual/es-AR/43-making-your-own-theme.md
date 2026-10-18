# Crear tu propio tema

Podés agregar tus propios temas en `~/.config/omarchy/themes`. Copiá uno de los que ya existen como base (buscalos en `/usr/share/omarchy/themes`) y después ajustalo a tu gusto. Mientras tu tema esté dentro de esa carpeta, va a aparecer en el menú para elegir temas.

El archivo principal que tenés que ajustar es `colors.toml`. Ahí se define el conjunto de colores que después se usa para generar la configuración de la terminal (Foot/Alacritty/Ghostty/Kitty), btop, Chromium, Hyprland, Neovim, Helix, VSCode, Obsidian y toda la shell de Omarchy (barra superior, menú, notificaciones, OSD y pantalla de bloqueo).

También podés usar la app Aether, que viene incluida, para crear un tema nuevo con una interfaz gráfica encantadora para jugar con los colores y buscar fondos. Abrila desde la grilla de apps con `Super + Alt + Space`.

### Qué puede tener un tema instalado

Un tema que escribís vos en `~/.config/omarchy/themes` puede tener lo que quieras: es tu computadora y tu archivo, y Omarchy aplica todo.

Un tema que instalás desde el repositorio de otra persona con `omarchy theme install` conserva todo lo que es color y pierde el puñado de archivos que ejecutarían código en tu máquina: cualquier archivo `.lua`, las configuraciones de la terminal (`alacritty.toml`, `foot.ini`, `ghostty.conf`, `kitty.conf`) y `vscode.json`. El `hyprland.lua` de un tema es Lua que tu compositor ejecuta al iniciar sesión, una configuración de terminal indica el programa que abre tu terminal, y `vscode.json` indica una extensión de VSCode para instalar. Instalar el tema de otra persona tendría que cambiar cómo se ve tu escritorio, nunca qué ejecuta.

Todo lo demás sigue funcionando exactamente como lo escribió el autor del tema: `btop.theme`, `chromium.theme`, `helix.toml`, `icons.theme`, `shell.toml`, los fondos y las vistas previas se conservan. Solo lo que se descartó se regenera a partir de `colors.toml` en tu máquina.

Omarchy distingue unos de otros según si el tema tiene su propio repositorio git adentro, que es lo que deja `omarchy theme install` cuando lo clona. Así que un tema que escribiste vos sigue siendo tuyo, y uno que bajaste de internet queda solo con los colores.

### Modo claro

Si estás haciendo un tema claro, poné `mode = "light"` al principio de tu `colors.toml`. Así va a quedar emparejado automáticamente con el modo claro en todas las apps. (La forma vieja, dejar un archivo vacío llamado `light.mode` en la raíz del tema, también sigue funcionando.)

### Colores de los íconos

Si querés que los íconos del administrador de archivos combinen con el color de tu tema, agregá un archivo llamado `icons.theme` con el nombre del conjunto de íconos que querés usar. Por defecto, las opciones son: `Yaru Yaru-blue Yaru-dark Yaru-magenta Yaru-olive Yaru-prussiangreen Yaru-purple Yaru-red Yaru-sage Yaru-wartybrown Yaru-yellow`.

### Imagen de desbloqueo

Los temas que traen las imágenes `unlock.png` y `preview-unlock.png` aparecen en _Estilo > Desbloqueo_. Tu `unlock.png` conviene que sea un png transparente. Y podés crear la imagen de vista previa con `omarchy plymouth preview`.

### Darle tema a apps que Omarchy no cubre

Si usás una app que no está en esa lista, podés enseñarle a Omarchy a darle tema vos mismo con una plantilla. Poné un archivo en `~/.config/omarchy/themed/` con el nombre de la configuración que genera más la extensión `.tpl`, y escribí la configuración usando `{{ background }}`, `{{ foreground }}`, `{{ accent }}`, `{{ red }}`, `{{ color0 }}` a `{{ color15 }}` y el resto de la paleta como marcadores. Cada vez que cambiás de tema, el archivo se regenera con los colores de ese tema.

En esa carpeta hay un `alacritty.toml.tpl.sample` totalmente comentado para copiar: lista todas las variables que podés usar, más los modificadores `_strip` y `_rgb` para las apps que quieren los colores sin el `#` o en RGB decimal. Tus plantillas tienen prioridad sobre las de Omarchy, así que también podés usar esto para cambiar cómo se le da tema a una app incluida.

### Compartir tu tema

Si querés compartir tu tema para que otros lo usen, tenés que subirlo a un servidor git público, como GitHub. Después, la gente lo puede instalar con _Instalar > Estilo > Tema_ en el menú de Omarchy usando esa URL. Se recomienda seguir la convención de nombres `omarchy-[themename]-theme`, porque así el tema aparece bien, solo como `[themename]`, en el menú para elegir temas después de instalarlo.

Ese `[themename]` que queda pasa a ser el nombre de la carpeta del tema, así que tiene que ser uno que Omarchy pueda manejar sin riesgo: tiene que empezar con una letra, un dígito o un guion bajo, y el resto puede tener letras, dígitos, `.`, `_`, `+` y `-`. Las mayúsculas se pasan a minúsculas solas, pero cualquier otra cosa — un espacio, una comilla, un carácter que no sea del inglés — se rechaza al instalar en vez de convertirse en un nombre de carpeta. Así que `omarchy-tokyo-night-theme`, `omarchy-flexoki_light-theme` y `omarchy-c++-theme` se instalan sin problema.

Acordate de que, cuando se instala desde un repositorio, cualquier `.lua`, configuración de terminal o `vscode.json` que traiga se descarta, así que no armes el tema alrededor de eso.

Podés hacer que tu tema se sume a [la página de temas extra](https://omarchy.org/themes/) mandando un pull request al [repositorio omarchy-site](https://github.com/omacom-io/omarchy-site).
