source ~/.privateprofile

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HOST=$(hostname)
export PATH=~/.local/bin:~/go/bin:$PATH
export GOPATH=~/go
export K9SCONFIG=$XDG_CONFIG_HOME/k9s
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml

export EDITOR=vim
export TERMINAL=alacritty
export BROWSER=firefox

export QT_QPA_PLATFORMTHEME=qt6ct

export NO_AT_BRIDGE=1 # dbeaver fix for wayland

# Man page color fix
export LESS_TERMCAP_so=$(tput bold; tput setaf 0; tput setab 4)

# cd to current vscode dir
vspath=/tmp/vscodepath
if [ -n "$VSCODE_GIT_ASKPASS_NODE" ]; then echo $PWD > $vspath; fi
alias wd='if [ -f $vspath ]; then cd $(cat $vspath); else echo "file $vspath not found"; fi'

# Aliases
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"
alias cr='code -r .'
alias ls='ls --group-directories-first'
alias lsa='ls -a --group-directories-first'
alias uuid='uuidgen | xclip -sel clip'
alias work='cd ~/work'
alias rndcommit='git add -A && \
  git commit -m "$(curl -s http://whatthecommit.com/index.txt)" && \
  git push'

alias mirror='sudo reflector --country Finland --country Sweden --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias cp='cp -i'
alias df='df -h'
alias free='free -m'

alias wttr='curl v2.wttr.in'
alias yeet='sudo'

alias dots='cd ~/Documents/dotfiles'

# startx
#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#  exec startx -- vt1 -keeptty &>/dev/null
#  logout
#fi
