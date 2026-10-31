# Traer cambios de upstream y mantener es-AR al día

Este fork agrega `es-AR` (español rioplatense con voseo) sobre `basecamp/omarchy`. Upstream no conoce es-AR, así que nada lo actualiza solo: hay que traer los cambios a mano y traducir lo que quede pendiente. Seguí estos pasos cada vez que quieras actualizar el fork.

## Cómo está armado

- `origin` es el fork (`massisalva/omarchy`) y `upstream` es `basecamp/omarchy`. La rama principal es `quattro` en los dos.
- La máquina corre en el canal `dev` desde el checkout `~/Work/omarchy` (`OMARCHY_PATH` en `/etc/omarchy.conf`). `omarchy update` hace `git pull --ff-only` desde **`origin/quattro`**, no desde upstream: lo nuevo de upstream solo llega después de esta rutina.
- **Ese checkout es el escritorio en vivo.** Cambiar de rama, mergear o hacer pull ahí cambia los scripts, la shell y los menús en el momento, y sin correr las migraciones. Por eso todo este trabajo se hace en un worktree aparte (`~/Work/omarchy-sync`), y el checkout en vivo solo se actualiza con `omarchy update`, al final.
- El `quattro` del fork tiene commits propios (es-AR), así que traer upstream es un **merge**, nunca un fast-forward ni un rebase (el historial del fork ya está publicado).
- El workflow "Sync translations" está desactivado en el fork a propósito: no tiene la clave de traducción y solo haría ruido. "Check translation structure" sigue activo y valida cada PR.

## 1. Ver qué trae upstream

Desde `~/Work/omarchy`, sin cambiar de rama ni hacer pull (solo `fetch`, que no toca los archivos):

```bash
cd ~/Work/omarchy
git fetch origin && git fetch upstream
git log --oneline origin/quattro..upstream/quattro
git merge-tree --write-tree --name-only origin/quattro upstream/quattro   # vista previa: lista los archivos en conflicto, sin tocar nada
```

`git merge-tree` sale con 0 si el merge no tiene conflictos.

## 2. Mergear en un worktree

```bash
git worktree add -b sync/upstream-$(date +%F) ~/Work/omarchy-sync origin/quattro
cd ~/Work/omarchy-sync
git merge upstream/quattro
```

Los pasos 3 a 8 se hacen dentro de `~/Work/omarchy-sync`.

## 3. Resolver conflictos

El fork toca solo estos archivos de upstream. Si alguno entra en conflicto, se resuelve así:

| Archivo | Cómo resolver |
|---|---|
| `default/i18n/translation-manifest.json` | Tomar el de upstream y volver a ponerle la sección de es-AR (comando abajo). |
| `etc/sudoers.d/omarchy-locale-generate` | Tomar el de upstream y volver a sumar es-AR (comando abajo). |
| `default/i18n/locales.json` | Quedarse con los dos lados: la entrada `es-AR` va justo antes de `es-MX`. |
| `test/shell.d/i18n-test.sh` | Los dos conteos de idiomas (`codes.length` y las filas de `omarchy-language list`) son los de upstream más 1. |
| `default/i18n/plural.jq`, `shell/Commons/Plural.js` | `es-AR` va en la misma lista que `es-MX` (regla one / many / other). |
| `scripts/i18n-sync.py` | Conservar la línea `"es-AR"` de `REGIONAL_NOTES`. |
| `docs/i18n.md` | Conservar las frases del fork: el idioma 51 en los párrafos de arriba y la nota regional de es-AR. |

Manifest:

```bash
git show upstream/quattro:default/i18n/translation-manifest.json > /tmp/theirs.json
git show HEAD:default/i18n/translation-manifest.json > /tmp/ours.json   # HEAD = el fork antes del merge
jq --indent 2 -S --slurpfile ours /tmp/ours.json '. + {"es-AR": $ours[0]["es-AR"]}' /tmp/theirs.json > default/i18n/translation-manifest.json
```

Sudoers (cambiá `51` si upstream sumó o sacó idiomas: es la cantidad de entradas de `locales.json`):

