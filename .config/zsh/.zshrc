#                     /$$                          
#                    | $$                          
# /$$$$$$$$  /$$$$$$$| $$$$$$$   /$$$$$$   /$$$$$$$
#|____ /$$/ /$$_____/| $$__  $$ /$$__  $$ /$$_____/
#   /$$$$/ |  $$$$$$ | $$  \ $$| $$  \__/| $$      
#  /$$__/   \____  $$| $$  | $$| $$      | $$      
# /$$$$$$$$ /$$$$$$$/| $$  | $$| $$      |  $$$$$$$
#|________/|_______/ |__/  |__/|__/       \_______/
#                                                  

export ZDOTDIR=$HOME/.config/zsh

# Enable colors and change prompt:
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '( %b)'
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
#PROMPT='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%1~%{$fg[red]%}]%{$reset_color%}%b${vcs_info_msg_0_}$ '
PROMPT='%B%{$fg[red]%}[%F{214}%n%F{003}@%F{214}%M %{$fg[green]%}%1~%{$fg[red]%}]%{$reset_color%}%b%F{015}${vcs_info_msg_0_}$ '

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Options (man zshoptions)
setopt appendhistory
unsetopt BEEP
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# Auto/tab complete:
autoload -U compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey '^J' beginning-of-line
bindkey '^K' end-of-line 
bindkey '^H' backward-delete-word

# Extra PATHs
PATH="$PATH:$(go env GOPATH)/bin" # Golang
PATH="$PATH:$HOME/scripts/bin" # homemade scripts
export PATH

# Set default browser
export BROWSER=firefox
export EDITOR=nvim
export TERMINAL=alacritty

# Change caps to esc
setxkbmap -option caps:escape

# Source files 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f ~/.config/zsh/.zsh_aliases ] && source ~/.config/zsh/.zsh_aliases


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
