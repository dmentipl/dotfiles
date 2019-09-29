Visual Studio Code
==================

Download for either macOS or Ubuntu from <https://code.visualstudio.com/download.> For macOS extract the zip file and copy the application to `/Applications`. For Ubuntu install the `deb` with apt.

```bash
sudo apt install code_*_amd64.deb
```

Launching from the command line
-------------------------------

To run VS Code from the terminal by typing 'code'.

1. Launch VS Code.
2. Open the Command Palette (shift-command-P) and type 'shell command' to find the Shell Command: Install 'code' command in PATH command.

Running this command links `/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code` to `/usr/local/bin/code`.

Install extensions
------------------

Install extensions from `extensions.list`.

```bash
grep -v '^#' extensions.list | xargs -L1 code --install-extension
```

Symlink settings
----------------

Set directory for these dotfiles.

```bash
DOTDIR=$HOME/repos/dotfiles
```

Symlink config file `setting.json`.

```bash
ln -sf "$DOTDIR/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
```

Symlink keybindings file `keybindings.json`.

```bash
ln -sf "$DOTDIR/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
```

Symlink dictionary file `spellright.dict`.

```bash
ln -sf "$DOTDIR/vscode/spellright.dict" "$HOME/Library/Application Support/Code/User/spellright.dict"
```
