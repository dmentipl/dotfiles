Python
======

Set directory for these dotfiles.

```bash
DOTDIR=$HOME/repos/dotfiles
```

Download and install Anaconda

```bash
# Dowload Anaconda install script
cd ~/Downloads || return
if [[ $OSTYPE =~ ^darwin ]]; then
  curl -O https://repo.anaconda.com/archive/Anaconda3-2018.12-MacOSX-x86_64.sh
else
  curl -O https://repo.anaconda.com/archive/Anaconda3-2018.12-Linux-x86_64.sh
fi

# Install anaconda
bash Anaconda3-*-x86_64.sh
```

Install extra Python packages with Conda

```bash
conda install --file base.yml
```

Install extra Python packages with pip

```bash
pip install -r requirements.txt
```

Install Jupyter Lab extensions

```bash
jupyter labextension install jupyterlab_vim
```

Link Python config files

```bash
ln -sf "${DOTDIR}/python/condarc" ~/.condarc
ln -sf "${DOTDIR}/python/pycodestyle" ~/.config/pycodestyle
```
