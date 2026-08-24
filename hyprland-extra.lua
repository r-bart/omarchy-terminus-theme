-- Window metrics for the Terminus theme. NOT a theme file.
--
-- Omarchy never reads a Hyprland config from a theme directory; the only thing
-- a theme sends the compositor is `hyprland_active_border` in colors.toml.
--
-- Omarchy 4 configures Hyprland in Lua, not in .conf syntax, and there is no
-- ~/.config/hypr/hyprland.conf. Paste the block below into
--   ~/.config/hypr/looknfeel.lua
-- which is loaded after both Omarchy's defaults and the active theme, so it
-- wins over both.

hl.config({
  decoration = {
    -- Omarchy already defaults to rounding = 0, gaps_in = 5, gaps_out = 10 and
    -- border_size = 2, so those are not repeated here. Rounding in particular
    -- is a personal, machine-level choice and no business of a theme's; set it
    -- to whatever you like. Two things to know if you do: the shell mirrors
    -- `rounding` into its own card corners via `hyprctl getoption`, so it also
    -- reshapes the menu, launcher, notifications and tooltips — and it only
    -- re-reads the value on startup, on a theme change, and on the
    -- `omarchy toggle window-gaps` flag. Edit this file and `hyprctl reload`
    -- and the windows round while the shell keeps the old radius; re-apply
    -- your theme (or `omarchy restart shell`) to bring it along.
    rounding_power = 4,

    -- The 0.05 gap is what marks the focused window.
    active_opacity = 0.90,
    inactive_opacity = 0.85,

    -- Translucency without blur makes text unreadable over these wallpapers.
    blur = {
      enabled = true,
      size = 6,
      passes = 2,
    },

    shadow = {
      enabled = true,
      range = 20,
      render_power = 4,
      color = "rgba(0c162699)",
      color_inactive = "rgba(0c162666)",
    },
  },
})

-- Terminal transparency is separate: Hyprland's active_opacity applies to the
-- window surface, while Alacritty and Ghostty have their own background
-- opacity. Below roughly 0.85, code over these wallpapers stops being
-- comfortable. A theme could ship a terminal config — Omarchy renders
-- alacritty.toml, ghostty.conf, kitty.conf and foot.ini from templates only
-- when the theme has not supplied them — but this one deliberately does not,
-- so opacity has to be set by hand too.
