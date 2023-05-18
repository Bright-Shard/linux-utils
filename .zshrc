# Rust
source ~/.cargo/env

# Ruby
for file in $(ls ~/.local/share/gem/ruby)
do
	export PATH=~/.local/share/gem/ruby/$file/bin:$PATH
done
export BUNDLE_PATH=$HOME/.bundle

# Starship prompt
eval "$(starship init zsh)"

# ROS
roson() {
	source /opt/ros/noetic/setup.zsh

	if [ $1 -e "startcore" ]
	then
		stfu roscore & disown
	fi
}

# PATH mods
export PATH=~/PATH:$PATH
