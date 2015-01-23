# Install native apps
# Usage: `./cask.sh`


if [ $(brew list | grep brew-cask &>/dev/null; echo "${?}") == '0' ]; then
	echo "Cask already installed. Continuing...";
	echo "";
else
	echo "Cask not installed. Installing Cask...";
	brew install caskroom/cask/brew-cask;
fi;

# Updating casks
brew tap caskroom/versions;

# Apps list
apps=(adium \
	xquartz \
	torbrowser \
	tftpserver \
	remote-desktop-connection \
	keka \
	github \
	firefox \
	epubquicklook \
	emacs \
	macvim \
	djview \
	cyberduck \
	adobe-photoshop-lightroom \
	android-file-transfer \
	android-studio \
	skype \
	mixxx \
	sublime-text \
	transmission \
	vlc);

# Installing casks
for app in ${apps[@]}; do
	brew cask install $app 2>/dev/null;
done;

# cleanup
brew cask cleanup;
