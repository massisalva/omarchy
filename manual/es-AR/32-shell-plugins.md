# Plugins de la shell

El escritorio de Omarchy corre como un único proceso de Quickshell, siempre abierto, llamado `omarchy-shell`, y casi todo lo que ves en pantalla es un plugin dentro de él. La barra es un plugin. También lo son los paneles que se despliegan desde ella, las capas a pantalla completa como el selector de emojis y el administrador del portapapeles, el propio menú de Omarchy, la pantalla de bloqueo, el diálogo de polkit y los servicios sin interfaz que vigilan tu batería y te calientan la pantalla de noche.

No es solo un detalle de implementación. Significa que podés apagar partes del escritorio, cambiarlas por otras o escribir las tuyas sin tocar una sola línea del código de Omarchy.

Los plugins oficiales vienen con Omarchy y viven en `$OMARCHY_PATH/shell/plugins/`. Todo lo que agregues vos — tus propios experimentos, o algo que encontraste en GitHub — vive en `~/.config/omarchy/plugins/`. Los dos se descubren igual al arrancar, pero los integrados reciben interfaces de confianza de la shell, mientras que los de terceros reciben una interfaz limitada a su propio servicio y ciclo de vida. Los clones de los integrados conservan solo la configuración propia de su origen y las llamadas de interfaz que necesita el comportamiento original.

## Ver lo que tenés

```
omarchy plugin list
```

Eso muestra cada plugin encontrado con su id, si está activado, si es oficial o de terceros, sus tipos y su nombre visible. Agregá `--json` si se lo vas a pasar a otra cosa.

Los ids de los plugins tienen espacio de nombres. Todos los integrados empiezan con `omarchy.` — `omarchy.clock`, `omarchy.network`, `omarchy.notifications` — y ese espacio de nombres está reservado, así que un plugin de terceros nunca lo puede usar.

## Prenderlos y apagarlos

```
omarchy plugin enable omarchy.tailscale
omarchy plugin disable omarchy.weather
```

O usá el menú: _Configurar > Plugins_ tiene Activar, Desactivar, Agregar, Clonar y Eliminar, cada uno con un selector que solo ofrece los plugins que tienen sentido para esa acción.

El estado de activado se guarda en `~/.config/omarchy/shell.json`, y la regla cambia un poco según el tipo de plugin. Un plugin de terceros está activado justo cuando su id aparece en algún lado de ese archivo: como entrada de la distribución de la barra, como entrada en `plugins[]` o como `bar.id`. Los plugins oficiales que no son widgets de la barra funcionan al revés: vienen prendidos y solo se apagan si están en `disabledPlugins[]`.

Un plugin de barra completa directamente no tiene estado apagado. Siempre hay exactamente una barra, así que la reemplazás activando otra. Cómo ubicar widgets en la barra se explica en [la barra superior](05-the-top-bar.md).

## Agregar un plugin desde git

Un plugin de terceros es simplemente un repositorio git con un `manifest.json` en la raíz.

```
omarchy plugin add https://github.com/acme/omarchy-weather.git --enable
```

Antes de hacer nada, te avisa claramente que los plugins corren como código arbitrario, sin sandbox, dentro del proceso de la shell que está siempre abierto, te muestra la URL y te pide que confirmes. Tomalo en serio. La interfaz para plugins de terceros no expone directamente los servicios de autenticación, y una barra de reemplazo recibe solo capacidades limitadas para la interfaz configurada que no es de autenticación. Igual, los plugins visuales comparten la escena QML de la shell y pueden recorrer los objetos padre comunes, y todo el código de los plugins corre con todo lo que tu cuenta de usuario puede alcanzar. El estado de autenticación se protege aparte, dejando esos servicios fuera del grafo de objetos del host al que se puede llegar. Agregá solo repositorios que estés dispuesto a ejecutar, y leelos antes de activarlos.

Una barra de reemplazo puede mostrar los widgets instalados, pero los widgets de terceros que dependen de un servicio pueden funcionar a medias ahí, porque la barra no tiene permitido pedir el objeto de servicio activo de otro plugin. Volvé a la `omarchy.bar` integrada si un widget así necesita su servicio compañero.

Después clona el repositorio en una carpeta temporal, valida el manifiesto, rechaza la instalación si otro plugin ya usa ese id y lo mueve a `~/.config/omarchy/plugins/<id>/`. Sin `--enable` te pregunta si lo querés activar ya, y podés decir que no e ir a leer el código primero. Nunca ejecuta nada del plugin, nunca corre un hook de instalación y nunca pide sudo: clona archivos, revisa el manifiesto y cambia un bit por IPC.