```bash
git show upstream/quattro:etc/sudoers.d/omarchy-locale-generate > etc/sudoers.d/omarchy-locale-generate
sed -i -e 's|/usr/bin/omarchy-locale-generate es-MX|/usr/bin/omarchy-locale-generate es-AR, /usr/bin/omarchy-locale-generate es-MX|' \
  -e "s/Omarchy's [0-9]* languages/Omarchy's 51 languages/" etc/sudoers.d/omarchy-locale-generate
```

Después: `git add` de lo resuelto y `git commit` para cerrar el merge.

## 4. Ver qué quedó pendiente en es-AR

```bash
python3 scripts/i18n-sync.py pending | jq '.jobs["es-AR"]'
```

- `pending`: textos o capítulos del manual nuevos o cuyo inglés cambió.
- `prune`: textos que upstream borró y que todavía siguen en es-AR.

Si devuelve `null`, no hay nada que hacer: saltá al paso 7.

## 5. Traducir

**Con Muse** (si `muse` tiene sesión iniciada): traduce todo, limpia lo borrado y deja anotado qué terminó.

```bash
python3 scripts/i18n-sync.py translate --locale es-AR --done-file /tmp/done.json
```

**A mano**: primero guardá la lista de lo que vas a resolver, porque los textos borrados dejan de figurar en `pending` apenas los sacás:

```bash
python3 scripts/i18n-sync.py pending | jq '{"es-AR": (.jobs["es-AR"].pending + .jobs["es-AR"].prune)}' > /tmp/done.json
```

Después editá `default/i18n/es-AR/{menu,shell,cli,keybindings}.json` y los capítulos de `manual/es-AR/` que figuren en `pending`. Los textos que upstream borró se sacan con:

```bash
python3 - <<'EOF'
import importlib.util
from pathlib import Path
root = Path(".")
spec = importlib.util.spec_from_file_location("sync", root / "scripts/i18n-sync.py")
sync = importlib.util.module_from_spec(spec); spec.loader.exec_module(sync)
english = sync.english_units(root)
manifest = sync.read_json(sync.manifest_path(root), {})
pending, prune = sync.pending_for(root, "es-AR", english, manifest)
sync.apply_prune(root, "es-AR", prune)
print(f"{len(prune)} textos borrados; {len(pending)} pendientes")
EOF
```

Dos atajos para traducir a mano:

- **es-MX ya está traducido** por el workflow de upstream (`default/i18n/es-MX/`, `manual/es-MX/`). Sirve de borrador: pasalo a voseo y al vocabulario de abajo.
- **Muchos textos "nuevos" solo cambiaron de clave** (por ejemplo, cuando el menú Style pasó a Appearance). Si el inglés es idéntico al de una clave vieja de es-AR, reusá esa traducción; revisá igual el contexto, porque el mismo texto en inglés puede significar otra cosa (como "Windows": el sistema o las ventanas).
- **Las opciones de a pares** (`...-on` / `...-off`) son acciones: se muestra la que corresponde al estado actual y hace el cambio. Por ejemplo, "Con luz nocturna" aparece con la luz apagada y la prende.

Al traducir, respetá las convenciones de es-AR:

- **Voseo siempre** (`elegí`, `podés`, `tenés`, `apretá`): cualquier forma de tú es un error. Vocabulario rioplatense: `acá`, `notebook`, `parlantes`, `celular`, `pendrive`, `mouse`.
- **Un término por concepto:** plugin, web app, administrador (de archivos, del portapapeles), distribución, carpeta, Eliminar; Salvapantallas, Touchpad, Mantener activo. En el menú: Acciones, Configurar, Instalar, Eliminar, Actualizar.
- **Largo de las etiquetas del menú:** hasta 17 caracteres. Casi todos los menús miden 300 px y cortan con "…". Los submenús de grabar pantalla, de fuentes (_Apariencia > Fuente_) y de kernel (_Actualizar > Kernel_) miden 520 px y aceptan unos 40 (`cardWidth` en `shell/plugins/menu/Menu.qml`). El chequeo del paso 7 marca hoy 15 etiquetas que ya se pasaban antes, casi todas nombres de marcas; preocupate solo por las nuevas.
- **El manual** nombra los menús con las etiquetas exactas del catálogo es-AR.

