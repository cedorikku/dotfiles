# ENV
TERM=xterm-256color
ZSH_THEME="edvardm"

# personal
alias tpr="sudo modprobe -r psmouse && sudo modprobe psmouse"

# common
alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'
alias sleep='pmset sleepnow'
alias c="clear"

alias ls-'eza'

source /usr/share/cachyos-zsh-config/cachyos-config.zsh
source /usr/share/nvm/init-nvm.sh

eval "$(oh-my-posh init zsh --config ~/tokyonight_storm.omp.json)"
