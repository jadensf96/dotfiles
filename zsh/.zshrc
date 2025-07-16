
# . ~/i3lock.zsh

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

# Better history settings
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
HISTFILE=~/.zhistory
setopt appendhistory

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Better ls aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'

# System shortcuts
alias df='df -h'
alias du='du -h'
alias free='free -m'
alias path='echo $PATH | tr ":" "\n"'

# Quick edit of common config files
alias zshrc='$EDITOR ~/.zshrc'
alias tmuxconf='$EDITOR ~/.tmux.conf'
alias kittyconf='$EDITOR ~/.config/kitty/kitty.conf'

# Extract function (similar to your bash one)
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

###########################################################
### Environment Variables #################################
export PATH="/home/fish/bin:$PATH"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border -e'
export XKB_DEFAULT_OPTIONS=caps:escape
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR="/usr/bin/vim"
export BROWSER="/usr/bin/qutebrowser"
export FZF_DEFAULT_COMMANDS='find .'
export STOW_DIR='/home/fish/dotfiles'
export ZPLUG_HOME='/home/fish/.zsh/zplug'
export GEMINI_API_KEY="AIzaSyBDNZsYEyoKISNTqdHwx5wE1fwflgNCBag"
export TIMESTAMP=$(date +"%Y-%m-%d")
export P9IP="100.127.179.112"
export P9SERIAL="55291JEBF08931"
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
alias tunic="wine .wine/drive_c/Program\ Files\ \(x86\)/TUNIC/Tunic.exe"
# zplug
#####################################################################
source $ZPLUG_HOME/init.zsh
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
# source ~/.zsh/deer/deer
# zle -N deer
# bindkey '\ek' deer

# zstyle :deer: show_hidden yes

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

eval "$(gh copilot alias -- zsh)"

# Fix systemctl and other system commands library conflict with acli
systemctl() {
    local old_ld_library_path="$LD_LIBRARY_PATH"
    unset LD_LIBRARY_PATH
    command systemctl "$@"
    local exit_code=$?
    export LD_LIBRARY_PATH="$old_ld_library_path"
    return $exit_code
}

journalctl() {
    local old_ld_library_path="$LD_LIBRARY_PATH"
    unset LD_LIBRARY_PATH
    command journalctl "$@"
    local exit_code=$?
    export LD_LIBRARY_PATH="$old_ld_library_path"
    return $exit_code
}

pacman() {
    local old_ld_library_path="$LD_LIBRARY_PATH"
    unset LD_LIBRARY_PATH
    command pacman "$@"
    local exit_code=$?
    export LD_LIBRARY_PATH="$old_ld_library_path"
    return $exit_code
}
# Enhanced CLI Productivity Configuration
# Add this to your .zshrc file

# ============================================================================
# MODERN CLI TOOL ALIASES
# ============================================================================

# Better replacements for common commands
alias ll='exa -la --icons --git --group-directories-first'
alias lt='exa --tree --level=2 --icons --group-directories-first'
alias la='exa -la --icons --git'
alias ls='exa --icons'
alias cat='bat --style=auto'
alias grep='rg'
alias find='fd'
alias du='dust'
alias ps='procs'
alias top='btm'
alias htop='btm'

# Git enhancements
alias lg='lazygit'
alias gst='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'

# System info
alias neofetch='fastfetch'
alias sysinfo='fastfetch'

# ============================================================================
# TOOL INITIALIZATION
# ============================================================================

# Initialize zoxide (smart cd)
eval "$(zoxide init zsh)"
alias cd='z'  # Use zoxide instead of cd

# Initialize starship prompt (optional - uncomment if you want to replace your current prompt)
# eval "$(starship init zsh)"

# ============================================================================
# FZF ENHANCEMENTS
# ============================================================================

# Better FZF defaults
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# FZF color scheme (matches your terminal theme)
export FZF_DEFAULT_OPTS='
  --height 60%
  --layout reverse
  --border
  --inline-info
  --preview-window=right:50%
  --bind="ctrl-y:execute-silent(echo {} | pbcopy)"
  --bind="ctrl-e:execute(echo {} | xargs -o vim)"
'

# ============================================================================
# CUSTOM FUNCTIONS
# ============================================================================

# Quick directory navigation with fzf
fcd() {
    local dir
    dir=$(fd --type d --hidden --follow --exclude .git | fzf --preview 'tree -C {} | head -50') && cd "$dir"
}

# Quick file editing with fzf
fvim() {
    local file
    file=$(fd --type f --hidden --follow --exclude .git | fzf --preview 'bat --color=always {}') && vim "$file"
}

