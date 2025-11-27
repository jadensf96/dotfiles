# Better history settings
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
HISTFILE=~/.zhistory
setopt appendhistory
# cat /home/fish/.cache/wallust/sequences
#
(cat ~/.cache/wal/sequences &)
 source ~/.cache/wal/colors-tty.sh

### Add zsh-users/zsh-completions directory to zsh's PATH ###########
fpath=(/home/fish/.zsh/completions $fpath)


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
export p9="100.127.179.112"
export p9="100.72.244.99"
export P9SERIAL="55291JEBF08931"
export BROWSER="/usr/bin/qutebrowser"
### Aliases #############################################
alias sctl="sudo systemctl"
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
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-autosuggestions"
zplug "sharkdp/fd"
zplug "denisidoro/navi"

### Turn off all beeps ###################################
unsetopt BEEP
export ZSH_FZF_HISTORY_SEARCH_BIND='^r'

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


autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zsh-fzf-history-search
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
