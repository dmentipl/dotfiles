dpkg and apt install
====================

Packages to install on Debian based machines.

Apt add some repositories.

```bash
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-add-repository ppa:hnakamur/universal-ctags
sudo apt-add-repository ppa:numix/ppa
sudo apt update
```

Apt install from the list of packages in `packages.txt`.

```bash
sudo apt install "$(cat packages.txt)"
```

Chrome
------

To install Google Chrome:

```bash
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' \
  | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable
```

Dropbox
-------

Get the latest `.deb` package from [Dropbox](https://linux.dropboxstatic.com/packages/ubuntu/). It will be something like `dropbox_2019.02.14_amd64.deb`. Then install.

```bash
sudo apt install dropbox_*_amd64.deb
```

ripgrep
-------

To install `ripgrep`, a nicer version of `grep`:

```bash
RG_VER=$(curl -sSL "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | jq --raw-output .tag_name)
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/"$RG_VER"/ripgrep_"$RG_VER"_amd64.deb
sudo apt install ripgrep*.deb
```

fd
---

To install `fd`, a nicer `find`:

```bash
FD_VER=7.3.0
curl -LO https://github.com/sharkdp/fd/releases/download/v"$FD_VER"/fd_"$FD_VER"_amd64.deb
sudo apt install fd*.deb
```

Check that the version number `FD_VER` is the latest.
