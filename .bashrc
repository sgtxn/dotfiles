#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1="[\[$(tput sgr0)\]\[\033[38;5;221m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;114m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;110m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]\[\033[38;5;253m\]\\$ \[$(tput sgr0)\]"
alias config='/usr/bin/git --git-dir=/home/sgtxn/.cfg/ --work-tree=/home/sgtxn'
alias tvclone='nvidia-settings --assign CurrentMetaMode="DP-0: 2560x1440_144 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, HDMI-0: 3840x2160_60 +0+0 {viewportin=2560x1440, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"'
alias tvextend='nvidia-settings --assign CurrentMetaMode="DP-0: 2560x1440_144 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, HDMI-0: 3840x2160_60 +2560+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"'
