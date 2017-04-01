# Install command-line tools using Homebrew
# Usage: `./brew.sh`

function brewInst() {
	# Make sure we're using the latest Homebrew
	brew update

	# Upgrade any already-installed formulae
	brew upgrade --all

	# Install GNU core utilities (those that come with OS X are outdated)
	echo "Don't forget to add \`$(brew --prefix coreutils)/libexec/gnubin\` to \`\$PATH\`."
	brew install coreutils
	#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

	# Install some other useful utilities like `sponge`
	brew install moreutils
	# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
	brew install findutils
	# Install GNU `sed`, overwriting the built-in `sed`
	brew install gnu-sed --default-names
	# Install Bash 4
	# Note: don't forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
	brew install bash
	brew tap homebrew/versions
	brew install bash-completion2

	# Switch to using brew-installed bash as default shell
	if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
		echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
		chsh -s /usr/local/bin/bash;
	fi;

	# Install wget with IRI support
	brew install wget --with-iri

	# Install more recent versions of some OS X tools
	brew install vim --override-system-vi
	brew install homebrew/dupes/grep
	brew install homebrew/dupes/screen
	#install homebrew/php/php55 --with-gmp

	# Install some CTF tools; see https://github.com/ctfs/write-ups
	brew install bfg
	brew install binutils
	brew install binwalk
	brew install cifer
	brew install dex2jar
	brew install dns2tcp
	brew install fcrackzip
	brew install foremost
	brew install hashpump
	brew install hydra
	brew install john
	brew install knock
	brew install nmap
	brew install netpbm
	brew install pngcheck
	brew install sqlmap
	brew install tcpflow
	brew install tcpreplay
	brew install tcptrace
	brew install ucspi-tcp # `tcpserver` et al.
	brew install xpdf
	brew install xz

	# Install other useful binaries
	brew install ack
	brew install dark-mode
	#install exiv2
	brew install git
	brew install git-lfs
	brew install imagemagick --with-webp
	brew install lynx
	#install node # This installs `npm` too using the recommended installation method
	brew install p7zip
	brew install pigz
	brew install pv
	brew install rename
	#install rhino
	brew install tree
	brew install webkit2png
	brew install zopfli
	brew install tmux
	brew install mc

	# Remove outdated versions from the cellar
	brew cleanup
}

if [ $(brew &>/dev/null; echo "${?}") == '1' ]; then
	echo "Initialization";
	brewInst;
else
	echo "Brew not found... please install it via command:";
	echo "ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\" ";
fi;

unset brewInst;
