from typing import List 

import asyncio
import os
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile import qtile
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()
wmname = "LG3D"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Tab", lazy.group.next_window(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "space", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "shift"], "Return", lazy.spawn(terminal + " --class term_float"), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    # Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "Escape", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "mod1"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "mod1"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "f", lazy.window.toggle_floating(), desc='toggle floating'),
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen(), desc='toggle fullscreen'),
    Key([mod], "b", lazy.hide_show_bar(), desc="Hides the bar"),
    # KeyChord([mod], "s", [
    #     Key([], "space", lazy.spawn("sh -c 'xkb-switch -s us; rofi -modi drun -show drun -icon-theme \"Papirus\" -show-icons'")),
    #     Key([], "r", lazy.spawn("sh -c 'xkb-switch -s us; rofi -modi drun -show drun -icon-theme \"Papirus\" -show-icons'")),
    #     Key([], "c", lazy.spawn("code")),
    #     Key([], "i", lazy.spawn("insomnia")),
    #     Key([], "f", lazy.spawn("firefox")),
    #     Key([], "g", lazy.spawn("chromium")),
    #     Key([], "m", lazy.spawn("spotify")),
    #     Key([], "n", lazy.spawn("nemo")),
    # ]),
]

groups = [
    Group("1", matches=[Match(wm_class=["firefox"])]),
    Group("2", matches=[Match(wm_class=["Code"])]),
    Group("3", matches=[Match(wm_class=["TelegramDesktop", "Skype", "discord", "Slack"])]),
    Group("4",),
    Group("5"),
    Group("Q"),
    Group("W"),
    Group("E"),
    Group("R"),
    ]
# 1
keys.append(Key([mod], "1", lazy.group["1"].toscreen()))
keys.append(Key([mod, "shift"], "1", lazy.window.togroup("1")))
# 2
keys.append(Key([mod], "2", lazy.group["2"].toscreen()))
keys.append(Key([mod, "shift"], "2", lazy.window.togroup("2")))
# 3
keys.append(Key([mod], "3", lazy.group["3"].toscreen()))
keys.append(Key([mod, "shift"], "3", lazy.window.togroup("3")))
# 4
keys.append(Key([mod], "4", lazy.group["4"].toscreen()))
keys.append(Key([mod, "shift"], "4", lazy.window.togroup("4")))
# 5
keys.append(Key([mod], "5", lazy.group["5"].toscreen()))
keys.append(Key([mod, "shift"], "5", lazy.window.togroup("5")))
# 6
keys.append(Key([mod], "q", lazy.group["Q"].toscreen()))
keys.append(Key([mod, "shift"], "q", lazy.window.togroup("Q")))
# 7
keys.append(Key([mod], "w", lazy.group["W"].toscreen()))
keys.append(Key([mod, "shift"], "w", lazy.window.togroup("W")))
# 8
keys.append(Key([mod], "e", lazy.group["E"].toscreen()))
keys.append(Key([mod, "shift"], "e", lazy.window.togroup("E")))
# 9
keys.append(Key([mod], "r", lazy.group["R"].toscreen()))
keys.append(Key([mod, "shift"], "r", lazy.window.togroup("R")))

# for i, group in enumerate(groups, 1):
#     keys.append(Key([mod], str(i), lazy.group[group.name].toscreen()))
#     keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(group.name)))

widget_defaults = dict(
    font='mononoki Nerd Font',
    fontsize=18,
    padding=3,
)
extension_defaults = widget_defaults.copy()

colors = [
            ["#232634", "#232634"], # 0 background
            ["#44475a", "#44475a"], # 1 selection
            ["#c6d0f5", "#c6d0f5"], # 2 foreground 
            ["#737994", "#737994"], # 3 comment
            ["#81c8be", "#81c8be"], # 4 teal
            ["#a6d189", "#a6d189"], # 5 green
            ["#ef9f76", "#ef9f76"], # 6 orange
            ["#f4b8e4", "#f4b8e4"], # 7 pink
            ["#ca9ee6", "#ca9ee6"], # 8 purple
            ["#e78284", "#e78284"], # 9 red
            ["#e5c890", "#e5c890"], # 10 yellow
        ] 

