#!/bin/bash

install_pkg (){
    dpkg-query -W -f='${Status} ${Version}\n' $1 > /dev/null

    if [[ "$?" -ne 0 ]]; then
	echo "$1 not installed"
	sudo apt-get install $1
    fi
}

sudo apt-get update

install_pkg zsh
install_pkg fortune-mod
install_pkg gnupg-agent

rm -f ~/.aliases
rm -f ~/.shellrc
rm -f ~/.zshrc

ln -s /home/debian/repos/dotfiles/shells/.aliases ~/.aliases
ln -s /home/debian/repos/dotfiles/shells/.shellrc ~/.shellrc
ln -s /home/debian/repos/dotfiles/shells/.zshrc ~/.zshrc

if [[ ! -d ~/.oh-my-zsh ]]; then
	echo "Installing oh my zsh"
	wget --no-check-certificate http://install.ohmyz.sh -O - | sh
fi
