Set up macOS
============

Change caps lock to control

- System Preferences > Keyboard > Keyboard (Modifier Keys): remap caps lock to control.

To set desktop background (wallpaper), first quit System Preferences, if open, then download the file and set it as the background.

```bash
osascript -e 'tell application "System Preferences" to quit'

cd ~/Pictures
wget https://upload.wikimedia.org/wikipedia/commons/9/9e/Milky_Way_IR_Spitzer.jpg
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$HOME/Pictures/Milky_Way_IR_Spitzer.jpg\""
```

To set the macOS defaults run the `macOS_defaults.sh` shell script:

```bash
./macOS_defaults.sh
```

Read the script to see what it does, and modify as required.

Fonts
-----

Install fonts.

```bash
FONTDIR=~/Library/Fonts
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
