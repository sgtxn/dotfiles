source ~/.privateprofile

export XDG_CONFIG_HOME=/home/sgt/.config
export ZDOTDIR="$HOME/.config/zsh"
export HOST=$(hostname)
export PATH=~/.local/bin:~/go/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=~/go
export K9SCONFIG=/home/sgt/.config/k9s
export STARSHIP_CONFIG=/home/sgt/.config/starship/starship.toml

export EDITOR=vim
export TERMINAL=alacritty
export BROWSER=firefox

# Man page color fix
export LESS_TERMCAP_so=$(tput bold; tput setaf 0; tput setab 4)


# Aliases
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"
alias cr='code -r .'
alias ls='exa --group-directories-first'
alias lsa='exa -a --group-directories-first'
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
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx -- vt1 -keeptty &>/dev/null
  logout
fi
