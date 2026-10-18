# Seguridad

Omarchy se toma la seguridad muy en serio. La idea es que sea un sistema operativo con el que puedas hacer _Trabajo de Verdad_ en el _Mundo Real_. Donde perder una notebook no termine en una emergencia de seguridad. Así que esto es lo que hacemos:

1. *El cifrado de disco completo es obligatorio*: Es el paso más importante para proteger físicamente tus datos. Si perdés la computadora o te la roban, los datos están totalmente cifrados con LUKS (Linux Unified Key Setup), el estándar.
2. *El firewall viene activado por defecto*: Todo el tráfico entrante está bloqueado por defecto, salvo el puerto 53317 para [LocalSend](https://localsend.org/). Hasta ssh está apagado hasta que lo activás con _Configurar > Seguridad > SSHD_, que como parte de la configuración abre el puerto 22 (con límite de conexiones contra ataques de fuerza bruta). Incluso restringimos el acceso de Docker con la configuración de [ufw-docker](https://github.com/chaifeng/ufw-docker), para que tus contenedores no queden expuestos al mundo por accidente.
3. *Arch siempre tiene las últimas actualizaciones*: Arch, la distro sobre la que está construido Omarchy, es una distribución rolling. Eso significa que cualquier vulnerabilidad de seguridad que se descubra y se parchee en cualquier paquete queda disponible enseguida para instalar con `omarchy-update`. Así siempre corrés las versiones más nuevas y más seguras de todo.
4. *Omarchy mantiene sus propios paquetes y su propio mirror*: Por defecto, Omarchy solo usa paquetes de los repositorios core/extra/multilib de Arch y de su propio Repositorio de paquetes de Omarchy. Podés instalar software directamente desde el AUR, pero la instalación base no lo hace — solo unas pocas instalaciones opcionales, como los navegadores de terceros, bajan cosas del AUR.
5. *Cloudflare nos protege de los DDoS*: La infraestructura de distribución de Omarchy — las ISOs, los paquetes de Omarchy, el mirror de Arch — está protegida detrás del tremendo escudo anti-DDoS de Cloudflare y alojada en su CDN. Eso da una disponibilidad excelente.

## Cambiar tus contraseñas

En una instalación cifrada tenés dos contraseñas: la que desbloquea el disco al arrancar y la que usás para iniciar sesión y para `sudo`. La configuración inicial las deja iguales. Las dos se cambian en _Actualizar > Contraseña_ en el menú de Omarchy — _Cifrado de la unidad_ para la primera, _Usuario_ para la segunda. Cambiar la contraseña del disco primero te pide la actual, así que tenela a mano. Si un cambio se interrumpe, volvé a abrir _Cifrado de la unidad_: te pide la contraseña que desbloquea el disco ahora y termina el cambio.

## Pasarle a otro una máquina que ya usaste

Si le vas a dar tu máquina a otra persona, no hace falta reinstalarla. Abrí _Configurar > Restablecer equipo_ en el menú de Omarchy, escribí `reset` para confirmar y reiniciá. Eso borra todas las cuentas de usuario y todo lo que hay en `/home`, descarta todos los paquetes y cambios del sistema que hiciste desde la instalación y borra la identidad de la máquina — conexiones de red, claves del equipo y todo lo demás. Lo que vuelve a arrancar es el asistente de configuración del primer arranque, listo para que el nuevo dueño escriba su nombre, su contraseña y su contraseña de cifrado.

Funciona restaurando la instantánea base que saca el instalador, así que solo está disponible en máquinas instaladas desde la ISO de Omarchy. Y en un disco sin cifrado, restablecer es borrar, no borrar de forma segura, así que si los datos eran sensibles, mejor hacé una instalación nueva.

## Sudo sin contraseña

A veces querés que `sudo` deje de preguntar, sobre todo cuando un agente de IA está haciendo un trabajo largo en el sistema por vos. _Configurar > Seguridad > Sudo sin contraseña_ te pregunta por cuánto tiempo permitir el acceso: **15 minutes**, **1 Hour**, **1 Day** o **Permanently**. Mientras el acceso está activo, aparece un ícono de advertencia rojo al lado de los otros indicadores de la barra de menú. Hacé clic en él o volvé a ejecutar el comando para cortar el acceso. También podés pasar tu propia cantidad de minutos (de 1 a 1440) con `omarchy-sudo-passwordless 30`, o usar `omarchy-sudo-passwordless permanent`.

El acceso por tiempo vence solo, incluso apenas volvés de una suspensión que pasó el límite. Reiniciar la computadora lo corta antes. El acceso permanente sobrevive a los reinicios y queda activado hasta que lo desactives.

Actualizar o desinstalar el paquete de ajustes de Omarchy corta cualquier permiso temporal antes de que cambie el soporte de vencimiento. Si el comando informa un error de autorización o de limpieza, resolvelo antes de intentar activar otro permiso; un error no significa que el acceso sin contraseña esté inactivo.

Tené esto bien claro: mientras está activado, cualquier cosa que corra con tu usuario puede hacer cualquier cosa como root sin que nadie le pregunte. Ese es justamente el objetivo, y también es justamente el riesgo.

## Claves de firma

La clave pública de todas las firmas de las ISOs y de los paquetes del repositorio de Omarchy es `40DFB630FF42BCFFB047046CF0134EE680CAC571` ([verificala en openpgp.org](https://keys.openpgp.org/search?q=pkgs%40omarchy.org)). El paquete `omarchy/omarchy-keyring` también la incluye y se va a usar para distribuir sin problemas cualquier actualización que haga falta.

Encontrás la firma de cualquier versión de la ISO agregando .sig a la URL. Por ejemplo, https://iso.omarchy.org/omarchy-x.x.x.iso.sig.
