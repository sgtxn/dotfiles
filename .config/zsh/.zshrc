export FZF_DEFAULT_OPTS='--bind "alt-j:down,alt-k:up" --layout=reverse'

source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle azure
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

# CTRL-R - fzf command history
#__fzfcmd() {
#    echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
#}
#export FZF_DEFAULT_OPTS="--layout=reverse --height 40% --bind alt-j:down,alt-k:up"
#fzf-history-widget() {
#  local selected num
#  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
#  selected=( $(fc -rl 1 |
#    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
#  local ret=$?
#  if [ -n "$selected" ]; then
#    num=$selected[1]
#    if [ -n "$num" ]; then
#      zle vi-fetch-history -n $num
#    fi
#  fi
#  zle reset-prompt
#  return $ret
#}
#zle     -N   fzf-history-widget
#bindkey '^R' fzf-history-widget

source ~/.zprofile
