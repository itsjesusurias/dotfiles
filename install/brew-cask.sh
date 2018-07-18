#!/bin/bash

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions
brew tap homebrew/cask-fonts

# Install packages
apps=(
    imagealpha
    imageoptim
    iterm2
    visual-studio-code
    firefox
    google-chrome
    google-chrome-canary
    opera
    screenflow
    slack
    font-meslo-for-powerline
    qlcolorcode
    qlstephen
    qlmarkdown
    quicklook-json
    qlprettypatch
    quicklook-csv
    qlimagesize
    webpquicklook
    suspicious-package
    alfred
    beardedspice
)

brew cask install "${apps[@]}"
