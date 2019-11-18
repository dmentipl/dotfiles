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

# Fix for Conda prompt
function fish_right_prompt
end

# Prompt
starship init fish | source

# iTerm2 integration
if test (uname) = 'Darwin'
    source ~/.iterm2_shell_integration.(basename $SHELL)
end

# Local config
if test -e ~/.config/fish/config-local.fish
    source ~/.config/fish/config-local.fish
end
