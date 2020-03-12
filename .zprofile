export XDG_CONFIG_HOME=/home/sgtxn/.config
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR=vim
export TERMINAL=st
export BROWSER=firefox
export ZDOTDIR="$HOME/.config/zsh"

export PATH=~/.local/bin:~/go/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=~/go

command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

alias \
	cfk="vim ~/.config/sxhkd/sxhkdrc" \
	cfb="vim ~/.config/bspwm/bspwmrc" \
	cfr="vim ~/.Xresources" \
	cfz="vim $ZDOTDIR/.zshrc" \
	cfp="vim ~/.config/polybar/config"

alias config="/usr/bin/git --git-dir=/home/sgtxn/.cfg/ --work-tree=/home/sgtxn"
alias tvclone='nvidia-settings --assign CurrentMetaMode="DP-0: 2560x1440_144+0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, HDMI-0:3840x2160_60 +0+0 {viewportin=2560x1440, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"'
alias tvextend='nvidia-settings --assign CurrentMetaMode="DP-0: 2560x1440_144+0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, HDMI-0:3840x2160_60 +2560+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"'
