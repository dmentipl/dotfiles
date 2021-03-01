#!/usr/bin/env bash
#
# Configure dotfiles.

[[ "$(dirname $0)" == '.' ]] || \
  { printf 'Must run script in directory... Exiting!\n'; exit 1; }

bool_bash=false
bool_fish=false
bool_zsh=false
bool_git=false
bool_starship=false
bool_code=false
bool_vim=false
bool_neovim=false
bool_tmux=false

log_file=.configure.log

red_color="\033[1;31m"
green_color="\033[1;32m"
no_color="\033[0m"

is_macos () {
  [[ "$(uname)" == 'Darwin' ]]
}

tick () {
  printf "${green_color}\xE2\x9C\x94${no_color}\n"
}

cross () {
  printf "${red_color}\xE2\x9C\x97${no_color}\n"
}

logging () {
  [[ -f $log_file ]] && rm $log_file
}

_cp () {
  # copy and backup existing destination
  # $1 is file from repository
  # $2 is the actual dotfile
  printf "cp $1 to $2\n"
  [[ -f "$2" ]] && mv "$2" "$2.bak" && cp "$1" "$2" && return
  cp "$1" "$2"
}

_mkdir () {
  printf "mkdir $*\n"
  mkdir -p "$@"
}

configure_bash () {
  _cp config/bashrc ~/.bashrc && _cp config/aliases ~/.aliases
}

configure_fish () {
  _mkdir ~/.config/fish \
    && _cp config/config.fish ~/.config/fish/config.fish \
    && _cp config/abbr.fish ~/.config/fish/abbr.fish
}

configure_zsh () {
  _cp config/zshrc ~/.zshrc
}

configure_git () {
  rm gitconfig.tmp > /dev/null 2>&1
  success=true
  if [[ -z "$EMAIL" ]]; then
    printf 'Must set EMAIL gitconfig.\n'
    success=false
  else
    printf "EMAIL=$EMAIL\n"
    cat config/gitconfig | envsubst > gitconfig.tmp
    _cp gitconfig.tmp ~/.gitconfig
    rm gitconfig.tmp > /dev/null 2>&1
  fi
  _cp config/gitignore ~/.gitignore
  $success || return 1
}

configure_starship () {
  _cp config/starship.toml ~/.config/starship.toml
}

configure_code () {
  is_macos \
    && _cp config/settings.json ~/Library/Application\ Support/Code/User/settings.json
}

configure_vim () {
  _mkdir ~/.vim/{swp,undo} \
    && _cp config/vimrc ~/.vimrc \
    && vim +PlugInstall +qall
}

configure_neovim () {
  _mkdir ~/.config/nvim \
    && _cp config/vimrc ~/.config/nvim/init.vim \
    && nvim +PlugInstall +qall
}

configure_tmux () {
  _cp config/tmux.conf ~/.tmux.conf
}

configure () {
  printf '========== Configuring ==========\n\n'
  {
  configure_bash && bool_bash=true;
  configure_fish && bool_fish=true;
  configure_zsh && bool_zsh=true;
  configure_git && bool_git=true;
  configure_starship && bool_starship=true;
  configure_code && bool_code=true;
  configure_vim && bool_vim=true;
  configure_neovim && bool_neovim=true;
  configure_tmux && bool_tmux=true;
  } >> $log_file 2>&1
}

summary () {
  printf 'Configured bash.......... '; $bool_bash && tick || cross
  printf 'Configured fish.......... '; $bool_fish && tick || cross
  printf 'Configured zsh........... '; $bool_zsh && tick || cross
  printf 'Configured git........... '; $bool_git && tick || cross
  printf 'Configured starship...... '; $bool_starship && tick || cross
  printf 'Configured code.......... '; $bool_code && tick || cross
  printf 'Configured vim........... '; $bool_vim && tick || cross
  printf 'Configured neovim........ '; $bool_neovim && tick || cross
  printf 'Configured tmux.......... '; $bool_tmux && tick || cross
  printf '\nSee %s for details.\n' $log_file
}

main () {
  logging
  configure
  summary
}

main
