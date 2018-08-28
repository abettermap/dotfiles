emojify ":sunglasses: :sunglasses: :sunglasses: :sunglasses:"
echo ''

### ZSH CONFIGURATION ###
# User configuration
DEFAULT_USER="travelampel"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git php docker grunt)

# Powerline theme
POWERLEVEL9K_HOME_SUB_ICON=
POWERLEVEL9K_MODE='awesome-patched'
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon context dir vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# Syntax highlighting
source /usr/local/Cellar/zsh-syntax-highlighting/0.6.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### PATH SETUP, EXPORTS ###
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation
export ZSH=/Users/travelampel/.oh-my-zsh

# Python
export PYTHONPATH=/Applications/QGIS.app/Contents/Resources/python/

# GDAL
export PATH=/usr/local/Cellar/gdal2/2.1.3_2/bin:$PATH

# QT (QMAKE) via Homebrew
export PATH=/usr/local/Cellar/qt5/5.8.0_1/bin:$PATH

# PHPBREW
export PATH=$HOME/resources:$PATH

## RUBY ##
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## NODE ##
NPM_PACKAGES=/Users/travelampel/npm-global
# export PATH=~/npm-global/bin:$PATH
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
# PATH="$NPM_PACKAGES/bin:$PATH"

source $ZSH/oh-my-zsh.sh

### ALIASES ###
alias pyserv='python -m SimpleHTTPServer'
alias httpserv='http-server -o'
alias phpserv='php -S localhost:8005'
alias recent='fc -l -20'

## PROJECT ALIASES ##
alias wfmap='cd ~/projects/wfmis/git/wfmis-gitlab/ && gfa'
alias dta='cd ~/projects/gismo/git-repos/AK-landing/akgismo-mobile-app/ak-landing-page-src/DTA && gfa'
alias fwa='cd ~/projects/gismo/git-repos/AK-landing/akgismo-mobile-app/ak-landing-page-src/FWA && gfa'
alias jber='cd ~/projects/gismo/git-repos/AK-landing/akgismo-mobile-app/ak-landing-page-src/JBER && gfa'
alias akgismo='cd ~/projects/gismo/git-repos/AK-landing/akgismo-mobile-app/ak-landing-page-src && gfa'
alias higismo='cd ~/projects/gismo/git-repos/hi-landing && gfa'
alias hisfc='cd ~/projects/soldier-field-cards/HISFC-repo && gfa'

# Get on `dev` branch, pull, cleanup, list branches
alias gitdev='gfa && gco dev && gl && gbda && gb'

#############################################################
#       Docker cleanup aliases (all begin with `drm`)       #
#############################################################

# Remove dangling images, volumes, stopped containers
alias drmsc='docker rm $(docker ps -a -q)'

# Remove dangling volumes
alias drmdv='docker volume rm $(docker volume ls -qf dangling=true)'

# Remove dangling images
alias drmdi='docker rmi $(docker images -q --filter "dangling=true")' 

# Remove network/s
alias drmn='docker network rm'

# Show all containers
alias dpsa='docker ps -a'

# List networks
alias dnls='docker network ls'

#############################################################
#   Docker compose aliases (all commands start with `dc`)   #
#############################################################

alias dcb='docker-compose build'
alias dcd='docker-compose down'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcub='docker-compose up --build'

#############################################################
#                   Misc. Docker aliases                    #
#############################################################

# Sort images alphabetically
alias dimg='docker images | sort'

# Start portainer GUI
alias dock-portainer='docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer'

# Enter container as root (replace 'mycontainer')
# docker exec -u 0 -it mycontainer bash

# Git log with branch illustration
alias gitgraph='git log --graph --abbrev-commit --decorate --date=relative --all'
# Nice short git log (overrides zsh git plugin, which does `git log --stat`)
# Cred: https://coderwall.com/p/euwpig/a-better-git-log
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Show global npm modules
alias npm-ls-global='npm ls -g --depth=0'

# Show hidden files in Finder ##
alias show-hidden='defaults write com.apple.finder AppleShowAllFiles YES'

# SSH into ACNS dev site
alias ssh_acns="ssh 'cwis103@webhost0.acns.colostate.edu'"


### FUNCTIONS ###

# GISMO viewing
function gismo(){
  gismo_path="$HOME/projects/gismo/git-repos/$1/development"

  cd "$gismo_path" && http-server -o
}

# CLEAN VIEW OF PATH
function path(){
  echo $PATH | tr -s ':' '\n'
}

# CLOSE APPLICATION
function quit {
osascript <<EOF
  tell application "$*" to quit
EOF
}

# CLOSE CLIPBOARD
function closepboard {
    eval ps aux | grep '[p]board'| `awk '{ print "kill " $2 }'`
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use --delete-prefix v8.11.1 --silent
#nvm use --delete-prefix v6.11.3 --silent

# Add Visual Studio Code (code)
export PATH="$PATH:/Users/travelampel/resources/applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Android/Java stuff
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/Users/travelampel/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
