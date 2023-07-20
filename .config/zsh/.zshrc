export FZF_DEFAULT_OPTS='--bind "alt-j:down,alt-k:up" --layout=reverse'

source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
#antigen bundle azure
#antigen bundle vi-mode
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
#WORDCHARS=${WORDCHARS//\/[&.;]}                                 

bindkey -e
bindkey '^[[7~' beginning-of-line                               
bindkey '^[[H' beginning-of-line                               
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line              
fi
bindkey '^[[8~' end-of-line                                  
bindkey '^[[F' end-of-line                                  
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                  
fi
bindkey '^[[2~' overwrite-mode                            
bindkey '^[[3~' delete-char                              
bindkey '^[[C'  forward-char                            
bindkey '^[[D'  backward-char                          
bindkey '^[[5~' history-beginning-search-backward     
bindkey '^[[6~' history-beginning-search-forward     

# Vim mode
autoload -z edit-command-line
zle -N edit-command-line
bindkey -v
bindkey "^V" edit-command-line
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
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


source ~/.zprofile
#autoload -U +X compinit && compinit
#autoload -U +X bashcompinit && bashcompinit
#source /usr/share/bash-completion/completions/az
