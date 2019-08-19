Visual Studio Code
==================

Download for either macOS or Ubuntu from https://code.visualstudio.com/download. For macOS extract the zip file and copy the application to `/Applications`. For Ubuntu install the `deb` with apt.

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

Install extensions.

```bash
code --install-extension bierner.markdown-checkbox
code --install-extension bierner.markdown-preview-github-styles
code --install-extension christian-kohler.path-intellisense
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension eamodio.gitlens
code --install-extension formulahendry.code-runner
code --install-extension guyskk.language-cython
code --install-extension hansec.fortran-ls
code --install-extension krvajalm.linter-gfortran
code --install-extension lextudio.restructuredtext
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
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
