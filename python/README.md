Python
======

Download and install Anaconda.

```bash
# Dowload Anaconda install script
cd ~/Downloads || return
if [[ $OSTYPE =~ ^darwin ]]; then
  URL=$(${DOTFILES}/python/latest_anaconda_install_script_url macOS)
else
  URL=$(${DOTFILES}/python/latest_anaconda_install_script_url Linux)
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
ln -sf "${DOTFILES}/python/condarc" ~/.condarc
ln -sf "${DOTFILES}/python/pycodestyle" ~/.config/pycodestyle
```
