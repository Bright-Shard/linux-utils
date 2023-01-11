# Rust
source ~/.cargo/env

# Starship prompt
eval "$(starship init zsh)"

# ROS
roson() {
	source /opt/ros/noetic/setup.zsh

	if [ $1 = "startcore" ]
	then
		stfu roscore & disown
	fi
}

# PATH mods
export PATH=~/PATH:$PATH
