# Ajustes comunes

Esta es una colección de cambios comunes a la configuración de Omarchy. Tené en cuenta que, de vez en cuando, una actualización del sistema puede necesitar volver ciertas configuraciones a su estado original. Si pasa, tus cambios no se pierden: quedan en un archivo `.bak` en la misma carpeta.

Si rompés algo, podés volver configuraciones sueltas a su estado original desde _Actualizar > Configuración_ en el menú de Omarchy. Si rompés _todo_ en serio, podés restablecer todas las configuraciones con `omarchy-reinstall`.

### Mostrar siempre todos los íconos de la bandeja

Por defecto, los íconos de la bandeja, como Dropbox, 1Password o Steam, quedan escondidos detrás de la flechita de la bandeja, que los muestra cuando le pasás el cursor por encima. Si los querés tener siempre a la vista, hacé clic derecho en la flechita para abrir el administrador de íconos de la bandeja y fijá los que querés dejar visibles (también podés ocultar los que no querés ver nunca).

### Esquinas redondeadas en las ventanas

El diseño predeterminado de Omarchy usa esquinas rectas, pero si lo querés suavizar un poco, podés cambiar `~/.config/hypr/looknfeel.lua` para que el redondeo deje de estar comentado:

```
hl.config({
  decoration = {
    -- Use round window corners.
    rounding = 8,
  },
})
```

### Sacar los espacios entre ventanas

En las pantallas de notebook, hay gente que prefiere no gastar ni un píxel en espacios entre ventanas (ni en una barra superior, que podés ocultar con `Super + Shift + Space`). Podés sacar todos los espacios y bordes con `Super + Shift + Backspace`, o sacarlos para siempre descomentando esta sección de `~/.config/hypr/looknfeel.lua`:

```
hl.config({
  general = {
    -- No gaps between windows or borders.
    gaps_in = 0,
    gaps_out = 0,
    border_size = 0,
  },
})
```
