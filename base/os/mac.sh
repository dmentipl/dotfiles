#!/usr/bin/env bash
#
# Set macOS Monterey defaults.
#
# https://github.com/mathiasbynens/dotfiles
# https://github.com/boochtek/mac_config

# Only run in macOS.
[[ $(uname) = Darwin ]] || return 1

# Ask for the administrator password upfront
sudo -v

# ---------------------------------------------------------------------------- #
# Hostname

# Set the hostname
sudo scutil --set HostName macbookpro

# ---------------------------------------------------------------------------- #
# Software update

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# ---------------------------------------------------------------------------- #
# Trackpad

# Enable tap to click. (Don't have to press down on the trackpad -- just tap it.)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Enable 3-finger drag. (Moving with 3 fingers in any window "chrome" moves the window.)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Enable scroll-to-zoom with Ctrl (^) modifier key (and 2 fingers).
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad HIDScrollZoomModifierMask -int 262144
defaults write com.apple.AppleMultitouchTrackpad HIDScrollZoomModifierMask -int 262144

# ---------------------------------------------------------------------------- #
# Keyboard

# Automatically illuminate built-in MacBook keyboard in low light.
defaults write com.apple.BezelServices kDim -bool false

# Set a blazingly fast keyboard repeat rate.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15      # opts: 120,94,68,35,25,15
defaults write -g KeyRepeat -int 2              # opts: 120,90,60,30,12,6,2

# ---------------------------------------------------------------------------- #
# Dock

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Do not automatically rearrange spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# ---------------------------------------------------------------------------- #
# Finder

# When opening a new window, start in the home directory.
defaults write com.apple.finder NewWindowTargetPath "file://$HOME"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files.
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Warn before emptying the Trash.
defaults write com.apple.finder WarnOnEmptyTrash -bool true

# Empty Trash securely by default.
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Don't show any special icons on desktop.
defaults write ShowExternalHardDrivesOnDesktop -bool false
defaults write ShowHardDrivesOnDesktop -bool false
defaults write ShowRemovableMediaOnDesktop -bool false
defaults write ShowMountedServersOnDesktop -bool false

# ---------------------------------------------------------------------------- #
# Screensaver

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# ---------------------------------------------------------------------------- #
# Screenshots

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
