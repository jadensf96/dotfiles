
. ~/i3lock.zsh

#enhance lemonbar, allegedly
if [ -n "$GTK_MODULES" ]; then
    GTK_MODULES="${GTK_MODULES}:appmenu-gtk-module"
else
    GTK_MODULES="appmenu-gtk-module"
fi

if [ -z "$UBUNTU_MENUPROXY" ]; then
    UBUNTU_MENUPROXY=1
fi

export GTK_MODULES
export UBUNTU_MENUPROXY

###########################################################
### Environment Variables #################################
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border -e'
export XKB_DEFAULT_OPTIONS=caps:escape
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR="/usr/bin/vim"
export BROWSER="/usr/bin/qutebrowser"
export FZF_DEFAULT_COMMANDS='find .'
export STOW_DIR='/home/fish/dotfiles'
### Aliases #############################################
alias ls="exa -1 --colour=always --total-size --icons -a -r -G"
alias vim="nvim -u ~/.vimrc"
alias ddg="ddgr --url-handler=w3m --rev"
alias wiki="wiki-tui"
alias bright="xrandr --output eDP --brightness"
# alias tether="nmcli connection up Jaden\'s\ S21\ FE\ Network"
alias shizuku="adb shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh\
"
alias pkgbrws="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias bat="bat --color=always"
alias pingle="ping google.com"
# zplug
#####################################################################
source /home/fish/.zplug/init.zsh
zplug "zakariaGatter/MarkEdit"
# zplug 'MefitHp/alias-maker'
# zplug "Vifon/deer"
zplug "vladmyr/dotfiles-plugin"
# zplug "brokendisk/dune-quotes"
zplug "fabiogibson/envrc-zsh-plugin"
zplug "arzzen/calc.plugin.zsh"
zplug "rimraf/k"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-autosuggestions"

zplug "sharkdp/fd"
zplug "denisidoro/navi"
zplug "joshskidmore/zsh-fzf-history-search"

# ---------deer------------
source ~/.zsh/deer/deer
zle -N deer
bindkey '\ek' deer

zstyle :deer: show_hidden yes

# -------------------------
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
### Turn off all beeps ###################################
unsetopt BEEP

HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Enable colors and change prompt:
 autoload -U colors && colors
 PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# eval $(thefuck --alias)

#tldr tab-complete
# source ~/.tldr.complete

#Pywal 
cat ~/.cache/wal/sequences && source ~/.cache/wal/colors-tty.sh

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
bindkey -s '^n' 'navi\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
		  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
		  source "$BASE16_SHELL/profile_helper.sh"

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

if [ -n "$GTK_MODULES" ]; then
        GTK_MODULES="${GTK_MODULES}:appmenu-gtk-module"
    else
        GTK_MODULES="appmenu-gtk-module"
    fi

    if [ -z "$UBUNTU_MENUPROXY" ]; then
        UBUNTU_MENUPROXY=1
    fi

    export GTK_MODULES
    export UBUNTU_MENUPROXY



# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

