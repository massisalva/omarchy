# Neovim

[Neovim](https://neovim.io/) es una implementación moderna [del editor vi](<https://en.wikipedia.org/wiki/Vi_(text_editor)>) que creó Bill Joy allá por 1976. Es un editor modal, con el modo de inserción y el modo de comandos separados, y se vuelve una especie de superpoder en cuanto aprendés aunque sea una parte de su conjunto de comandos de teclado, que es increíblemente profundo. ¡Pero también tiene una curva de aprendizaje considerable!

Si nunca usaste un editor estilo vim, te recomiendo mirar [la serie Vim As Your Editor de ThePrimeagen](https://www.youtube.com/watch?v=X6AR2RMB5tE&list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R) en YouTube. Con eso aprendés lo básico. Solo tené en cuenta que, a diferencia de otros editores más convencionales y parecidos entre sí, vas a tardar más en manejar vim con soltura. Pero una vez que lo lográs, la recompensa también es mayor.

Ahora, Neovim es prácticamente configurable al infinito. Si de verdad querés volverte loco, podés armar tu propia configuración de Neovim desde cero. Hay un curso excelente de [Typecraft sobre cómo configurar Neovim desde cero](https://www.youtube.com/watch?v=zHTeCSVAFNY). Y [ThePrimeagen también tiene uno](https://www.youtube.com/watch?v=w7i4amO_zaE).

Pero Omarchy trae una configuración completa de Neovim — el paquete `omarchy-nvim` — ajustada con cariño para mostrar lo mejor que se puede hacer desde el primer momento. ¡Sin que tengas que escribir ni una línea de configuración! Está armada sobre [LazyVim](https://www.lazyvim.org/), una distribución de plugins y configuraciones para Neovim. Es buenísima.

## Lo básico de LazyVim

Como te dije, no te voy a enseñar vim en esta introducción cortita, pero sí te puedo mostrar algunas cosas básicas de LazyVim y cómo moverte.

Primero, Neovim tiene la idea de la tecla líder (leader key). Es básicamente la puerta de entrada a todos los comandos. LazyVim la puso en `Space`. Así que apretala, esperá un segundo y vas a ver un montón de opciones explicadas ahí mismo, así:

Estos son algunos comandos básicos que uso todo el tiempo:

- `Space Space` - Buscá cualquier archivo de la carpeta actual con búsqueda difusa.
- `Space S G` - Buscá en todos los archivos con grep, con vista previa.
- `Space E` - Mostrá u ocultá el árbol de archivos.
- `Ctrl + W W` - Saltá del árbol de archivos al editor y de vuelta.
- `Shift + H` - Pasá a la pestaña abierta de la izquierda (vim las llama buffers).
- `Shift + L` - Pasá a la pestaña abierta de la derecha.
- `Space B D` - Cerrá una pestaña.
- `Space B O` - Cerrá todas las pestañas menos la actual.
- `Space G G` - Abrí LazyGit en un panel flotante desde la carpeta actual.
- `Space U W` - Activá o desactivá el ajuste de línea.

Parado en el árbol de archivos (`Space E` para mostrarlo, `Ctrl + W W` para saltar ahí), podés crear un archivo nuevo con `a` o una carpeta nueva con `A`. Apretá `?` en el árbol para ver todos los comandos.

Si querés aprender el lenguaje básico de vim, escribí sobre [la sintaxis de tres partes](https://world.hey.com/dhh/wonderful-vi-a1d034d3) y cómo lograr esas combinaciones espectaculares.

Podés ver todos los comandos posibles en [la página de atajos de LazyVim](https://www.lazyvim.org/keymaps).

## Abrir Neovim

Podés abrir Neovim con `Super + Shift + N` (el atajo abre tu editor predeterminado, que de entrada es Neovim), pero en general es más fácil usarlo desde la terminal: andá a la carpeta donde querés trabajar y escribí `n`. La `n` es un alias de `nvim` que, por defecto, abre la carpeta actual. Para abrir un solo archivo, usá `n myfile.txt`.

## Usar Neovim para editar con sudo

Si necesitás editar archivos que solo se pueden cambiar como superusuario, podés usar neovim con todos tus plugins ejecutando `sudoedit /etc/sudoers.d/00-sudo-only-file`.
