set -gx DOTFILES ~/repos/dotfiles

if type nvim > /dev/null ^/dev/null
    set -gx EDITOR nvim
else
    set -gx EDITOR vim
end

# Abbreviations
source ~/.config/fish/abbr.fish

# Conda
eval ~/conda/bin/conda "shell.fish" "hook" $argv | source

# Prompt
starship init fish | source

# iTerm2 integration
source ~/.iterm2_shell_integration.(basename $SHELL)
