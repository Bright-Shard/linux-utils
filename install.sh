#!/bin/bash
clear

# Confirmation message

echo "This program will install:"
echo "- Rust and Cargo (via Rustup)"
echo "- Starship Prompt"
echo "- Zsh, and my zsh configuration"
echo "- Git"
echo "- NeoVim, AstroNvim, Neovide, my AstroNvim configuration"
echo "- The helpful scripts in the PATH folder"
echo ""
echo "Proceed? (Y/n)"

read PROCEED
if [ $PROCEED != 'Y' ] && [ $PROCEED != 'y' ]
then
	exit
fi

# Environment setup

if [ -x "$(command -v apt)" ]
then
	INSTALL="apt install -y "
	SUDO="sudo"
elif [ -x "$(command -v pacman)" ]
then
	INSTALL="pacman -S --noconfirm "
	SUDO="sudo"
elif [ -x "$(command -v brew)"]
then
	INSTALL="brew install "
	SUDO=""
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

echo "Installing Git..."
$SUDO $STFU $INSTALL git
echo "Done."
echo "Installing Zsh..."
$SUDO $STFU $INSTALL zsh
echo "Done."
echo "Installing Rust..."
$STFU curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly --profile complete -y
$SUDO $STFU $INSTALL pkgconf
$SUDO $STFU $INSTALL cmake
source $HOME/.cargo/env
echo "Done."
echo "Installing Starship..."
$STFU cargo install starship
echo "Done."
echo "Installing cargo-update..."
$STFU cargo install cargo-update
echo "Done."
echo "Setting up Zsh..."
ln -sf $(pwd)/.zshrc ~/.zshrc
echo "Done."
echo "Linking PATH folder..."
ln -sf $(pwd)/PATH ~/PATH
echo "Done."
echo "Installing NVim..."
$SUDO $STFU $INSTALL neovim
echo "Done."
echo "Installing Neovide..."
$STFU cargo install --git https://github.com/neovide/neovide
echo "Done."
echo "Installing AstroNvim..."
$STFU git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
echo "Done."
echo "Configuring AstroNvim..."
$STFU git clone https://github.com/Bright-Shard/astronvim-conf ~/.config/nvim/lua/user
echo "Done."

echo ""
echo "=== FINISHED INSTALL SCRIPT ==="
echo ""
