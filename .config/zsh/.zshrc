# Theming section  
autoload -U compinit colors zcalc
colors

PS1="%B%{$fg[magenta]%}[%{$fg[yellow]%}%1~%{$fg[magenta]%}] "

## Options section
setopt correct                                                 
setopt extendedglob                                           
setopt nocaseglob                                              
setopt rcexpandparam                                           
setopt nocheckjobs                                             
setopt numericglobsort                                         
setopt nobeep                                                  
setopt appendhistory                                           
setopt histignorealldups                                       
setopt autocd                                                   
setopt complete_aliases

compinit -d
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"        
zstyle ':completion:*' rehash true                              
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
# Include hidden files.
_comp_options+=(globdots)		

HISTFILE=~/.config/zsh/zhistory
HISTSIZE=1000000
SAVEHIST=1000000
WORDCHARS=${WORDCHARS//\/[&.;]}                                 

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

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

source ~/.zprofile
source ~/.config/aliasrc
source ~/.profile
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sgtxn/google-cloud-sdk/path.zsh.inc' ]; then . '/home/sgtxn/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sgtxn/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/sgtxn/google-cloud-sdk/completion.zsh.inc'; fi