Actualizar es un pull de avance rápido de esa misma copia:

```
omarchy plugin update acme.weather
omarchy plugin update
```

Sin id, actualiza todos los plugins que tengas manejados con git. Te muestra el diff antes de aplicarlo, no actualiza si tenés cambios locales que impiden el avance rápido y vuelve atrás si la revisión nueva no pasa la validación.

```
omarchy plugin remove acme.weather
```

Al eliminarlo, primero se desactiva el plugin y después se borra si es una copia git (el repositorio sigue estando en su origen) o se quita el enlace si es un enlace simbólico. Una carpeta de plugin hecha a mano, sin repositorio git, se mueve a una copia de seguridad con fecha y hora dentro de la carpeta de plugins en vez de borrarse así nomás.

## Clonar un integrado para modificarlo

Esta es mi parte favorita. Si querés cambiar cómo funciona un widget integrado, no edites los archivos de `$OMARCHY_PATH`: son del paquete y la próxima actualización los va a pisar. Mejor clonalo:

```
omarchy plugin clone omarchy.clock
```

Eso copia todo el plugin a `~/.config/omarchy/plugins/dhh.clock` (con tu nombre de usuario, no el mío), lo renombra a "My Clock", lo activa y hace que la shell use tu copia en lugar del integrado, conservando la posición y los ajustes si era un widget de la barra. Agregá `--edit` para abrir la carpeta nueva en tu `$EDITOR` en el momento, que es lo que hace por vos _Configurar > Plugins > Clonar plugin_ en el menú.

El prefijo con tu nombre de usuario hace que el id de tu clon sea tuyo, así que si lo compartís no choca con el de nadie. Las llamadas al id integrado original van a tu clon, así que nada que haga referencia a `omarchy.clock` necesita cambiarse. Y si la embarrás, `omarchy plugin remove dhh.clock` vuelve a poner el integrado.

Si guardás un archivo en cualquier lugar dentro de `~/.config/omarchy/plugins/`, el código del plugin se recarga solo, así que podés dejar el editor abierto y ver tus cambios a medida que los hacés.

## Escribir los tuyos

Un plugin es una carpeta con un `manifest.json` y algo de QML. El manifiesto declara `schemaVersion: 1`, un `id`, `name`, `version`, uno o más `kinds` y un objeto `entryPoints` que apunta al archivo QML de cada tipo:

| Tipo | Qué es |
|------|------------|
| `bar-widget` | Un componente que la barra activa puede poner en una sección |
| `panel` | Una ventana flotante fija o que aparece a pedido |
| `overlay` | Una capa a pantalla completa |
| `menu` | Un menú que aparece a pedido |
| `service` | Un singleton sin interfaz visible |
| `bar` | Una barra completa que reemplaza a la integrada |

Un plugin puede declarar varios tipos a la vez: el plugin multimedia es un `service` y un `bar-widget` al mismo tiempo. Los widgets de la barra llevan además un bloque `barWidget` con un nombre visible, una categoría, un `defaultSection` opcional y `allowMultiple`, que indica si tiene sentido tener más de uno en la barra. La mayoría de los widgets lo ponen en `false`; los separadores y los indicadores, en `true`.

Antes de publicar nada, revisalo:

```
omarchy plugin validate ./my-plugin
```

Eso corre las mismas comprobaciones que hace la shell al cargarlo: la versión del esquema, los campos obligatorios, un id que no esté reservado, puntos de entrada que sean rutas relativas seguras y que existan de verdad, un punto de entrada para cada tipo que declaraste, y ningún enlace simbólico en ninguna parte de la carpeta.

Para desarrollar plugins, mirá la [referencia de la shell](https://github.com/omacom/omarchy/blob/quattro/docs/omarchy-shell.md) y el [catálogo de plugins oficiales](https://github.com/omacom/omarchy/blob/quattro/shell/plugins/README.md).

## Compartir los tuyos con el mundo

Cuando tengas algo que te guste, subilo a un repositorio git público. Ese es todo el mecanismo de distribución: cualquiera puede correr `omarchy plugin add` con tu URL y tenerlo andando en segundos.

Para que la gente lo encuentre de verdad, publicalo en [plugins.omarchy.org](https://plugins.omarchy.org). Es el mercado de plugins de la shell de Omarchy, y el primer lugar donde buscar cuando te preguntás si alguien ya hizo el widget que estás por escribir. ¡Pegale una mirada antes de arrancar!
