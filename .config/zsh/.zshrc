# Theming section  
autoload -U compinit colors zcalc
compinit -d
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

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"        
zstyle ':completion:*' rehash true                              
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
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
source /home/sgtxn/.config/broot/launcher/bash/br
eval "$(direnv hook zsh)"


# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
