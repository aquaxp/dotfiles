#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function cleanup() {
	if [ `uname` == "Linux" ]; then
		rm -rf ~/init;
	fi
}

function doIt() {
	rsync   --exclude ".git/" \
		--exclude "init/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "nophonehome.py" \
		--exclude ".osx" \
		--exclude ".linux" \
		--exclude ".windows" \
		--exclude "cask.sh" \
		--exclude "brew.sh" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;

	source ~/.bash_profile;
	cleanup;
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
unset cleanup;