layout_theme = {
    "border_width": 3,
    "margin": 0,
    "border_focus": colors[8][1],
    "border_normal": colors[1][1],
    "border_focus_stack": colors[7][1],
    "border_normal_stack": colors[1][1],
    "single_border_width": 0,
}

layouts = [
    layout.Columns(**layout_theme,insert_position=1),
    layout.Max(**layout_theme),
]
def parse_func(text): 
    replace_tuples = [
        (" - Visual Studio Code", "  "), 
        (" — Mozilla Firefox", "  "),
        (" - Chromium", "  "),
        ("Insomnia - ", " "),
    ]
    for tuple in replace_tuples:
        if tuple[0] in text:
            text = tuple[1] + text.strip().replace(tuple[0], "")
            return text

    add_tuples = [
        ("Telegram", "  "), 
        ("Alacritty", "  "),
        ("Discord", " "),
        ("Slack", "  "),
    ]
    for tuple in add_tuples:
        if tuple[0] in text:
            text = tuple[1] + text.strip()
            return text

    text = "  " + text.strip()
    return text

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active = colors[2],
                    background = colors[0],
                    borderwidth = 2,
                    disable_drag = True,
                    inactive = colors[1],
                    hide_unused = True,
                    highlight_color = colors[2],
                    highlight_method = "border",
                    this_current_screen_border = colors[8],
                    this_screen_border = colors [8],
                    other_current_screen_border = colors[8],
                    other_screen_border = colors[8],
                ),
                widget.TaskList(
                    background = colors[0],
                    border = colors[1],
                    borderwidth = 0,
                    highlight_method = 'block',
                    padding_x = 10,
                    parse_text = parse_func,
                    icon_size = 0,
                    max_title_width = 400,
                    rounded = True,
                    mouse_callbacks={
                        'Button2': lambda: qtile.widgets_map["tasklist"].clicked.kill(),
                        'Button3': lambda: qtile.current_window.cmd_toggle_maximize(),
                        'Button4': lambda: qtile.current_screen.cmd_prev_group(skip_empty=True),
                        'Button5': lambda: qtile.current_screen.cmd_next_group(skip_empty=True),
                        },
                    # txt_minimized = ' ',
                ),
                widget.Spacer(
                    background = colors[0],
                    mouse_callbacks={
                        'Button4': lambda: qtile.current_screen.cmd_prev_group(skip_empty=True),
                        'Button5': lambda: qtile.current_screen.cmd_next_group(skip_empty=True),
                        },
                    ),
                widget.GenPollText(
                    background = colors[0],
                    func = lambda: subprocess.check_output(["xkb-switch"]).decode("utf-8").rstrip().upper(),
                    update_interval = 0.1,
                    fontsize = 18,
                    padding = 6
                ),
                widget.Systray(
                    background = colors[0],
                    icon_size = 22,
                    padding = 6
                ),
                widget.Volume(
                    padding = 10,
                    fmt = ' {}',
                    background = colors[0],
                ),
                widget.Clock(
                    padding = 8,
                    format = '%a %H:%M',
                    background = colors[0],
                    mouse_callbacks={
                        'Button4': lambda: qtile.current_screen.cmd_prev_group(skip_empty=True),
                        'Button5': lambda: qtile.current_screen.cmd_next_group(skip_empty=True),
                    },
                ),

            ],
            28,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
    Click([mod], "Button4", lazy.screen.prev_group()),
    Click([mod], "Button5", lazy.screen.next_group()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='term_float'),  # alacritty floating
    Match(wm_class='Wine'),  # wine floating
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(title='MEGAsync'),  
],**layout_theme)
auto_fullscreen = True
focus_on_window_activation = "focus"

@hook.subscribe.setgroup
def focus_under_pointer():
    r = qtile.core.conn.conn.core.QueryPointer(qtile.core._root.wid).reply()
    win = qtile.windows_map.get(r.child, None)
    if win and win.group is qtile.current_group:
        win.group.focus(win, False)

@hook.subscribe.startup
def startup():
    qtile.cmd_hide_show_bar('all')

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/autostart.sh'])

@hook.subscribe.client_new
async def move_spotify(client):
    await asyncio.sleep(0.05)
    if client.name == 'Spotify':
        client.togroup("5")
    if client.floating == False:
        focus_under_pointer()
