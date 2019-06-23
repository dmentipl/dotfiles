# ============================================================================ #

# Fix for tmux path
if [[ -n "$TMUX" ]]; then
  if [[ "$OSTYPE" == darwin* ]]; then
    PATH=''
  else
    . /etc/environment
  fi
fi

# ==== source files for non-interactive shells ==== #

files=(~/.zshenv.d/*)
for file in "${files[@]}"; do
  [[ -f $file && -r $file ]] && source $file
done
unset file files

# ============================================================================ #
