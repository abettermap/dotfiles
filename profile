## GDAL ##
export PATH=/Library/Frameworks/GDAL.framework/Versions/1.11/Programs:$PATH

## JAVA HOME ##
# export JAVA_HOME=$(/usr/libexec/java_home)
# export PATH=/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands:$PATH
# export PATH=$JAVA_HOME/jre/bin:$PATH

## HOMEBREW ##
# export PATH=/Users/travelampel/usr/local/bin:$PATH
# export HOMEBREW_PREFIX=/Users/travelampel/usr/local

## RUBY ##
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

## NODE ##
NPM_PACKAGES=/Users/travelampel/npm-global
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

## CUSTOM ##
source ~/dotfiles/.aliases
# bash ~/dotfiles/.aliases
# for f in ~/dotfiles*; do source "$f"; done