# Install native apps
# Usage: `./cask.sh`

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install adium 2> /dev/null
brew cask install xquartz 2> /dev/null
brew cask install torbrowser 2> /dev/null
brew cask install tftpserver 2> /dev/null
# cask install shrook 2> /dev/null
brew cask install remote-desktop-connection 2> /dev/null
brew cask install keka 2> /dev/null
brew cask install github 2> /dev/null
brew cask install firefox 2> /dev/null
brew cask install epubquicklook 2> /dev/null
brew cask install emacs 2> /dev/null
brew cask install macvim 2> /dev/null
brew cask install djview 2> /dev/null
brew cask install cyberduck 2> /dev/null
brew cask install adobe-photoshop-lightroom 2> /dev/null
brew cask install android-file-transfer 2> /dev/null
brew cask install android-studio 2> /dev/null
brew cask install skype 2> /dev/null
brew cask install mixxx 2> /dev/null
brew cask install sublime-text 2> /dev/null
brew cask install transmission 2> /dev/null
brew cask install vlc 2> /dev/null

brew cask cleanup
