source /usr/share/nvm/init-nvm.sh

# Aliases
[[ -f "$HOME/.config/zsh/aliases.zsh" ]] && source "$HOME/.config/zsh/aliases.zsh"

# Custom
[[ -f "$HOME/.config/zsh/custom.zsh" ]] && source "$HOME/.config/zsh/custom.zsh" 

# Load device-specific shell config
if [[ -f "$HOME/.zsh_device" ]]; then
    source "$HOME/.zsh_device"
fi

# Below are config that I kept from cachyos defaults
# ---------------------------------------------------

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# TODO: add more plugins that I use
[[ -z "${plugins[*]}" ]] && plugins=(git fzf extract)

source $ZSH/oh-my-zsh.sh

# Ignore commands that start with spaces and duplicates.
export HISTCONTROL=ignoreboth

# Don't add certain commands to the history file.
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

# Use custom `less` colors for `man` pages.
export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Cleanup orphaned packages
alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Fish-like syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# pkgfile "command not found" handler
source /usr/share/doc/pkgfile/command-not-found.zsh

export FZF_BASE=/usr/share/fzf
