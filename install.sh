#!/bin/zsh
echo "Install Rust? (Y/n)"
read install_rust
if [ $install_rust = 'Y' ] || [ $install_rust = 'y' ]
then
	curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly --profile complete &>/dev/null </dev/null
	echo "Rust installed."
fi

echo "Setting up Zsh..."
ln -sf .zshrc ~/.zshrc
echo "Done."
echo "Linking PATH folder..."
ln -sf PATH ~/PATH
echo "Done."

echo "Install completed!"
