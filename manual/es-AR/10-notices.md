# Avisos

Las notificaciones aparecen en la esquina superior derecha de la pantalla activa. Con los avisos también podés ver rápido la fecha y la hora, el estado de la batería y el clima actual, cada uno con su atajo de teclado.

## Notificaciones

Las notificaciones de una misma app o sitio se apilan en un mazo, así un canal de Slack charlatán no te saca de la pantalla el aviso de que falló tu build. Pasá el mouse por un mazo para desplegarlo; mientras leés, no aparece nada nuevo debajo del puntero. Hacé clic en una tarjeta para ir a donde se originó, o descartala con clic derecho, clic del medio o la ✕.

Las tarjetas ofrecen lo que traen: _Copiar código_ para los códigos de verificación (que quedan fuera del [historial del portapapeles](08-unified-clipboard-history.md) y se borran al minuto), más los botones que agregue la app. Los links en el texto de una notificación se abren con un clic.

Para usarlas sin el mouse, apretá `Super + Ctrl + ,`. Se selecciona la notificación más nueva y sus botones se numeran: apretá un número para usar uno, `Enter` para hacer clic en la notificación, `↑` y `↓` para moverte entre notificaciones, `Delete` para descartar una y `Esc` para devolver el teclado. También lo suelta sola después de unos segundos sin actividad.

Silenciar las notificaciones las retiene, salvo las confirmaciones del propio Omarchy, las alertas de emergencia y los códigos de verificación, que pediste hace un momento. Volvé a mostrar las últimas, retenidas o no, con `Super + Shift + Alt + ,`. El historial se guarda por un día.

## Avisos con atajo

### Fecha y hora

`Super + Ctrl + Alt + T`

 ![notice-datetime](images/notice-datetime.webp)

### Clima

`Super + Ctrl + Alt + W`

 ![notice-weather](images/notice-weather.webp)

La ubicación se detecta a partir de tu dirección IP, que suele ser bastante precisa, aunque no siempre. Podés fijarla con `omarchy weather location --set Malibu`, o ser exacto agregando coordenadas: `omarchy weather location --set Malibu 34.0259,-118.7798`. Ejecutá `omarchy weather location` solo para ver dónde cree que estás, y `--clear` para volver a la detección automática.

### Batería

`Super + Ctrl + Alt + B`

 ![notice-battery](images/notice-battery.webp)
