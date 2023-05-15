local awful = require "awful"
local gfs = require "gears.filesystem"

local sh_path = gfs.get_xdg_config_home() .. "autostart.sh"

local function load_autostart()
   awful.spawn("bash " .. sh_path)
end

load_autostart()
