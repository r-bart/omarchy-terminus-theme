# preview.png

`preview.png` is what Omarchy shows in the theme picker, and what the gallery at
omarchy.org uses. It is a real screenshot of a machine running this theme, at
1800x1012 — the size the built-in themes use.

It is not a mock-up. `palette-check.png` in this directory is: it renders the
palette into a simulated bar, terminal, menu and notification so the colour
relationships can be judged before installing anything. Do not swap one for the
other.

## Regenerating it

`make-previews.sh` does it unattended, for every theme in the set, on an empty
workspace. Per theme it applies the theme, pins the background to that theme's
own `1-*` default, opens two floating terminals — one showing
`omarchy dev theme-preview <theme>`, one running `btop -p 2` — fires the
notification, summons the menu, grabs the focused monitor and crops to 16:9.

Three things in there are worth knowing if you write your own:

- **`btop -p 2`, not the default.** Preset 2 is cpu+mem+net. It keeps the colour
  density, which is the point of including btop at all — it reads the
  `btop.theme` Omarchy generates from this palette — while leaving out the
  process list, which would put real command lines and `$HOME` paths into a
  public image.
- **The background has to be pinned.** `omarchy-theme-set` does not simply take
  the first entry; `choose_theme_background` cycles from whatever was showing.
  Since every theme in this set ships the same five files under different
  numbers, switching between them lands on the second or third. A preview has to
  show what a fresh install shows.
- **`hyprctl dispatch` takes Lua.** On Hyprland 0.56, `hyprctl dispatch workspace 3`
  becomes `hl.dispatch(workspace 3)`, which is not valid Lua, and exits 7. It is
  `hl.dsp.focus({ workspace = "3" })` now.

## For the omarchy.org gallery

```bash
magick preview.png -strip -resize '1200>' -quality 80 terminus.webp
```

WebP is right for the site — a browser decodes it, unlike Omarchy's Qt-based
shell, which is why the backgrounds in this repository are JPEG. Open a pull
request against `omacom/omarchy-site` adding the webp to `assets/themes/` and
a `<figure>` block to `themes/index.html`, alphabetically. The webp does not
belong in this repository; `.gitignore` already keeps it out.
