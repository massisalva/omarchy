# Preguntas frecuentes

### ¿Cómo cambio entre distribuciones de teclado?

Editá tu archivo `~/.config/hypr/input.lua` y agregá esto para cambiar entre distribuciones con `Left Alt + Right Alt`:

```
hl.config({
  input = {
    -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt
    kb_layout = "us,fr",
    kb_options = "omarchy:shift_caps_compose,grp:alts_toggle",
  },
})
```

En cuanto tengas varias distribuciones configuradas, la barra muestra sola la distribución de teclado actual (y también podés hacer clic ahí para cambiarla).

### ¿Cómo paso el reloj a formato de 12 horas?

Hacé clic derecho en el reloj de la barra para recorrer los formatos más comunes, incluidos los de 12 horas. También podés definir el formato directamente:

```
omarchy bar set omarchy.clock format "dddd h:mm AP"
```

Eso muestra Domingo 10:55 AM.

### ¿Cómo cambio mi zona horaria?

Abrí _Actualizar > Zona horaria_ en el menú de Omarchy y elegila de la lista. Si la zona horaria está bien pero el reloj se atrasó o se adelantó, _Actualizar > Hora_ reinicia la sincronización de la hora por vos.

### ¿Cómo cambio el DNS, comparto el Wi-Fi o mido la velocidad de la conexión?

Todo eso está en [redes](35-networking.md).

### ¿Cómo veo qué tan rápido es mi disco?

_Acciones > Medir velocidad > Velocidad de disco_ mide en vivo la velocidad de lectura y escritura de tu disco, o usá `omarchy disk speedtest` desde la terminal.

### ¿Por qué no puedo iniciar sesión con mi cuenta de Google en Chromium?

La versión de código abierto de Chromium no trae las credenciales OAuth que Google pide para iniciar sesión con una cuenta. Abrí _Instalar > Servicio > Cuenta de Chromium_ en el menú de Omarchy para agregarlas, reiniciá el navegador y el inicio de sesión va a funcionar.

### ¿Cómo agrego una impresora?

La impresión ya viene configurada y andando, y cada impresora la agregás vos desde _Print Settings_ en el lanzador de aplicaciones (`Super + Space`).

Elegí _Add_ y dale un momento para buscar: una impresora conectada por USB, y la mayoría de las impresoras de red, aparecen solas. Si la tuya no está en la lista, elegí _Network Printer > Internet Printing Protocol (ipp)_ y escribí su dirección: te la dice la pantallita de la impresora o su página web, y suele ser algo como `192.168.1.50` con la cola `ipp/print`. Después _Forward_ te ofrece un driver: una impresora moderna anda mejor con el perfil sin driver _IPP Everywhere_, y una más viejita necesita el driver propio del modelo.

Hacé clic derecho en una impresora y elegí _Set as Default_ para que tus apps la usen primero, y _Properties_ para configurar el tamaño de papel, la impresión doble faz y la calidad.

La detección automática, en la que las impresoras de la red aparecen sin tener que agregarlas, está apagada por un tiempo mientras se rehace, y por eso el primer paso de arriba lo tenés que hacer vos en vez de que sea automático. Imprimir a un archivo PDF funciona sin ninguna impresora.

### ¿Cómo cambio dónde se guardan las capturas o las grabaciones de pantalla?

Las capturas de pantalla guardadas van a `~/Pictures/Screenshots` por defecto. Para usar otra carpeta, agregá esto a un archivo en `~/.config/uwsm/env.d/` (por ejemplo `~/.config/uwsm/env.d/capture`):

```
export OMASNAP_SCREENSHOT_DIR="$HOME/Pictures/Captures"
```

Para las grabaciones de pantalla podés hacer lo mismo con `OMARCHY_SCREENRECORD_DIR`.

Omasnap crea solo su carpeta de capturas. La carpeta de grabaciones la tenés que crear vos, y después reiniciar Omarchy para que cualquiera de los dos cambios de entorno tome efecto.

### ¿Cómo hago andar los parlantes y la webcam de mi Apple Studio Display?

Uno pensaría que todo funciona con solo enchufar el USB C, pero lamentablemente no. La solución que encontré para que ande siempre es usar [el cable WJESOG DisplayPort + USB-A => USB-C](https://www.amazon.com/WJESOG-DisplayPort-Adapter-Converter-Thunderbolt/dp/B0BNX7MS6N/). Con eso, los parlantes y la webcam andan de maravilla.

Acordate de que Omarchy trae control de brillo para las pantallas de Apple (tanto la Studio como la XDR) con las teclas de brillo comunes del teclado.

### ¿Cómo me saco de encima todo el software extra?

Si no querés programas como Obsidian, LibreOffice o cualquiera de las otras cosas preinstaladas, los podés sacar muy fácil.

Abrí _Eliminar > Paquete_ para ver todos los paquetes instalados. Después marcá con Tab los paquetes que quieras sacar y borrá todo lo marcado con Enter.

Y podés usar _Eliminar > Web app_ desde el menú de Omarchy para sacar cualquiera de las web apps preinstaladas que no quieras.

O abrí _Eliminar > Preinstalados_ para barrer de una vez con todos los extras preinstalados — web apps, TUIs y aplicaciones opcionales. Los atajos de teclado que los abrían se van con ellos, así que te queda una hoja en blanco de atajos para llenar con los tuyos en `~/.config/hypr/bindings.lua`.

---

Para errores y cosas rotas, mirá [la sección de Solución de problemas](45-troubleshooting.md).
