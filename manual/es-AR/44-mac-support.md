# Soporte para Mac

Omarchy trae soporte integrado para **Macs con Intel**. Por ahora hay un par de limitaciones conocidas, pero si las tenés claras y no te molestan, vas a poder darles una segunda vida a tus Macs viejas instalándoles Omarchy.

Tené en cuenta que, por ahora, no hay soporte directo para instalar en una Mac de la serie M. Podés enterarte cómo viene eso en #omarchy-on-other en nuestro [Discord](https://discord.gg/tXFUdasqhY).

En una prueba simple, logramos un 36 % más de rendimiento en una MacBook Pro de 2019 solo por instalar Omarchy.

 ![macbook-omarchy](images/macbook-omarchy.webp)

### Instalar Omarchy en una Mac

Por ahora, Omarchy solo se puede usar como **único** sistema operativo instalado. Durante la instalación se borra el disco y macOS ya no va a poder arrancar.

Igual, si querés, después lo podés restaurar con Recuperación por Internet.

Para esta parte, damos por hecho que ya leíste [Primeros pasos](02-getting-started.md) y tenés el pendrive listo. Si no, dale, hacelo ahora.

#### Desactivar el Arranque seguro

Hay que desactivar el Arranque seguro de Apple para poder arrancar desde el pendrive y también el sistema operativo. Para desactivarlo:

1. Apagá tu Mac
2. Prendela e _inmediatamente_ mantené apretado Command-R hasta que aparezca la pantalla de carga
3. Elegí tu usuario y escribí tu contraseña si te la pide
4. En la pantalla de recuperación, elegí **Utilidades > Utilidad de Seguridad de Arranque** en la barra de menús
5. Escribí tu contraseña cuando te la pida para autenticarte
6. Elegí «Sin seguridad» en las opciones de Arranque seguro
7. Elegí «Permitir el arranque desde medios externos o extraíbles» en las opciones de Arranque externo

#### Arrancar la instalación

1. Enchufá el pendrive
2. Reiniciá tu Mac e _inmediatamente_ mantené apretada la tecla Option hasta que aparezca una pantalla con los dispositivos de arranque
3. Elegí el dispositivo naranja EFI Boot
4. Seguí con la [instalación como siempre](02-getting-started.md)

El instalador detecta el hardware Mac y aplica solo las correcciones que hacen falta: los drivers y el firmware del Wi-Fi Broadcom, el driver de teclado SPI en los modelos de MacBook que lo necesitan y un arreglo de suspensión del NVMe para esos mismos modelos.

### Limitaciones conocidas

La gente de la comunidad trabaja todo el tiempo en soluciones para estas cosas, así que si alguna te complica, sumate a #omarchy-on-other en nuestro [Discord](https://discord.gg/tXFUdasqhY) y fijate si hay formas nuevas de resolverlo.

#### Equipos con chip T1

El chip Apple T1 salió a fines de 2016 y se usó solo en los primeros modelos de MacBook Pro con Touch Bar.
- MacBook Pro de 13 pulgadas (2016, dos puertos Thunderbolt 3) – Modelo: A1706
- MacBook Pro de 13 pulgadas (2016, cuatro puertos Thunderbolt 3) – Modelo: A1708
- MacBook Pro de 15 pulgadas (2016) – Modelo: A1707

#### Problemas conocidos

- La Touch Bar no funciona
- El sonido no funciona

#### Equipos con chip T2

El chip de seguridad Apple T2 salió en 2017. Se dejó de usar con el paso a Apple silicon (chips de la serie M), a partir de 2020.

- iMac Pro (2017) – Modelo: A1862
- MacBook Pro de 13 pulgadas (2018, cuatro puertos Thunderbolt 3) – Modelo: A1989
- MacBook Pro de 15 pulgadas (2018) – Modelo: A1990
- MacBook Air (Retina, 13 pulgadas, 2018) – Modelo: A1932
- Mac mini (2018) – Modelo: A1998
- MacBook Pro de 13 pulgadas (2019, dos puertos Thunderbolt 3) – Modelo: A2159
- MacBook Pro de 13 pulgadas (2019, cuatro puertos Thunderbolt 3) – Modelo: A2178
- MacBook Pro de 15 pulgadas (2019) – Modelo: A1990
- iMac (Retina 5K, 27 pulgadas, 2020) – Modelo: A2115 (iMac20,1 e iMac20,2)
- MacBook Pro de 13 pulgadas (2020, dos puertos Thunderbolt 3) – Modelo: A2265
- MacBook Pro de 15 pulgadas (2020) – Modelo: A1990

En estos modelos, el instalador configura solo el kernel parcheado `linux-t2`, la configuración de audio T2, el firmware de Wi-Fi/Bluetooth Broadcom de Apple y el control de ventiladores con `t2fanrd`. La Touch Bar funciona con el soporte estilo Boot Camp que trae el kernel.
