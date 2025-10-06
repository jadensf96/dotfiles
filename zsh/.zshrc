# Better history settings
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
HISTFILE=~/.zhistory
setopt appendhistory
 cat /home/fish/.cache/wallust/sequences

### Add zsh-users/zsh-completions directory to zsh's PATH ###########
fpath=(path/to/zsh-completions/src $fpath)

#for deer inline file browser
source /home/fish/.zsh/zplug/repos/vifon/deer/deer
zle -N deer
bindkey '^n' deer
zstyle :deer: show_hidden yes

###########################################################
### Environment Variables #################################
export PATH="/home/fish/bin:$PATH"
export PATH="/home/fish/.cargo/bin:$PATH"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border -e'
export XKB_DEFAULT_OPTIONS=caps:escape
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR="/usr/bin/vim"
export FZF_DEFAULT_COMMANDS='find .'
export STOW_DIR='/home/fish/dotfiles'
export ZPLUG_HOME='/home/fish/.zsh/zplug'
export GEMINI_API_KEY="AIzaSyBDNZsYEyoKISNTqdHwx5wE1fwflgNCBag"
export TIMESTAMP=$(date +"%Y-%m-%d")
export P9IP="100.127.179.112"
export P9SERIAL="55291JEBF08931"
export BROWSER="/usr/bin/qutebrowser"
### Aliases #############################################
alias ddg="ddgr --url-handler=w3m --rev"
alias wiki="wiki-tui"
# alias tether="nmcli connection up Jaden\'s\ S21\ FE\ Network"
alias shizuku="adb shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh\
"
alias pkgbrws="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias bat="bat --color=always"
alias mount="sudo mount -o rw,uid=$UID,gid=$GID"
# alias vim="nvim -u /home/fish/.vimrc"
# zplug
#####################################################################
source $ZPLUG_HOME/init.zsh
zplug "zakariaGatter/MarkEdit"
zplug "vifon/deer", use:deer
zplug "fabiogibson/envrc-zsh-plugin"
zplug "rimraf/k"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-autosuggestions"
zplug "sharkdp/fd"
zplug "denisidoro/navi"
zplug "joshskidmore/zsh-fzf-history-search"

### Turn off all beeps ###################################
unsetopt BEEP


# Enable colors and change prompt:
 autoload -U colors && colors
 PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
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

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||

       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

bindkey -s '^f' 'fzf\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


# Created by `pipx` on 2025-08-31 19:16:37
export PATH="$PATH:/home/fish/.local/bin"

if [ -e /home/fish/.nix-profile/etc/profile.d/nix.sh ]; then . /home/fish/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


