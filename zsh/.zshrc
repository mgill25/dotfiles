# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="norm"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git django mercurial)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/naeblis/bin:/home/naeblis/bin/sbt/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/naeblis/dev/google_appengine/

# virtualenvwrapper path.
export WORKON_HOME="$HOME/dev/src/PyProjects"
source /usr/local/bin/virtualenvwrapper.sh

# Google App Engine Path
# export PATH="$PATH:/home/naeblis/dev/google_appengine/"
#
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 

# Custom Prompt
export PS1="\$(~/.rvm/bin/rvm-prompt i u)$PS1"
# ri format settings
export RI="--format ansi --width 70"

#Set the auto completion on
autoload -U compinit
compinit

#Lets set some options
unsetopt correctall
setopt autocd
setopt auto_resume

## Enables the extgended globbing features
setopt extendedglob

#Set some ZSH styles
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

HISTFILE=~/.zsh-histfile
HISTSIZE=1000
SAVEHIST=1000

#Aliases
#ls aliases
alias ls='ls --color'
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tFh'    #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ltr='ls -ltr'
#cd, because typing the backslash is ALOT of work!!
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'

alias cdd='cd ~/dev'
alias cdp='cd ~/dev/Python/'
alias proj='cd ~/dev/Projects/'
# apt-get shortcuts
alias install='sudo apt-get install'
alias search='sudo apt-cache search'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias autoremove='sudo apt-get autoremove'
alias clean='sudo apt-get clean'
alias audoclean='sudo apt-get autoclean'

##Long list format with ll
alias ll='ls -alF'
##rm, ask before deleting
alias rm='rm -i'

#Some others for convenience
alias mkdir='mkdir -p'
alias mv='mv -i'

# grep  aliases
alias grep='grep -n --color=auto'
alias fgrep='fgrep -n --color=auto'
alias egrep='egrep -n --color=auto'
# ack alias. (betterthangrep.com
alias ack='ack --no-recurse'
#python alias
alias p='ipython'
alias bp='bpython'
alias rb='irb --simple-prompt'

# SSH aliases - short cuts to ssh to a host
# alias -g shost='ssh -p 9999 user@host.com'

# Screen aliases - add a new screen , or entire session, name it, then ssh to the host
# alias sshost='screen -t HOST shost'

# Redis
alias rs='redis-server'
alias rc='redis-cli'
# MongoDB
alias mongod='sudo ~/Downloads/mongodb-linux-x86_64-2.2.0/bin/mongod'
alias mongo='sudo ~/Downloads/mongodb-linux-x86_64-2.2.0/bin/mongo'
# Postgres
alias pg='sudo su - postgres'
# Sublime text 2
alias subl='~/Applications/Sublime\ Text\ 2/sublime_text'
# Emacs inside the console. 
alias em='emacs -nw'
# Dropbox Deamon
alias dp='~/.dropbox-dist/dropboxd'
# PyPy alias
alias pypy='/home/naeblis/dev/src/PyProjects/pypy/pypy-1.9/bin/pypy'
# Git aliases that I want to keep separate from the plugin
alias gap='git add -p'	# Selective Commit

#Case-Insensitive Tab completion
#Fist, make extended globbing work
#case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#This is to open gVIm in a single instance only.
#gvim () { command gvim --remote-silent $@ || command gvim $@; }
#alias gvim='gvim --remote-silent'

# Use vim key bindings on the command line.
bindkey -v

