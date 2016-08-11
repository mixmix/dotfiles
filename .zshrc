# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="amuse"
ZSH_THEME="gallifrey-mix"
#ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/mix/bin"
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
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


# env vars


# alias

alias firefox-dev="/opt/firefox/firefox"
#alias tmux="tmux -2"
alias tmux="TERM=xterm-256color tmux"
alias mygrep="grep -rinsI"
alias magic="echo '\n\e[37m  (ﾉ´ヮ´)ﾉ*:･ﾟ✧\e[0m\n'"

# rake aliases
alias rdm="rake db:migrate db:test:prepare"
alias rdrb='bundle exec rake db:rollback'
alias zrdm="zeus rake db:migrate db:test:prepare"
alias zrr="zeus rake routes"
alias zrrg="zeus rake routes | grep"
alias rrg="rake routes | grep"
alias brr="bin/rake routes"
alias brrg="bin/rake routes | grep"


# contributor_grapher envs

export USER_AGENT=www.github.com/s01us
export TARGET_REPO=loomio/loomio
export CUSTOM_HEADING='commited to LOOMIO this month'

#loomio alias
alias zc="zeus cucumber"
alias hipcast="~/projects/scripts/hipchat_address_pusher.sh"

alias useful="cat /home/mixmix/Desktop/useful\ commands | less"
alias vuseful="vim /home/mixmix/Desktop/useful\ commands"

alias loom='cd ~/projects/LOOMIO/loomio'
alias pw='cd ~/projects/SSBC/patchwork'
alias pwe='cd ~/projects/SSBC/patchwork-electron'
alias eda='cd ~/projects/EDA'
alias ker='cd ~/projects/EDA/KERERU'
alias kerb='cd ~/projects/EDA/KERERU/kereru-book'
alias ea='cd ~/projects/WORK/gst_return'
alias wp='~/projects/WORK/web_punch'
alias cft='~/projects/scripts/customer_feedback_tool_update.sh'
alias tupdate='loom && gcom && gpom && ~/projects/LOOMIO/i18n-tools/update.sh'
alias sp='cd ~/projects/WORK/spanner_planner'
alias ns='cd ~/projects/LEARNING/nodeschool'

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gcom="git checkout master"
alias gcos="git checkout staging"
alias gfo="git fetch origin"
alias gg="git log --pretty=oneline --abbrev-commit --graph --decorate"
alias gga="git log --pretty=oneline --abbrev-commit --graph --decorate --all"
alias gpom="git pull origin master"
alias gpsm="git pull source master"
alias gpos="git pull origin staging"
alias gdom="git diff origin/master"
alias gdos="git diff origin/staging"
alias gdomr="git diff origin/master --name-only | grep _spec.rb | xargs rspec -fdoc"
alias gdosr="git diff origin/staging --name-only | grep _spec.rb | xargs rspec -fdoc"
alias gtrash="git status --short | xargs trash"
alias gres="git diff origin/master --name-only | xargs sublime"
alias gdres="git diff --name-only | xargs sublime"
alias gfire="git push origin HEAD:${USER}-fire -f"

#alias patchwork="cd ~/projects/OTHERS_APPS/patchwork && npm start"

alias dokkugeorge='ssh -t dokku@app.georgecloonio.net'
alias dokkumixio='ssh -t dokku@mixio.dinotech.co.nz'

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


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


### Node section ###

source ~/.nvm/nvm.sh
###-begin-npm-completion-###
#
# npm command completion script
#
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
