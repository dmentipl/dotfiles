Set up for macOS or Linux
=========================

This repository contains dotfiles and instructions on setting up a macOS or Linux (really Ubuntu) machine from scratch.

*Note: these instructions work for me. Caveat emptor.*

Before cloning this repository
------------------------------

### macOS

Install iTerm2 from <https://www.iterm2.com/>.

To install the Xcode command line tools (which include git and other basic programs) run:

```
xcode-select --install
```

Note that this command needs to be run after every macOS update. Also, as of 10.14 (Mojave) you need to run:

```
open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg
```

Follow the installer instructions.


### Ubuntu

Update the system and install git:

```
sudo apt update && sudo apt upgrade
sudo apt install git
```


### Both

*Note: If you're not me, skip this section. Just clone a copy over HTTPS.  Alternatively, fork the repository and follow along.*

Set up ssh keys to clone this repository from github.com. Run the following command

```
ssh-keygen -t rsa
```

then add the public key at github.com. Once you do this you can clone the repository with

```
mkdir ~/repos && cd ~/repos && git clone git@github.com:dmentipl/dotfiles
```


Using this repository
=====================

How to use this repository. I call sub-directories packages because they are somewhat independent and you can install what you want from each.

1. You should first follow the instructions in the `homebrew` or `dpkg` directories. Those instructions install software that other packages may rely on.
2. After that, each directory contains a `README.md` with instructions on how to use the files contained within.

You don't have to use every directory, just the ones you require.

The directories are as follows.

- [bin](bin/README.md)
- [dpkg](dpkg/README.md)
- [git](git/README.md)
- [homebrew](homebrew/README.md)
- [macOS](macOS/README.md)
- [nodejs](nodejs/README.md)
- [python](python/README.md)
- [tex](tex/README.md)
- [tmux](tmux/README.md)
- [ubuntu](ubuntu/README.md)
- [vim](vim/README.md)
- [zsh](zsh/README.md)
