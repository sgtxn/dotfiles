local awful = require "awful"
local hotkeys_popup = require "awful.hotkeys_popup"

-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "z",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey, "Control", "Mod1" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Control", "Mod1" }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey }, "y",     function () 
        local tags = awful.screen.focused().selected_tags
        for k, tag in pairs(tags) do
            for kc, c in pairs(tag:clients()) do
                if c.floating == true and c.first_tag.index == tag.index then
                    c:lower()
                end
            end
        end
    end,
              {description = "yeet bg windows", group = "launcher"}),
    awful.key({ modkey, "Shift" }, "y",     function () 
        local tags = awful.screen.focused().selected_tags
        for k, tag in pairs(tags) do
            for kc, c in pairs(tag:clients()) do
                if c.floating == true and c.first_tag.index == tag.index then
                    c:raise()
                end
            end
        end
    end,
              {description = "unyeet bg windows", group = "launcher"}),
    awful.key({ modkey }, "b",     function () 
        local myscreen = awful.screen.focused()
        myscreen.mywibox.visible = not myscreen.mywibox.visible
    end,
              {description = "toggle bar", group = "launcher"}),
    -- awful.key({ modkey }, "p", function() menubar.show() end,
    --           {description = "show the menubar", group = "launcher"}),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:activate { raise = true, context = "key.unminimize" }
                  end
              end,
              {description = "restore minimized", group = "client"}),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "BackSpace", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "BackSpace", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
})

local np_map = { "1", "2", "3", "4", "5", "q", "w", "e", "r", "t" }
for idx, button in ipairs(np_map) do
    awful.keyboard.append_global_keybindings(
        {
            awful.key( { modkey }, button, function ()
                local tag = awful.tag.find_by_name(awful.screen, button)
                if tag then
                    tag:view_only()
                end
            end
            ),
            awful.key( { modkey, "Control" }, button, function ()
                local tag = awful.tag.find_by_name(awful.screen, button)
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end
            ),
            awful.key( { modkey, "Shift" }, button, function ()
                if client.focus then
                    local tag = awful.tag.find_by_name(awful.screen, button)
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end
            ),
            awful.key( { modkey, "Control", "Shift" }, button, function ()
                if client.focus then
                    local tag = awful.tag.find_by_name(awful.screen, button)
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end
            ),
        }
    )
end


-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
})
-- }}}

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key({ modkey }, "Escape",      function (c) c:kill()                         end,
                {description = "close", group = "client"}),
        awful.key({ modkey }, "s",  
            function (c) 
                c.floating = not c.floating
                awful.placement.centered(c)
                awful.placement.no_overlap(c)
            end,
                {description = "toggle floating", group = "client"}),
        awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
                {description = "move to master", group = "client"}),
        awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
                {description = "move to screen", group = "client"}),
        awful.key({ modkey,           }, "i",      function (c) c.ontop = not c.ontop            end,
                {description = "toggle keep on top", group = "client"}),
        awful.key({ modkey,           }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end ,
            {description = "minimize", group = "client"}),
        awful.key({ modkey,           }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "(un)maximize", group = "client"}),
        awful.key({ modkey, "Control" }, "m",
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = "(un)maximize vertically", group = "client"}),
        awful.key({ modkey, "Shift"   }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "client"}),
    })
end)

-- keychords говно, с русской раскладкой через жопу работает
-- awful.keygrabber {
--     timeout            = 1,
--     stop_key           = 'Escape',
--     stop_event         = 'press',
--     keybindings = {
--         { {}, ' ', function ()
--             awful.spawn.with_shell('xkb-switch -s us; rofi -show drun')
--             awful.keygrabber.stop()
--         end },
--         { {}, 't', function ()
--             awful.spawn.with_shell('pidof telegram-desktop > /dev/null && killall telegram-desktop || telegram-desktop')
--             awful.keygrabber.stop()
--         end },
--         { {}, 's', function ()
--             awful.spawn.with_shell('pidof teams > /dev/null && killall teams || teams')
--             awful.keygrabber.stop()
--         end },
--         { {}, '1', function ()
--             awful.spawn.with_shell("notify-send \"$(date '+%d %B %Y, %H:%M:%S %:z')\" \"$(acpi | grep -v 'rate information unavailable')\" --app-name=\"sysinfo\"")
--             awful.keygrabber.stop()
--         end },
--         { {}, 'c', function ()
--             awful.spawn('code')
--             awful.keygrabber.stop()
--         end },
--         { {}, 'i', function ()
--             awful.spawn('insomnia')
--             awful.keygrabber.stop()
--         end },
--         { {}, 'f', function ()
--             awful.spawn('firefox')
--             awful.keygrabber.stop()
--         end },
--         { {}, 'g', function ()
--             awful.spawn('chromium')
--             awful.keygrabber.stop()
--         end },
--         { {}, 'm', function ()
--             awful.spawn('spotify')
--             awful.keygrabber.stop()
--         end },
--         { {}, 'n', function ()
--             awful.spawn('nemo')
--             awful.keygrabber.stop()
--         end },
--         { {}, 'b', function ()
--             awful.spawn('blueman-manager')
--             awful.keygrabber.stop()
--         end },
--     },
--     root_keybindings = {
--         { { modkey, }, "space", function(self) end },
--     },
--     -- start_callback     = awful.client.focus.history.disable_tracking,
--     -- stop_callback      = awful.client.focus.history.enable_tracking,
--     -- export_keybindings = true,
--     -- allowed_keys   = { ' ' },
--     -- keypressed_callback  = function(_, modifiers, key)
--     --     awful.spawn.with_shell('notify-send key: '..key)
--     -- end,
-- }
