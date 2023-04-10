-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")

awesome.set_preferred_icon_size(36)

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/default/theme.lua")

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        -- awful.layout.suit.floating,
        awful.layout.suit.tile,
        -- awful.layout.suit.tile.left,
        -- awful.layout.suit.tile.bottom,
        -- awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        -- awful.layout.suit.fair.horizontal,
        -- awful.layout.suit.spiral,
        -- awful.layout.suit.spiral.dwindle,
        -- awful.layout.suit.max,
        -- awful.layout.suit.max.fullscreen,
        -- awful.layout.suit.magnifier,
        -- awful.layout.suit.corner.nw,
    })
end)
-- }}}

screen.connect_signal("arrange", function (s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
        if only_one and not c.floating or c.maximized then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width -- your border width
        end
    end
end)

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    gears.wallpaper.maximized(beautiful.wallpaper, s)
    -- awful.wallpaper {
    --     screen = s,
    --     widget = {
    --         {
    --             image     = beautiful.wallpaper,
    --             -- upscale   = true,
    --             -- downscale = true,
    --             widget    = wibox.widget.imagebox,
    --             horizontal_fit_policy = "fit",
    --             vertical_fit_policy   = "fit",
    --         },
    --         -- valign = "center",
    --         -- halign = "center",
    --         -- tiled  = false,
    --         -- widget = wibox.container.tile,
    --     }
    -- }
end)
-- }}}

-- {{{ Wibar

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

mytray = wibox.layout.margin(wibox.widget.systray(), 4, 4, 4, 4)
-- mytray:set_base_size(24)
beautiful.systray_icon_spacing = 5

screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "q", "w", "e", "r", "t" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

    local taglist_buttons = {
        awful.button({ }, 1, function(t) t:view_only() end),
        awful.button({ modkey }, 1, function(t)
                                        if client.focus then
                                            client.focus:move_to_tag(t)
                                        end
                                    end),
        awful.button({ }, 3, awful.tag.viewtoggle),
        awful.button({ modkey }, 3, function(t)
                                        if client.focus then
                                            client.focus:toggle_tag(t)
                                        end
                                    end),
        awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
        awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
    }
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
    }
    

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
        },
        layout = {
            spacing = 10,
            layout  = wibox.layout.flex.horizontal,
            max_widget_size = 500
        },
        widget_template = {
            {
                {
                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 5,
                        widget  = wibox.container.margin,
                    },
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left  = 5,
                right = 5,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
        },
    }

    -- Create the wibox
    s.mywibox = awful.wibar {
        height = 32,
        position = "top",
        screen   = s,
        widget   = {
            {
                layout = wibox.layout.align.horizontal,
                expand = "none",
                { -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    s.mytaglist,
                    s.mypromptbox,
                },
                s.mytasklist, -- Middle widget
                { -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    mykeyboardlayout,
                    mytray,
                    mytextclock,
                    s.mylayoutbox,
                },    
            },
            bottom = beautiful.xresources.apply_dpi(3),
            color = beautiful.bg_normal,
            widget = wibox.container.margin,
        },
    }
end)

-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)


-- do
--     local pending = false
--     local glib = require("lgi").GLib
--     tag.connect_signal("property::selected", function()
--         if not pending then
--             pending = true
--             glib.idle_add(glib.PRIORITY_DEFAULT_IDLE, function()
--                 pending = false
--                 local c = mouse.current_client
--                 print("focusing", c, mouse.object_under_pointer())
--                 if c then
--                     client.focus = c
--                 end
--                 return false
--             end)
--         end
--     end)
-- end

tag.connect_signal("property::selected", function (t)
    if t.selected then
        local mouseX = mouse.coords().x
        local mouseY = mouse.coords().y

        for k,v in pairs(t.screen.all_clients) do
            if v.first_tag.index==t.index and mouseX>=v.x and mouseX<=(v.x+v.width) and mouseY>=v.y and mouseY<=(v.y+v.height) and v.name ~= "Desktop" then
                client.focus = v
            end
        end
    end
end)

client.connect_signal("property::urgent", function(c)
    if c.class == "firefox" then
        awful.client.urgent.jumpto(false)
    end
end)
