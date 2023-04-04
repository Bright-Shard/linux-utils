#!/bin/bash
clear

# Confirmation message

echo "This program will install:"
echo "- Rust and Cargo (via Rustup)"
echo "- Starship Prompt"
echo "- Zsh"
echo "- The .zshrc in this repo"
echo "- The helpful scripts in ./PATH"
echo ""
echo "Proceed? (Y/n)"

read PROCEED
if [ $PROCEED != 'Y' ] && [ $PROCEED != 'y' ]
then
	exit
fi



# Environment stuffs

if [ -x "$(command -v apt)" ]
then
	INSTALL="apt install -y "
elif [ -x "$(command -v pacman)" ]
then
	INSTALL="pacman -S --noconfirm "
else
	echo "ERROR: Failed to detect a package manager"
	echo "Note: Currently, this script only supports APT and Pacman. Use a different package manager? Make a PR!"
	exit
fi
STFU=$(pwd)/PATH/stfu


# Actual installer

echo ""
echo "=== STARTING INSTALL SCRIPT ==="
echo ""

echo "Installing Zsh..."
sudo $STFU $INSTALL zsh
echo "Done."
echo "Installing Rust..."
$STFU curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly --profile complete -y
source $HOME/.cargo/env
sudo $STFU $INSTALL pkgconf
sudo $STFU $INSTALL cmake
$STFU cargo install cargo-binstall
echo "Done."
echo "Installing Starship..."
$STFU cargo binstall starship -y
echo "Done."
echo "Setting up Zsh..."
ln -sf $(pwd)/.zshrc ~/.zshrc
echo "Done."
echo "Linking PATH folder..."
ln -sf $(pwd)/PATH ~/PATH
echo "Done."

echo ""
echo "=== FINISHED INSTALL SCRIPT ==="
echo ""
