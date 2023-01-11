#!/bin/zsh

export wd=$(pwd)

echo "Install Rust? (Y/n)"
read install_rust
if [ $install_rust = 'Y' ] || [ $install_rust = 'y' ]
then
	$wd/PATH/stfu curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly --profile complete
	echo "Rust installed."
fi

echo "Setting up Zsh..."
ln -sf $wd/.zshrc ~/.zshrc
echo "Done."
echo "Linking PATH folder..."
ln -sf $wd/PATH ~/PATH
echo "Done."

echo "Install completed!"
