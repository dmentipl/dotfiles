Visual Studio Code
==================

Launching from the command line
-------------------------------

To run VS Code from the terminal by typing 'code'.

1. Launch VS Code.
2. Open the Command Palette (shift-command-P) and type 'shell command' to find the Shell Command: Install 'code' command in PATH command.

Running this command links `/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code` to `/usr/local/bin/code`.

Install extensions
------------------

Install extensions.

```bash
code --install-extension formulahendry.code-runner
code --install-extension hansec.fortran-ls
code --install-extension krvajalm.linter-gfortran
code --install-extension ms-python.python
code --install-extension tomphilbin.gruvbox-themes
code --install-extension vscodevim.vim
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
