#!/bin/zsh
echo "Install Rust? (Y/n)"
read install_rust
if [ $install_rust = 'Y' || $install_rust = 'y' ]
then
	curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly --profile complete &>/dev/null </dev/null
	echo "Rust installed."
fi

ln -sf .zshrc ~/.zshrc
ln -sf PATH ~/PATH
