#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#
# Installation script for Vinter
#

echo "Installing Vinter"

# Backup local vim files
backupDir="${HOME}/.vinter-backup.$(date +%Y%m%dT%H%M%S)"
echo "Backing up all your old vim files to ${backupDir}"
mkdir ${backupDir}
mv ~/.vim* ${backupDir}
if [ -e ${backupDir}/.vimrc.local ] ; then
    cp ${backupDir}/.vimrc.local ~/.vimrc.local
fi

# Link vim files
echo "Creating default .vim configuration files"
ln -s ${DIR}/vimrc ~/.vimrc
ln -s ${DIR}/vimrc.plugins ~/.vimrc.plugins
ln -s ${DIR}/vim ~/.vim
touch ~/.vimrc.plugins.local

if [ ! -e ~/.vimrc.local ] ; then
    echo "Creating a skeleton ~./vimrc.local file"
    cp ${DIR}/vimrc.local ~/.vimrc.local
fi

# Install Vundle
if [ -d ~/.vim/bundle/Vundle.vim ] ; then
    cd ~/.vim/bundle/Vundle.vim ; git pull ; cd -
    vim +PluginClear +qall
    vim +PluginInstall +qall
else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

# Install all plugins

# Build the C extension for Command T
echo "Building the Command T C extension"
cd ~/.vim/bundle/command-t/ruby/command-t && ruby extconf.rb && make

echo "Done with the installation. Happy hacking!"

exit 0
