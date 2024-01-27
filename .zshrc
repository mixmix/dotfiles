# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PATH="$HOME/projects/dotfiles/bash_scripts:$PATH"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="amuse"
# ZSH_THEME="miloshadzic"
# ZSH_THEME="gallifrey"
# ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/mix/bin"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# disable rbenv for the moment
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"


# env vars


# alias

# alias firefox-dev="/opt/firefox/firefox"
# alias tmux="tmux -2"
# alias tmux="TERM=xterm-256color tmux"
# alias mygrep="grep -rinsI"
alias magic="echo '\n\e[37m  (ﾉ´ヮ´)ﾉ*:･ﾟ✧\e[0m\n'"
alias ahau="cd ~/projects/AHAU/ahau && echo '\n\e[37m  Āhau\e[0m\n'"
alias smat="cd ~/projects/SMAT/network-ui"

alias dev="npm run dev"
alias lint="npm run lint"

alias yesterday='vim -O ~/Documents/journal/$(date -I --date "yesterday").md ~/Documents/journal/$(date -I).md'
alias today='vim ~/Documents/journal/$(date -I).md'

# alias useful="cat /home/mixmix/Desktop/useful\ commands | less"
# alias vuseful="vim /home/mixmix/Desktop/useful\ commands"

alias ssb='cd ~/projects/SSBC'
alias pb='cd ~/projects/SSBC/patchbay'

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gpo="git pull origin"
alias gpom="git pull origin master"
alias gco="git checkout"
alias gcom="git checkout master"
alias gdom="git diff origin/master"
alias gfo="git fetch origin"
alias gg="git log --pretty=oneline --abbrev-commit --graph --decorate"
alias gga="git log --pretty=oneline --abbrev-commit --graph --decorate --all"
alias gtrash="git status --short | xargs trash"
alias gfire="git push origin HEAD:${USER}-fire -f"

squash-branch() {
  name=`git rev-parse --abbrev-ref HEAD`
  echo "Squashing $name into one commit"
  g co master
  g co -b squashtmp
  g merge $name --squash
  g commit
  g br -D $name
  g br -m $name
}

# text triumvirate

export EDITOR="vim"
#bindkey -v   #this turns on vim-bindings in zsh

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

### Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

### Home Bin
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

### Node section ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


###-begin-npm-completion-###
# npm command completion script
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###


# check all node dependencies are included before!
# https://www.npmjs.com/package/dependency-check
# npm () {
#   ([ "$1" != "publish" ] || dependency-check . --no-dev) && command npm "$@"
# }
# npm () {
#   if [ "$1" = "publish" ]; then
#     dependency-check . &&  $(which npm) "$@"
#   fi
# }

### RBENV setup ###
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"


### Rust ###
# To get started you need Cargo's bin directory ($HOME/.cargo/bin) in your PATH
# environment variable. Next time you log in this will be done automatically.
export PATH=$PATH:$HOME/.cargo/bin

# To configure your current shell run source $HOME/.cargo/env

### Android ###
# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# Alacritty
fpath+=${ZDOTDIR:-~}/.zsh_functions

### Radicle
# export PATH="$HOME/.radicle/bin:$PATH"

### Go
# export PATH=$PATH:/usr/local/go/bin

### Gradle (android)
export PATH=$PATH:/opt/gradle/gradle-8.1/bin
