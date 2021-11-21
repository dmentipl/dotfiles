#!/bin/zsh
#
# Set macOS defaults. Tested on Monterey, i.e. macOS 12.0.
#
# Must logout (or restart) for some changes to take effect.
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
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Enable 3-finger drag.
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Enable scroll-to-zoom with Ctrl (^) modifier key (and 2 fingers).
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.AppleMultitouchTrackpad HIDScrollZoomModifierMask -int 262144

# ---------------------------------------------------------------------------- #
# Keyboard

# Automatically illuminate built-in MacBook keyboard in low light.
defaults write com.apple.BezelServices kDim -bool false

# Set a blazingly fast keyboard repeat rate.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain InitialKeyRepeat -int 15      # opts: 120,94,68,35,25,15
defaults write NSGlobalDomain KeyRepeat -int 2              # opts: 120,90,60,30,12,6,2

# ---------------------------------------------------------------------------- #
# Dock

# Automatically hide and show the Dock.
defaults write com.apple.dock autohide -bool true

# Do not automatically rearrange spaces based on most recent use.
defaults write com.apple.dock mru-spaces -bool false

# Do not show recent applications
defaults write com.apple.dock show-recents -bool false

# ---------------------------------------------------------------------------- #
# Finder

# When opening a new window, start in the home directory.
defaults write com.apple.finder NewWindowTargetPath "file://$HOME"

# Show hidden files.
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show status bar.
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar.
defaults write com.apple.finder ShowPathbar -bool true

# Warn before emptying the Trash.
defaults write com.apple.finder WarnOnEmptyTrash -bool true

# Empty Trash securely by default.
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Don't show any special icons on desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Use list view in all Finder windows by default.
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`.
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: show all filename extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Avoid creating .DS_Store files on network or USB volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder.
chflags nohidden ~/Library

# ---------------------------------------------------------------------------- #
# Screensaver

# Require password immediately after sleep or screen saver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# ---------------------------------------------------------------------------- #
# Screenshots

# Save screenshots to the desktop.
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF).
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots.
defaults write com.apple.screencapture disable-shadow -bool true

# ---------------------------------------------------------------------------- #
# Terminal

# Use Ctrl-Tab and Ctrl-Shift-Tab to cycle iTerm tabs in order.
defaults write com.googlecode.iterm2 GlobalKeyMap -dict-add 0x19-0x60000-0x30 '{ Action = 2; Label = ""; Text = ""; Version = 0; }'
defaults write com.googlecode.iterm2 GlobalKeyMap -dict-add 0x9-0x40000-0x30 '{ Action = 0; Label = ""; Text = ""; Version = 0; }'
