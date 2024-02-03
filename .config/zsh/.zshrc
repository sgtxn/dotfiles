export FZF_DEFAULT_OPTS='--bind "alt-j:down,alt-k:up" --layout=reverse'

source /usr/share/zsh/share/antigen.zsh

# antigen use oh-my-zsh

#antigen bundle git
#antigen bundle azure

antigen bundle jeffreytse/zsh-vi-mode
antigen bundle fzf 
antigen bundle direnv
antigen bundle starship

antigen bundle zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

HISTFILE=~/.config/zsh/zhistory
HISTSIZE=1000000
SAVEHIST=1000000

# tab complete menu:
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char


source ~/.zprofile
#autoload -U +X bashcompinit && bashcompinit
#source /usr/share/bash-completion/completions/az
