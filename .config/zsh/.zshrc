##### ZINIT

# install

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# starship
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# direnv
zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

# vim mode
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# OMZ
zinit ice wait lucid
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh

# other stuff
zinit ice wait lucid
zinit light joshskidmore/zsh-fzf-history-search

zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting

zinit light zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept

function zvm_after_init() {
  zvm_bindkey viins '^R' fzf_history_search
}


##### COMPINIT
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'left' vi-backward-char
#bindkey -M menuselect 'down' vi-down-line-or-history
#bindkey -M menuselect 'up' vi-up-line-or-history
#bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
#bindkey "^?" backward-delete-char


##### ENVS
export FZF_DEFAULT_OPTS='--bind "alt-j:down,alt-k:up" --layout=reverse'

HISTFILE=~/.config/zsh/zhistory
HISTSIZE=1000000
SAVEHIST=1000000

export XDG_CONFIG_HOME="$HOME/.config"
export HOST=$(hostname)
export PATH=~/.local/bin:~/go/bin:$PATH
export GOPATH=~/go
export K9SCONFIG=$XDG_CONFIG_HOME/k9s
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml

export EDITOR=vim
export TERMINAL=alacritty
export BROWSER=firefox

export QT_QPA_PLATFORMTHEME=qt6ct
export QT_STYLE_OVERRIDE=kvantum

# dbeaver fix for wayland
export NO_AT_BRIDGE=1 

# Man page color fix
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

#ls colors
export LS_COLORS="$(vivid generate catppuccin-frappe)"


##### ALIASES
# cd to current vscode dir
vspath=/tmp/vscodepath
if [ "$TERM_PROGRAM" = "vscode" ]; then echo $PWD > $vspath; fi
alias wd='if [ -f $vspath ]; then cd $(cat $vspath); else echo "file $vspath not found"; fi'

command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"
alias cr='code -r .'
alias ls='ls --group-directories-first --color=auto'
alias lsa='ls -a --group-directories-first'
alias lsl='ls -la --group-directories-first'
alias work='cd ~/work'
alias rndcommit='git add -A && \
  git commit -m "$(curl -s http://whatthecommit.com/index.txt)" && \
  git push'

alias mirror='sudo reflector --country Finland --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias cp='cp -i'
alias df='df -h'
alias free='free -m'

alias wttr='curl v2.wttr.in'
alias yeet='sudo'

alias dots='cd ~/Documents/dotfiles'


##### MISC
setopt auto_cd
