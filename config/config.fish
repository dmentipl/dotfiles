# User binaries
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/bin $PATH

# Editor
command -v nvim > /dev/null && set -gx EDITOR nvim || set -gx EDITOR vim

# Conda
test -e ~/conda/bin/conda && eval ~/conda/bin/conda "shell.fish" "hook" $argv | source
function fish_right_prompt; end

# Prompt
command -v starship > /dev/null && starship init fish | source

# Abbreviations
test -e ~/.config/fish/abbr.fish && source ~/.config/fish/abbr.fish

# Key bindings
bind \eg accept-autosuggestion

# iTerm2 integration
test (uname) = 'Darwin' && \
  test -e ~/.iterm2_shell_integration.fish && \
  source ~/.iterm2_shell_integration.fish

# Local config
test -e ~/.config/fish/local.fish && source ~/.config/fish/local.fish
