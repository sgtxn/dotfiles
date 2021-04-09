local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local colors = require('themes.dracula.colors')
local gfs = require("gears.filesystem")

local theme = dofile(gfs.get_themes_dir() .."default/theme.lua")

theme.font          = "mononoki Nerd Font 10"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(2)

theme.bg_normal     = colors.background
theme.bg_focus      = colors.background
theme.bg_urgent     = colors.orange
theme.bg_minimize   = colors.selection
theme.bg_systray    = colors.background

theme.fg_normal     = colors.foreground
theme.fg_focus      = colors.foreground
theme.fg_urgent     = colors.foreground
theme.fg_minimize   = colors.foreground

theme.border_focus = colors.purple
theme.border_normal = colors.selection

theme.hotkeys_bg = colors.background
theme.hotkeys_fg = colors.foreground
theme.hotkeys_modifiers_fg = colors.purple
theme.hotkeys_border_color = colors.orange
theme.hotkeys_group_margin = 10

client.shape_clip = 4

return theme
