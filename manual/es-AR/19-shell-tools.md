# Herramientas de shell

Además de las herramientas estándar de Linux, Omarchy trae un montón de herramientas de shell mejoradas. Estas son las principales.

## fzf

[fzf](https://junegunn.github.io/fzf/) te da búsqueda difusa de archivos con el alias `ff`. Andá a cualquier carpeta, escribí `ff` y vas a poder buscar cualquier archivo de ese árbol, con una vista previa a la derecha de los archivos que vas filtrando.

Con `Ctrl + R` usás fzf para buscar en tu historial de comandos.

Neovim también usa esta herramienta cuando escribís `Space Space`.

El manual completo está en `man fzf`.

## Zoxide

[Zoxide](https://github.com/ajeetdsouza/zoxide) es un reemplazo de cd. Recuerda las carpetas por las que pasaste, así la próxima vez llegás más fácil. Digamos que hacés `cd ~/.config/omarchy` una vez. La próxima, alcanza con `cd omarchy` (o incluso `cd oma`), y Zoxide te lleva directo ahí.

El manual completo está en `man zoxide`.

## ripgrep

[ripgrep](https://github.com/BurntSushi/ripgrep) busca dentro del contenido de los archivos con `rg <pattern> <path>`, por ejemplo `rg Controller app/` para encontrar todas las veces que aparece `Controller` en la carpeta app.

Neovim también usa esta herramienta cuando escribís `Space S G`.

El manual completo está en `man rg`.

## eza

[eza](https://eza.rocks/) es un reemplazo de ls. Te da listados de carpetas con más información, colores e íconos. Por defecto, eza tiene el alias ls. También podés usar `lt` para un listado con dos niveles de anidamiento. `lsa` te da un listado que incluye los archivos ocultos. Y `lta`, un listado anidado con archivos ocultos.

El manual completo está en `man eza`.

## fd

[fd](https://github.com/sharkdp/fd) es un reemplazo de `find` mucho más fácil de usar. Usá `fd person.rb` para encontrar un archivo llamado `person.rb` dentro del árbol actual. `fd person.rb /` busca en todo el sistema de archivos. `fd person.rb / -H` busca en todo el sistema de archivos, carpetas ocultas incluidas.

El manual completo está en `man fd`.

## bat

[bat](https://github.com/sharkdp/bat) es `cat` con resaltado de sintaxis, números de línea y paginación. Ejecutá `bat somefile.rb` y vas a entender por qué cuesta volver atrás. También trabaja calladito para vos en otros lados: es lo que colorea tus páginas de manual y lo que dibuja las vistas previas en `ff`.

El manual completo está en `man bat`.

## tldr

[tldr](https://tldr.sh/) es el antídoto contra las páginas de manual que arrancan con tres pantallas de historia antes de mostrarte un solo ejemplo. `tldr tar` te da el puñado de usos que en realidad querías.

## yt-dlp

[yt-dlp](https://github.com/yt-dlp/yt-dlp) descarga videos de YouTube y de cientos de otros sitios. `yt-dlp <url>` baja la mejor calidad disponible a la carpeta actual.

El manual completo está en `man yt-dlp`.

## try

[try](https://github.com/tobi/try) te facilita organizar experimentos de programación en carpetas con fecha. Todos los experimentos viven en `~/Work/tries` y llegás a ellos con `try`.

Omarchy no agrega automáticamente la carpeta `bin/` de un proyecto al `PATH`. Ejecutá las herramientas locales de un proyecto en el que confiás con una ruta relativa explícita, como `bin/rails` o `./bin/dev`.
