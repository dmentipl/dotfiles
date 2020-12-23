#!/usr/bin/env bash
#
# Install software.

conda_dir=$HOME/conda

[[ "$(dirname $0)" == '.' ]] || \
  { printf 'Must run script in directory... Exiting!\n'; exit 1; }

is_ubuntu () {
  [[ "$(uname)" == 'Linux' ]] && [[ "$(lsb_release -is)" == 'Ubuntu' ]]
}

is_fedora () {
  [[ "$(uname)" == 'Linux' ]] && [[ "$(lsb_release -is)" == 'Fedora' ]]
}

is_macos () {
  [[ "$(uname)" == 'Darwin' ]]
}

set_mac_defaults () {
  printf -- '\n--- setting macOS defaults\n'
  bash install/macOS_defaults.sh
}

install_with_apt () {
  printf -- '\n--- installing applications with apt\n'
  pkgs=$(<install/pkglist.txt)
  for pkg in "${pkgs[@]}"; do
    sudo apt install -y "$pkg"
  done
}

install_with_dnf () {
  if command -v dnf > /dev/null; then
    printf -- '\n--- installing applications with dnf\n'
    pkgs=$(<install/pkglist.txt)
    for pkg in "${pkgs[@]}"; do
      sudo dnf install -y "$pkg"
    done
  else
    printf -- '\n--- dnf not available\n'
  fi
}

install_with_brew () {
  command -v brew > /dev/null || install_homebrew
  printf -- '\n--- installing applications with homebrew\n'
  command -v brew > /dev/null && brew bundle --file install/Brewfile
}

install_homebrew () {
  printf -- '\n--- installing homebrew\n'
  /usr/bin/ruby -e \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
    && brew update && brew doctor
}

install_vim_plug () {
  # vim
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # neovim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

install_code_extensions () {
  if command -v code > /dev/null; then
    printf -- '\n--- installing code extensions\n'
    exts=$(<install/extensions.txt)
    for ext in "${exts[@]}"; do
      code --install-extension "$ext"
    done
  else
    printf -- '\n--- code not available\n'
    printf -- '    Install from https://code.visualstudio.com/Download\n'
    printf -- '    Then from the command palette run "Shell Command: Install code command in PATH"'
  fi
}

install_fzf () {
  if command -v fzf > /dev/null; then
    printf -- '\n--- fzf already installed... skipping\n'
    return
  else
    printf -- '\n--- installing fzf\n'
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
      && ~/.fzf/install
  fi
}

install_starship () {
  if command -v starship > /dev/null; then
    printf -- '\n--- starship already installed... skipping\n'
    return
  else
    printf -- '\n--- installing starship\n'
    curl -fsSL https://starship.rs/install.sh | bash
  fi
}

install_conda () {
  if command -v conda > /dev/null; then
    printf -- '\n--- conda already installed... skipping\n'
    return
  else
    printf -- '\n--- installing conda\n'
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
      && bash Miniconda3-latest-Linux-x86_64.sh -b -p "$conda_dir" \
      && rm Miniconda3-latest-Linux-x86_64.sh
  fi
}

uninstall_conda () {
  printf -- '\n--- uninstalling conda\n'
  rm -rf "$conda_dir"
}

main () {
  printf '========== Installing ==========\n\n'
  if is_macos; then
    set_mac_defaults
    install_with_brew
    install_code_extensions
  fi
  is_ubuntu && install_with_apt
  is_fedora && install_with_dnf
  install_fzf
  install_starship
  install_conda
  install_vim_plug
}

main
