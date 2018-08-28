### FROM .profile

###############
#### ENV ###### 
###############

### GDAL ###
export PATH=/Library/Frameworks/GDAL.framework/Versions/1.11/Programs:$PATH

### RUBY ###
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" 
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

### NODE ###
export PATH=~/npm-global/bin:$PATH
#NPM_PACKAGES=~/npm-global
#NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
#PATH="$NPM_PACKAGES/bin:$PATH"
### END .profile ###

# Use specific version of node via nvm
# export NVM_DIR="~/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  

# nvm alias default 5.12.0

if hash nvm 2>/dev/null; then    
    # Set node version via nvm
    echo "we have nvm"
else
    # echo "no nvm installed"
fi

### START .bashrc ###

###############
### ALIASES ###
###############
alias pyserv='python -m SimpleHTTPServer'
alias phpserv='php -S localhost:8005'

### VIEW MOST RECENT COMMANDS ###
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

### CHECK TEMPERATURE ###
alias check_temp='~/Desktop/osx-cpu-temp/./osx-cpu-temp'

#################
### FUNCTIONS ###
#################

### REMOVE ICONR FILES  ###
function rm_icon() {
  find . -name "Icon*" -type f -delete
}

## CLEAN VIEW OF PATH ##
function path(){
    echo $PATH | tr -s ':' '\n'
}

## CLOSE APPLICATION ##
function quit {
osascript <<EOF
  tell application "$*" to quit
EOF
}

## CLOSE CLIPBOARD ##
function closepboard {
    eval ps aux | grep '[p]board'| `awk '{ print "kill " $2 }'`
}

### END .bashrc ### 

### START ZSHRC ###
# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(git brew zsh-nvm grunt docker tmux vagrant)

source $ZSH/oh-my-zsh.sh

# nvm problems
nvm use --delete-prefix v5.12.0 --silent

# User configuration

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

## END ZSHRC ###
