Python
======

Set directory for these dotfiles.

```bash
DOTDIR=$HOME/repos/dotfiles
```

Download and install Anaconda.

```bash
# Dowload Anaconda install script
cd ~/Downloads || return
if [[ $OSTYPE =~ ^darwin ]]; then
  URL=$($DOTDIR/python/latest_anaconda_install_script_url macOS)
else
  URL=$($DOTDIR/python/latest_anaconda_install_script_url Linux)
fi
curl -O $URL

# Install anaconda
bash Anaconda3-*-x86_64.sh
cd -
```

Install Python packages into the base environment with Conda.

```bash
# Make sure to be in base environment
conda update conda
conda install --file base.yml
```

Install extra Python packages with pip.

```bash
pip install -r requirements.txt
```

Install Jupyter Lab extensions.

```bash
jupyter labextension install jupyterlab_vim
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install jupyter-matplotlib
```

Link Python config files.

```bash
ln -sf "${DOTDIR}/python/condarc" ~/.condarc
ln -sf "${DOTDIR}/python/pycodestyle" ~/.config/pycodestyle
```