# Search and edit files containing text
fgrep() {
    local file
    file=$(rg --files-with-matches --no-messages "$1" | fzf --preview "rg --ignore-case --pretty --context 10 '$1' {}") && vim "$file"
}

# Git branch switcher
fgb() {
    local branch
    branch=$(git branch --all | grep -v HEAD | sed 's/^..//' | sed 's#remotes/origin/##' | sort -u | fzf) && git checkout "$branch"
}

# Process killer with fzf
fkill() {
    local pid
    pid=$(procs | sed 1d | fzf -m | awk '{print $1}')
    if [ "x$pid" != "x" ]; then
        echo $pid | xargs kill -${1:-9}
    fi
}

# Docker container manager
fdocker() {
    local container
    container=$(docker ps -a --format "table {{.Names}}	{{.Image}}	{{.Status}}" | fzf --header-lines=1) && docker exec -it $(echo $container | awk '{print $1}') bash
}

# Function to run ranger and set tmux pane title
ranger_tmux() {
    if [[ -n "$TMUX" ]]; then
        # Set pane title to "ranger"
        printf "\033]2;ranger\033\\
"
    fi
    command ranger "$@"
}

# Alias ranger to use the custom function
alias ranger='ranger_tmux'

# ============================================================================
# PRODUCTIVITY SHORTCUTS
# ============================================================================

# Quick access to common directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# File operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'

# Network
alias ping='ping -c 5'
alias ports='netstat -tulanp'

# System
alias df='df -h'
alias free='free -h'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# ============================================================================
# GIT CONFIGURATION ENHANCEMENTS
# ============================================================================

# Configure git to use delta for diffs (run once)
git_setup_delta() {
    git config --global core.pager delta
    git config --global interactive.diffFilter 'delta --color-only'
    git config --global delta.navigate true
    git config --global merge.conflictstyle diff3
    git config --global diff.colorMoved default
    echo "✅ Git configured to use delta for better diffs!"
}

# ============================================================================
# TMUX ENHANCEMENTS
# ============================================================================

# Tmux session management aliases
alias tmux='tmux -2'  # Force 256 colors
alias tls='tmux list-sessions'
alias ta='tmux attach-session -t'
alias tn='tmux new-session -s'
alias tk='tmux kill-session -t'

# ============================================================================
# DEVELOPMENT SHORTCUTS
# ============================================================================

# Node.js
alias ni='npm install'
alias ns='npm start'
alias nt='npm test'
alias nr='npm run'
alias nrd='npm run dev'
alias nrb='npm run build'

# Python
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv'
alias activate='source venv/bin/activate'

# Rust
alias cr='cargo run'
alias cb='cargo build'
alias ct='cargo test'
alias cc='cargo check'
alias cw='cargo watch -x run'

# Go
alias gr='go run .'
alias gb='go build'
alias gt='go test'
alias gm='go mod'

# ============================================================================
# UTILITY FUNCTIONS
# ============================================================================

# Extract any archive
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Find and replace in files
replace() {
    if [ $# -ne 3 ]; then
        echo "Usage: replace <search> <replace> <file_pattern>"
        return 1
    fi
    rg -l "$1" --glob "$3" | xargs sed -i "s/$1/$2/g"
}

# Show file/directory sizes
sizes() {
    if command -v dust >/dev/null 2>&1; then
        dust -d 1 "${1:-.}"
    else
        du -sh "${1:-.}"/* 2>/dev/null | sort -hr
    fi
}

# Weather function
weather() {
    curl -s "wttr.in/${1:-}" | head -n 17
}

# ============================================================================
# PERFORMANCE MONITORING
# ============================================================================

# System monitoring shortcuts
alias cpu='procs --sortd cpu'
alias mem='procs --sortd memory'
alias disk='dust'
alias network='netstat -i'

# ============================================================================
# CUSTOM PROJECT SHORTCUTS
# ============================================================================

# Quick access to your common project directories
alias dotfiles='cd ~/dotfiles'
alias downloads='cd ~/Downloads'
alias projects='cd ~/projects 2>/dev/null || cd ~'

echo "🚀 Enhanced CLI productivity configuration loaded!"
echo "💡 New commands available:"
echo "   ps  - Project switcher"
echo "   tm  - Tmux session manager"
echo "   fcd - Fuzzy directory navigation"
echo "   fvim - Fuzzy file editing"
echo "   fgrep - Search and edit files"
echo "   lg  - LazyGit"
echo "   Run 'git_setup_delta' to configure better git diffs"

# Sudo askpass configuration for gemini-cli
export SUDO_ASKPASS=/usr/bin/ksshaskpass
