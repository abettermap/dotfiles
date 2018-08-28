#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
<<<<<<< Updated upstream
# list of files/folders to symlink in homedir
files="bashrc gitconfig bash_profile profile vimrc vim profile npmrc zshrc oh-my-zsh"    
=======
files="bashrc gitconfig bash_profile profile vimrc vim profile npmrc zshrc"    # list of files/folders to symlink in homedir
>>>>>>> Stashed changes

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# clone vim color schemes
cd vim
git clone https://github.com/flazz/vim-colorschemes.git
cp -r ~/dotfiles/vim/vim-colorschemes/colors/ ~/dotfiles/vim/colors
ls -la ~/dotfiles/vim/vim-colorschemes/colors
unlink ~/dotfiles/vim/vim
