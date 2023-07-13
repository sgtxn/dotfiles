---------------------------
-- Aaayyeeeeoooo --
---------------------------
local gears               = require("gears")

local theme_assets        = require("beautiful.theme_assets")
local xresources          = require("beautiful.xresources")
local dpi                 = xresources.apply_dpi

local gfs                 = require("gears.filesystem")
local themes_path         = gfs.get_configuration_dir() .. "themes/"

local theme               = {}

theme.font                = "mononoki 12"

local blue                = "#8caaee"
local flamingo            = "#eebebe"
local lavender            = "#babbf1"
local teal                = "#81c8be"
local mauve               = "#ca9ee6"
local peach               = "#ef9f76"

local black_0             = "#232634"
local black_3             = "#303446"
local black_5             = "#51576d"
local text                = "#c6d0f5"

theme.bg_normal           = black_0
theme.bg_focus            = black_3
theme.bg_urgent           = flamingo
theme.bg_minimize         = teal
theme.bg_systray          = black_0

theme.fg_normal           = text
theme.fg_focus            = text
theme.fg_urgent           = black_0
theme.fg_minimize         = black_0

theme.useless_gap         = dpi(0)
theme.border_width        = dpi(3)
theme.border_normal       = black_5
theme.border_focus        = mauve
theme.border_marked       = blue

theme.taglist_fg_focus    = black_0
theme.taglist_bg_focus    = blue
theme.taglist_bg_occupied = black_3
theme.taglist_spacing     = 5
theme.taglist_shape       = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, 3)
end

theme.tasklist_bg_normal  = black_3
-- theme.tasklist_fg_focus = black_0
theme.tasklist_bg_focus   = black_5
theme.tasklist_spacing    = 10
theme.tasklist_shape      = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, 3)
end

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon   = themes_path .. "default/submenu.png"
theme.menu_height         = dpi(15)
theme.menu_width          = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local wp_home_path    = gfs.get_xdg_config_home() .. "../Pictures/wallpaper.jpg"
local wp_default_path = themes_path .. "default/wallpaper.jpg"

theme.wallpaper       = file_exists(wp_home_path) and wp_home_path or wp_default_path

-- Generate Awesome icon:
theme.awesome_icon    = theme_assets.awesome_icon(
	theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme      = "Papirus-Dark"

return theme
