# Herramientas de desarrollo

## Editores alternativos

Omarchy viene con [Neovim](https://neovim.io/) por defecto, pero si preferís algo más común y conocido, podés abrir el menú de Omarchy (`Super + Space`) y mirar las opciones en _Instalar > Editor_. Ahí tenemos VSCode, Cursor, Zed, Sublime Text, Helix, Vim y Emacs. Si no encontrás lo que buscás, fijate en _Instalar > Paquete_ si no está como paquete de Arch (y si no, probá _Instalar > AUR_ para buscar en el AUR).

El editor `vi` original también viene incluido. Ejecutá `vi filename` para editar un archivo en la terminal.

`VSCode`, `Cursor`, `VSCodium` y `Helix` pueden seguir el tema del sistema.

Podés definir el editor predeterminado de todo el sistema en `Configurar > Predeterminados > Editor`.

## Entorno

Omarchy te deja configurar un montón de entornos de desarrollo desde la sección _Instalar > Desarrollo_ del menú de Omarchy (`Super + Space`). Obviamente vas a encontrar _Ruby on Rails_, pero también los tres runtimes principales de JavaScript (Node.js, Bun, Deno) y frameworks populares de PHP como Laravel y Symfony. Ah, y también hay Go, Rust, Python, Java, Elixir (con Phoenix), .NET, OCaml, Zig, Clojure y Scala. ¡Es una selección muy amplia!

La mayoría de estos entornos los maneja [Mise](https://mise.jdx.dev/). Es una herramienta que te deja instalar y correr varias versiones de un lenguaje de programación en la misma máquina. Es como rbenv o rvm para Ruby, o virtualenv para Python, pero sirve para un montón de entornos distintos.

Para instalar, por ejemplo, Ruby, ejecutarías `mise use -g ruby`, que instala Ruby y además lo deja como predeterminado global. O, si tu proyecto tiene un archivo .ruby-version, alcanza con ejecutar `mise i` en la raíz del proyecto.

## Herramientas CLI preinstaladas

Omarchy deja disponibles herramientas como `gh`, `uv` y la mayoría de los [agentes de programación](17-ai.md) con la [instalación diferida de mise](https://mise.jdx.dev/dev-tools/shims.html#lazy-tools). La primera vez que corrés una, mise la instala. Las siguientes veces se reutiliza la versión instalada; no se busca una actualización cada vez que la abrís.

También podés revisar las predeterminadas o instalarlas por adelantado:

```bash
mise ls --current              # List the tools configured for this directory
mise install gh               # Install one tool now
mise install --include-lazy    # Install all configured tools, including lazy tools
```

Ejecutá `omarchy update` para actualizar las herramientas instaladas junto con el resto de Omarchy. El alias `mup` actualiza solo las herramientas que maneja mise. Para sumar otra herramienta a tu propia configuración, usá `mise use -g <tool>`.

La configuración de Python también instala `uv` con mise. Si desinstalás el entorno de desarrollo de Python, `uv` queda disponible como herramienta independiente.

### Usar tu propia instalación

Los comandos de mise van antes que `~/.local/bin` en el `PATH`, así que una herramienta que instalaste por tu cuenta, por ejemplo con el instalador propio de Claude Code o de Cursor, igual corre la copia de mise. Las apps que se abren desde el escritorio también encuentran los comandos de mise antes que los paquetes del sistema, así que una app que ejecuta `gh` usa la copia de mise aunque hayas instalado `github-cli` con pacman, y mise instala esa copia la primera vez. Para usar la tuya, desactivá la copia de mise en `~/.config/mise/config.toml`. Por ejemplo, si instalaste Cursor CLI por tu cuenta:

```toml
[settings]
disable_tools = ["cursor-agent"]
```

Si ya tenés una tabla `[settings]`, agregá la entrada ahí; si ya hay una lista `disable_tools`, sumale el nombre en vez de reemplazarla. Asegurate de que tu instalación esté en el `PATH`. Usá el nombre de la herramienta en mise, que puede ser distinto del comando: `oh-my-pi` es el que trae `omp`, por ejemplo. El lanzador del agente predeterminado también prefiere un Cursor o Muse que hayas instalado vos en `~/.local/bin`.

### Quitar y restaurar las predeterminadas

_Eliminar > Preinstalados_ hace que mise ignore, para tu usuario, las herramientas que declara Omarchy, agregándolas a `ignored_config_paths` en `~/.config/mise/miserc.toml`. _Instalar > Preinstalados_ vuelve a sacar esa línea. Las herramientas que declares vos, en tu propia configuración o en el `mise.toml` de un proyecto, siguen funcionando en los dos casos. Si elegís un agente predeterminado o configurás Python después de quitar las preinstaladas, esa herramienta se agrega a tu propia configuración. Las dos opciones afectan solo a tu usuario; los demás usuarios de la máquina conservan su propia elección.

## Docker

[Docker](https://www.docker.com/) casi no necesita presentación. Te deja correr contenedores aislados, y Omarchy instala todo lo necesario para que funcione bien, incluidos Docker y [Docker Compose](https://docs.docker.com/compose/).

Por defecto, tu usuario *no* está en el grupo `docker`. Ese grupo equivale en la práctica a root sin contraseña — cualquier cosa que esté en él puede hacer `docker run -v /:/host` y adueñarse de la máquina — así que un solo script o dependencia maliciosa corriendo con tu usuario quedaría a un comando de ser root. Por eso, en la línea de comandos usás Docker con `sudo` (`sudo docker ps`, `sudo docker compose up`), y las herramientas gráficas que hablan con el demonio — la máquina virtual de Windows — piden autorización cuando la necesitan. Si querés volver a la comodidad de usarlo sin sudo y entendés lo que eso implica, activalo desde **Configurar > Seguridad > Docker sin sudo** (o ejecutá `omarchy-setup-security-sudoless-docker`), que te agrega al grupo `docker` después de una advertencia; a partir de ahí, `docker` a secas y el alias `d` vuelven a funcionar sin `sudo`.

Podés configurar las bases de datos más comunes para desarrollo local en Docker con _Instalar > Desarrollo > Docker DB_ en el menú de Omarchy.

## GitHub CLI

[GitHub CLI](https://cli.github.com/) está disponible como `gh` para trabajar con repositorios, issues y pull requests desde la terminal. Ejecutá `gh auth login` para instalarla la primera vez e iniciar sesión, y después `gh repo clone org/repo` para clonar un repositorio. Ejecutá `gh --help` para ver sus comandos.

Para una interfaz de terminal para pull requests, ejecutá `ghui`; mise también la instala la primera vez que la usás. [Lazygit](https://github.com/jesseduffield/lazygit) viene preinstalado para trabajar con Git en sí.
