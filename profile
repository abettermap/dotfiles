### GDAL ###
export PATH=/Library/Frameworks/GDAL.framework/Versions/1.11/Programs:$PATH

### RUBY ###

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" 
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

### NODE ###
NPM_PACKAGES=/Users/travelampel/npm-global
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

### CUSTOM ###
source ~/dotfiles/.aliases