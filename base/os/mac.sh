#!/bin/zsh
#
# Set macOS defaults. Tested on Monterey, i.e. macOS 12.0.
#
# Resources:
#
# - https://github.com/boochtek/mac_config
# - https://github.com/mathiasbynens/dotfiles
# - https://github.com/yannbertrand/macos-defaults

# ---------------------------------------------------------------------------- #

# Only run in macOS.
[[ $(uname) = Darwin ]] || return 1

# ---------------------------------------------------------------------------- #
# Hostname

# Set the hostname
sudo scutil --set HostName macbookpro

# ---------------------------------------------------------------------------- #
# Trackpad

# Enable tap to click.
defaults read com.apple.AppleMultitouchTrackpad Clicking -bool true

# Enable 3-finger drag.
defaults read com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Enable scroll-to-zoom with Ctrl (^) modifier key (and 2 fingers).
defaults read com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults read com.apple.AppleMultitouchTrackpad HIDScrollZoomModifierMask -int 262144

# ---------------------------------------------------------------------------- #
# Keyboard

# Automatically illuminate built-in MacBook keyboard in low light.
defaults read com.apple.BezelServices kDim -bool false

# Set a blazingly fast keyboard repeat rate.
defaults read NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults read NSGlobalDomain InitialKeyRepeat -int 15      # opts: 120,94,68,35,25,15
defaults read NSGlobalDomain KeyRepeat -int 2              # opts: 120,90,60,30,12,6,2

# ---------------------------------------------------------------------------- #
# Dock

# Automatically hide and show the Dock.
defaults read com.apple.dock autohide -bool true

# Do not automatically rearrange spaces based on most recent use.
defaults read com.apple.dock mru-spaces -bool false

# ---------------------------------------------------------------------------- #
# Finder

# When opening a new window, start in the home directory.
defaults read com.apple.finder NewWindowTargetPath "file://$HOME"

# Show hidden files.
defaults read com.apple.finder AppleShowAllFiles -bool true

# Finder: show status bar.
defaults read com.apple.finder ShowStatusBar -bool true

# Finder: show path bar.
defaults read com.apple.finder ShowPathbar -bool true

# Warn before emptying the Trash.
defaults read com.apple.finder WarnOnEmptyTrash -bool true

# Empty Trash securely by default.
defaults read com.apple.finder EmptyTrashSecurely -bool true

# Don't show any special icons on desktop.
defaults read com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults read com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults read com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults read com.apple.finder ShowMountedServersOnDesktop -bool false

# Use list view in all Finder windows by default.
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`.
defaults read com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: show all filename extensions.
defaults read NSGlobalDomain AppleShowAllExtensions -bool true

# Avoid creating .DS_Store files on network or USB volumes.
defaults read com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults read com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder.
chflags nohidden ~/Library

# ---------------------------------------------------------------------------- #
# Screensaver

# Require password immediately after sleep or screen saver begins.
defaults read com.apple.screensaver askForPassword -int 1
defaults read com.apple.screensaver askForPasswordDelay -int 0

# ---------------------------------------------------------------------------- #
# Screenshots

# Save screenshots to the desktop.
defaults read com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF).
defaults read com.apple.screencapture type -string "png"

# Disable shadow in screenshots.
defaults read com.apple.screencapture disable-shadow -bool true

# ---------------------------------------------------------------------------- #
# Restart

killall Dock
killall Finder
