## Useful aliases
# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons=always'  # preferred listing
alias la='eza -a --color=always --group-directories-first --icons=always'   # all files and dirs
alias lt='eza -aT --color=always --group-directories-first --icons=always'  # tree listing
alias l.="eza -a | grep -e '^\.'"                                           # show only dotfiles

# Common
abbr --add cl clear
abbr --add .. 'cd ..'
abbr --add ... 'cd ../..'
abbr --add .... 'cd ../../..'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
