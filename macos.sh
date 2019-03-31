#!/bin/zsh

# Dock
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 55
defaults write com.apple.dock springboard-columns -int 10
defaults write com.apple.dock springboard-rows -int 7

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Bottom right screen corner → sleep
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

# Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Prevent Photos from opening automatically when devices are plugged in
defaults write com.apple.ImageCapture disableHotPlug -bool NO

# Disable Dashboard and Mission Control
defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.dock mcx-expose-disabled -bool true

# Enable `Tap to click`
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Datetime format
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"

# Don't make .DS_Store on network folder
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
