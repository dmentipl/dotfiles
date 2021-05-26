#!/usr/bin/env bash

[[ "$(dirname $0)" == '.' ]] || \
  { printf 'Must run script in directory... Exiting!\n'; exit 1; }

change_shell () {
  echo "Current shell is $SHELL"
  PS3='Choose shell to change to: '
  shells=("bash" "fish" "zsh")
  select shell in "${shells[@]}"; do
    echo "Changing shell to $(which $shell)"
    if [[ "$(uname)" = 'Linux' ]]; then
      chsh --shell "$(which $shell)"
    else
      sudo dscl . -create "/Users/$USER" UserShell "$(which $shell)"
    fi
    break
  done
}

main () {
echo '+ -------------------------------------------------------------------- +'
echo '|                                                                      |'
echo '|  Dotfiles installation and configuration script                      |'
echo '|                                                                      |'
echo '+ -------------------------------------------------------------------- +'
echo ''
read -p "++++++ Install software (y/[n])? " answer
case ${answer:0:1} in
    y|Y )
        ./install.sh
        ;;
    * )
        echo 'Not installing'
        ;;
esac
echo ''
read -p "++++++ Configure dotfiles (y/[n])? " answer
case ${answer:0:1} in
    y|Y )
        ./configure.sh
        ;;
    * )
        echo 'Not configuring'
        ;;
esac
echo ''
read -p "++++++ Change shell (y/[n])? " answer
case ${answer:0:1} in
    y|Y )
        change_shell
        ;;
    * )
        echo 'Not changing shell'
        ;;
esac
}

main
