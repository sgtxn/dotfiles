# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

import os
import socket
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile import qtile
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

def clipmenu_spawn(qtile):
    os.system("CM_LAUNCHER=rofi clipmenu")

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.group.next_window(),
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
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "Escape", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "mod1"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "mod1"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "z", lazy.spawn("rofi -modi drun -show drun -width 30"), desc="Launch rofi"),
    Key([mod], "f", lazy.window.toggle_floating(), desc='toggle floating'),
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen(), desc='toggle fullscreen'),
    
    Key([mod], "F9", 
        lazy.spawn("pactl set-default-sink bluez_output.04_FE_A1_C7_2B_07.a2dp-sink"), 
        desc='switch to speakers'),
    Key([mod, "shift"], "F9", 
        lazy.spawn("pactl set-default-sink alsa_output.pci-0000_28_00.4.analog-stereo"), 
        desc='switch to headphones'),
    Key(["mod1", "shift"], "F9", 
        lazy.spawn("rofi -show bt -modi bt:~/.config/rofi/bluetooth.sh -width 35 -lines 5")),
    Key([mod], "x", lazy.spawn("slock")),
    Key([], "Print", lazy.spawn("flameshot gui")),
    Key(["mod1", "shift"], "p", 
        lazy.spawn("rofi -show power -modi power:~/.config/rofi/power-menu.sh -width 10 -lines 5")),
    Key(["mod1", "shift"], "c", lazy.function(clipmenu_spawn)),
]

groups = [
    Group("1", matches=[Match(wm_class=["firefox"])]),
    Group("2", matches=[Match(wm_class=["TelegramDesktop", "Skype", "discord"])]),
    Group("3", matches=[Match(wm_class=["TelegramDesktop", "Skype", "discord"])]),
    Group("4", matches=[Match(wm_class=["Lutris", "Steam"])]),
    Group("Q", matches=[Match(wm_class=[""])]),
    Group("W", matches=[Match(wm_class=["Lutris", "Steam"])]),
    Group("E", matches=[Match(wm_class=["Insomnia"])]),
    Group("R"),
    Group("9"),
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
keys.append(Key([mod], "q", lazy.group["Q"].toscreen()))
keys.append(Key([mod, "shift"], "q", lazy.window.togroup("Q")))
# 6
keys.append(Key([mod], "w", lazy.group["W"].toscreen()))
keys.append(Key([mod, "shift"], "w", lazy.window.togroup("W")))
# 7
keys.append(Key([mod], "e", lazy.group["E"].toscreen()))
keys.append(Key([mod, "shift"], "e", lazy.window.togroup("E")))
# 8
keys.append(Key([mod], "r", lazy.group["R"].toscreen()))
keys.append(Key([mod, "shift"], "r", lazy.window.togroup("R")))
# 9
keys.append(Key([mod], "5", lazy.group["9"].toscreen()))
keys.append(Key([mod, "shift"], "5", lazy.window.togroup("9")))

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
            ["#282a36", "#282a36"], # 0 background
            ["#44475a", "#44475a"], # 1 selection
            ["#f8f8f2", "#f8f8f2"], # 2 foreground 
            ["#6272a4", "#6272a4"], # 3 comment
            ["#8be9fd", "#8be9fd"], # 4 cyan
            ["#50fa7b", "#50fa7b"], # 5 green
            ["#ffb86c", "#ffb86c"], # 6 orange
            ["#ff79c6", "#ff79c6"], # 7 pink
            ["#bd93f9", "#bd93f9"], # 8 purple
            ["#ff5555", "#ff5555"], # 9 red
            ["#f1fa8c", "#f1fa8c"], # 10 yellow
        ] 

layout_theme = {
    "border_width": 3,
    "margin": 0,
    "border_focus": colors[8][1],
    "border_normal": colors[1][1],
    "single_border_width": 0,
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Columns(**layout_theme),
    layout.Floating(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(**layout_theme, num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    layout.Max(**layout_theme),
]
def parse_func(text): 
    replace_tuples = [
        (" - Visual Studio Code", "  "), 
        (" — Mozilla Firefox", "  "),
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
    return text

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Clock(
                    padding = 8,
                    format = '%a %H:%M',
                    background = colors[0],
                    mouse_callbacks={
                        'Button4': lambda: qtile.current_screen.cmd_prev_group(skip_empty=True),
                        'Button5': lambda: qtile.current_screen.cmd_next_group(skip_empty=True),
                        },
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
                        'Button4': lambda: qtile.current_screen.cmd_prev_group(skip_empty=True),
                        'Button5': lambda: qtile.current_screen.cmd_next_group(skip_empty=True),
                        },
                ),
                widget.Prompt(
                    background = colors[0]
                ),
                widget.Spacer(
                    background = colors[0],
                    mouse_callbacks={
                        'Button4': lambda: qtile.current_screen.cmd_prev_group(skip_empty=True),
                        'Button5': lambda: qtile.current_screen.cmd_next_group(skip_empty=True),
                        },
                    ),
                widget.GroupBox(
                    active = colors[2],
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
                    background = colors[0]
                ),
                widget.Spacer(
                    background = colors[0],
                    mouse_callbacks={
                        'Button4': lambda: qtile.current_screen.cmd_prev_group(skip_empty=True),
                        'Button5': lambda: qtile.current_screen.cmd_next_group(skip_empty=True),
                        },
                    ),
                widget.Spacer(
                    background = colors[0],
                    mouse_callbacks={
                        'Button4': lambda: qtile.current_screen.cmd_prev_group(skip_empty=True),
                        'Button5': lambda: qtile.current_screen.cmd_next_group(skip_empty=True),
                        },
                    ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                    background=colors[0]
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
                # widget.CurrentLayout(
                #     padding = 8,
                #     foreground = colors[2],
                #     background = colors[0]
                # ),
                widget.CurrentLayoutIcon(
                    padding = 4,
                    foreground = colors[2],
                    background = colors[0],
                    scale = 0.8,
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

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
