#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "Brewfile" --exclude "nophonehome.py" \
		--exclude "Caskfile" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;

	source ~/.bash_profile;

	if [ `uname` == "Darwin" ]; then
		python nophonehome.py;
		source ./.osx;
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

		brew bundle Brewfile;
		brew bundle Caskfile;
	fi

	if [ `uname` == "Linux" ]; then
		source ./.linux;
	fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