## 6. Registrar lo traducido

Con el `/tmp/done.json` del paso 5 (lo escribe Muse, o lo guardaste vos antes de traducir a mano):

```bash
python3 scripts/i18n-sync.py manifest --locales es-AR --done-file /tmp/done.json
python3 scripts/i18n-sync.py pending | jq '.jobs["es-AR"]'   # tiene que dar null
```

## 7. Verificar

```bash
I18N_STRUCTURAL=1 bash test/shell.d/i18n-test.sh
bash test/shell.d/locale-sudoers-test.sh
bash test/shell.d/sudoers-test.sh
# Etiquetas del menú que no entran (las 15 que ya se pasaban antes no cuentan; fijate que no haya nuevas):
jq -r 'to_entries[] | select(.value.label) | .key as $k
  | (if ($k|test("^(trigger\\.capture\\.screenrecord|appearance\\.font|update\\.kernel)\\.[^.]+$")) then 40 else 17 end) as $max
  | select((.value.label|length) > $max) | "\(.value.label|length)/\($max)  \($k)  \(.value.label)"' default/i18n/es-AR/menu.json
```

El `i18n-test.sh` sin `I18N_STRUCTURAL=1` se corta en el primer idioma de upstream que tenga traducciones atrasadas y nunca llega a revisar es-AR.

Si hubo textos nuevos en la interfaz, revisalos en pantalla como pide [visual-verification.md](visual-verification.md): `omarchy-restart-shell`, abrí los menús y paneles afectados y fijate que nada quede cortado ni pisado. Si la shell aparece en inglés, `omarchy-restart-shell` lo arregla.

## 8. Publicar

```bash
git push -u origin sync/upstream-$(date +%F)
gh pr create --repo massisalva/omarchy --base quattro --title "Sync with upstream $(date +%F)"
```

Cuando pase "Check translation structure", mergeá el PR con merge commit (`gh pr merge --merge`) y borrá el worktree:

```bash
cd ~/Work/omarchy
git worktree remove ~/Work/omarchy-sync
git branch -d sync/upstream-$(date +%F)
```

## 9. Aplicar en el escritorio

Corré `omarchy update` en una terminal (pide la contraseña). Trae `origin/quattro` al checkout en vivo, actualiza los paquetes y corre las migraciones nuevas. No hagas `git pull` a mano en `~/Work/omarchy`: dejaría el código nuevo sin sus migraciones.

Antes, conviene leer las migraciones que van a correr (`git diff --name-only --diff-filter=A HEAD origin/quattro -- migrations/`), sobre todo las que usan `sudo` o tocan `/boot`.

Después: `omarchy-restart-shell` y revisá en pantalla los menús y paneles con textos nuevos.

### Si `omarchy update` se corta en una migración que espera un paquete

La máquina usa el repositorio de paquetes `stable` aunque el canal sea `dev`, así que el código del fork puede ir por delante de los paquetes. Algunas migraciones están hechas para esperar el paquete nuevo y, mientras esperan, cortan la actualización con un mensaje como "Waiting for the omarchy-settings package…". Como `omarchy-migrate` se detiene en la primera que falla, las siguientes tampoco corren.

1. Leé la migración (`migrations/<número>.sh`) y fijate qué espera y qué haría.
2. Si lo que haría no es imprescindible, marcala como hecha para destrabar las siguientes: `touch ~/.local/state/omarchy/migrations/<número>.sh`. Para deshacerlo, borrá ese archivo.
3. Anotá qué hay que hacer a mano cuando llegue el paquete y volvé a correr `omarchy update`.

Ejemplo (2026-10-25): `1792504295` esperaba un `omarchy-settings` que declarara los agentes nuevos. Se marcó como hecha, y cuando llegue el paquete hay que correr `mise reshim --system`.
