# Extracción de texto y dictado

### Extracción de texto

Apretá `Super + Ctrl + PrtScr` para marcar una zona de la pantalla de la que querés sacar el texto. El modelo OCR de código abierto tesseract convierte esa selección en texto en un toque y lo deja en el portapapeles. Después solo apretás `Super + V` para pegar.

Viene re bien para sacar direcciones del pie de una imagen o números de teléfono metidos en el encabezado de una web.

 ![text-extraction](images/text-extraction.webp)

### Dictado

En las instalaciones nuevas, [Superwhisper](https://superwhisper.com/) es el motor de dictado predeterminado: procesa en la nube, sin descargar modelos locales. Elegí entre Superwhisper y [Voxtype](https://voxtype.io/) en _Configurar > Predeterminados > Dictado_ en el menú de Omarchy. Al elegir un motor, se instala si hace falta y queda como predeterminado para el dictado. Voxtype carga un modelo base en inglés que ocupa 150 MB; cambiá el modelo con `voxtype setup model` y el resto de los ajustes en `~/.config/voxtype/config.toml`. Superwhisper abre sus ajustes para que elijas procesamiento en la nube o local, y OPR mantiene la aplicación actualizada.

Dictás manteniendo apretado `Right Alt` o `F9`, o prendiéndolo y apagándolo con `Super + Ctrl + X`, y el texto dictado aparece en el campo que tenga el foco. Estos atajos usan el motor que elegiste. Right Alt también arranca el dictado cuando lo usás en una combinación con modificadores; para esas combinaciones usá Left Alt. En las distribuciones de teclado donde Right Alt es AltGr, usá `F9` así AltGr te sigue sirviendo para escribir.

Los mismos atajos funcionan con cualquiera de los dos motores. Elegí el tuyo en Configurar > Predeterminados > Dictado. El instalador del motor lo configura y guarda tu elección. Ejecutá `omarchy default dictation` para ver cuál está elegido. La elección se guarda en `~/.config/omarchy/defaults/dictation`. Las instalaciones nuevas eligen Superwhisper automáticamente.

Omarchy carga solo la integración con el escritorio del motor elegido. No hace falta configurar nada de Superwhisper en `~/.config/hypr/`.

Los atajos y scripts propios pueden usar `omarchy dictation start`, `omarchy dictation stop` y `omarchy dictation toggle`. El motor elegido se encarga de grabar y transcribir. Al elegir Superwhisper se desactiva su atajo nativo de mantener apretado y su atajo nativo para prender y apagar queda en `Alt + Space`, separado de las teclas de grabación de Omarchy. Superwhisper necesita al menos un atajo nativo de grabación, y su atajo para cancelar sigue disponible.

Se pueden sumar otros motores sin tocar Omarchy. Poné en el PATH un ejecutable llamado `omarchy-dictation-<backend>` que acepte `start`, `stop` y `toggle` y responda rápido, con un código de salida distinto de cero si falla. Su instalador configura el proveedor y llama a `omarchy-dictation-use <backend>` cuando la configuración sale bien. Eso detiene el motor anterior y guarda la elección de forma atómica; `stop` tiene que funcionar aunque el proveedor esté inactivo o no esté disponible. Los nombres de motor usan minúsculas, dígitos y guiones. Incluí `omarchy-install-dictation-<backend>` para la instalación; `omarchy default dictation <backend>` lo ejecuta. Agregá una entrada al menú Predeterminados con una extensión del menú de Omarchy para llamar a ese selector. La integración opcional con el escritorio puede ir en `${XDG_CONFIG_HOME:-$HOME/.config}/<backend>/shortcuts.lua`.
