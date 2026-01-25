fish_add_path $HOME/.local/bin

# Fish command history
function history
    builtin history --show-time='%F %T '
end

# Handy backup function
function backup --argument filename
    cp $filename $filename.bak
end

# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

zoxide init --cmd cd fish | source
starship init fish | source
