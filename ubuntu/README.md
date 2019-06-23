Setup Ubuntu defaults
=====================

Run the bash script to set some defaults.

```bash
./ubuntu_defaults.sh
```

This sets the following:

- swap Caps Lock key and Left Alt key
- dock applications
- icon theme
- desktop background (wallpaper)
- installs Nvidia drivers

Fonts
-----

Install fonts.

```bash
FONTDIR=~/.local/share/fonts
cd ~/Downloads
```

I use 'Lato' for Evernote.

```bash
# Lato for Evernote
curl -L http://www.latofonts.com/download/Lato2OFL.zip -o Lato2OFL.zip
unzip Lato2OFL.zip
cp Lato2OFL/*.ttf $FONTDIR
```

And 'Inconsolata for Powerline' for the terminal.

```bash
URL=https://github.com/powerline/fonts/blob/master/Inconsolata
curl -L \
  "${URL}/Inconsolata%20Bold%20for%20Powerline.ttf?raw=true" \
  -o Inconsolata\ Bold\ for\ Powerline.ttf
curl -L \
  "${URL}/Inconsolata%20for%20Powerline.otf?raw=true" \
  -o Inconsolata\ for\ Powerline.otf
cp Inconsolata\ Bold\ for\ Powerline.ttf $FONTDIR
cp Inconsolata\ for\ Powerline.otf $FONTDIR
```
