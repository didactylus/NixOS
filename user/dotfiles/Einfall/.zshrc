#defaults
export EDITOR="nvim"
export TERMINAL="ghostty"
export TERM="ghostty"

#prompt
export PS1="%F{red}%n%f@%m:%~$ "

#XDG Dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_MUSIC_DIR="$HOME/Media/Music"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_HOME="$HOME/.local/state"
export MPD_HOST="127.0.0.1"
export MPD_PORT="6600"
export XDG_PICTURES_DIR="$HOME/Media/Image/Pictures"

#PATH
export PATH="/bin:$HOME/.bin:$PATH"

#colors
export LS_COLORS="ex=01;32:mi=01;31:ow=01;33"

#performance
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

#command history
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

setopt HIST_IGNORE_ALL_DUPS

#key repeat delay
export KEYTIMEOUT=1

#aliases
alias zconf='$EDITOR ~/.config/zsh/.zshrc'
alias hconf='$EDITOR ~/.config/hypr/hyprland.conf'
alias nlua='$EDITOR ~/.config/nvim/init.lua'
alias llama-chat='~/Temp/llama.cpp/build/bin/llama-cli -m "Storage/LLMs/Models/nous-hermes-2-mistral-8x7b-dpo.Q6_K.gguf" --interactive --chat --color -t $(nproc)'
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

#pywal16
[ -f "${HOME}/.cache/wal/colors.sh" ] && source "${HOME}/.cache/wal/colors.sh"

#autostart Hyprland
if [[ -z $DISPLAY && "$(tty)" == "/dev/tty1" ]]; then
	exec Hyprland
fi
