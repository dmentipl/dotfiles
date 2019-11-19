set -gx DOTFILES ~/repos/dotfiles

if type nvim > /dev/null ^/dev/null
    set -gx EDITOR nvim
else
    set -gx EDITOR vim
end

# Homebrew on Linux
if test (uname) != 'Darwin'
    set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
    set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
    set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
    set -g fish_user_paths \
        "/home/linuxbrew/.linuxbrew/bin" \
        "/home/linuxbrew/.linuxbrew/sbin" \
        $fish_user_paths
    set -q MANPATH; or set MANPATH ''; set -gx MANPATH \
        "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
    set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH \
        "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
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
