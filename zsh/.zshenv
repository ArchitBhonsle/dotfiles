export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export HISTFILE="$XDG_DATA_HOME"/zsh/history
export LESSHISTFILE=-
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

path=("$HOME/.local/bin" "$HOME/.cargo/bin" $path)
export PATH
