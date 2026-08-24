# preview.png is missing, on purpose

Omarchy shows `preview.png` in the theme picker. It has to be a real screenshot
of a machine running this theme — a mock-up passed off as a screenshot
misrepresents what the theme does.

`palette-check.png` in this directory **is** a mock-up. It renders this palette
into a simulated bar, terminal, menu and notification so the colour
relationships can be judged before anyone installs anything. Do not rename it
to `preview.png`.

To produce the real one:

1. Install and apply the theme on an Omarchy 4 machine.
2. Open two terminals side by side: one running
   `omarchy dev theme-preview <theme>` for the resolved ramp and the contrast
   figures, one running `btop -p 2`. btop reads the `btop.theme` Omarchy
   generates from this palette, so it shows the colours working — load meters,
   gradient fills, greens and reds and yellows at once — rather than swatched.
   Preset 2 is cpu+mem+net; it leaves out the process list, which would
   otherwise put real command lines and `$HOME` paths into a public image.
3. Summon the menu (`Super + Space`) and let a notification show.
4. Screenshot the full desktop, crop to 16:9, save as `preview.png`.
   The built-in themes are around 1800x1012.

`make-previews.sh` does all of this unattended, on an empty workspace, for
every theme in the set.

For the themes page at omarchy.org, convert that screenshot with:

```bash
magick preview.png -strip -resize '1200>' -quality 80 terminus.webp
```

then open a pull request against `omacom-io/omarchy-site` adding the webp to
`assets/themes/` and a `<figure>` block to `themes/index.html`, alphabetically.
