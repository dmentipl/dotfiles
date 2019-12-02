set -gx DOTFILES ~/repos/dotfiles

# Homebrew on Linux
if test (uname) != 'Darwin'
    set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
    set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
    set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
    if not contains "/home/linuxbrew/.linuxbrew/bin" $PATH
        set -gx PATH \
            "/home/linuxbrew/.linuxbrew/bin" \
            "/home/linuxbrew/.linuxbrew/sbin" \
            $PATH
    end
    set -q MANPATH; or set MANPATH ''; set -gx MANPATH \
        "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
    set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH \
        "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
end

# Editor
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
function fish_right_prompt; end

# Prompt
starship init fish | source

# iTerm2 integration
if test (uname) = 'Darwin'
    source ~/.iterm2_shell_integration.(basename $SHELL)
end

# Temporary fix for macOS Catalina slow tab completion
# See https://github.com/fish-shell/fish-shell/issues/6270
if test (uname) = 'Darwin'
    function __fish_describe_command; end
end

# Local config
if test -e ~/.config/fish/config-local.fish
    source ~/.config/fish/config-local.fish
end
