#!/bin/zsh

src=${(%):-%N}
cd "$(dirname $src)"

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.zsh_profile;
}

if [[ "$1" == "--force" || "$1" == "--f" ]]; then
	doIt;
else
	read "sure?This may overwrite existing files in your home directory. Are you sure? (y/n) ";
	echo "";
	if [[ $sure =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

