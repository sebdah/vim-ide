#!/usr/bin/env bash

set -eof pipefail

#
# Install script for Vinter
#

# Set global variables
backup_dir="${HOME}/.vinter-backup.$(date +%Y%m%dT%H%M%S)"
source_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
target_dir=${HOME}

###########################
#
# Functions
#
###########################

# Print usage information
print_usage()
{
  echo -e "Usage: install.sh [OPTIONS]\n"
  echo "OPTIONS:"
  echo -e "--help\t\tShow this help"
}

# Backup a file
#
# Args:
# - File to backup
backup()
{
  if [ ! -d ${backup_dir} ] ; then
    mkdir -p ${backup_dir}
  fi

  if [ -e ${target_dir}/${1} ] ; then
    echo "Backing up ${target_dir}/${1} to ${backup_dir}/${1}"
    cp -r ${target_dir}/${1} ${backup_dir}/${1}
  fi
}

# Link files
#
# Args:
# - File to link to target
link()
{
  echo "Linking ${source_dir}/${1} to ${target_dir}/.${1}"
  ln -s ${source_dir}/${1} ${target_dir}/.${1}
}

# Remove files, dirs or links
#
# Args:
# - Target
remove()
{
  if [ -L ${target_dir}/${1} ] ; then
    echo "Unlinking ${target_dir}/${1}"
    unlink ${target_dir}/${1}
  elif [ -d ${target_dir}/${1} ] ; then
    echo "Removing ${target_dir}/${1}"
    rm -rf ${target_dir}/${1}
  elif [ -f ${target_dir}/${1} ] ; then
    echo "Removing ${target_dir}/${1}"
    rm -rf ${target_dir}/${1}
  fi
}

###########################
#
# Argument parsing
#
###########################

if [ "${1}" == "--help" ] ; then
  print_usage
  exit 0
fi

###########################
#
# Main program
#
###########################

echo "> INSTALLING Vinter"

# Backup local vim files
echo -e "\n>> CREATING BACKUPS"
echo "Backing up all your old vim files to ${backup_dir}"
backup ".vim"
backup ".vimrc"
backup ".vimrc.local"
backup ".vimrc.plugins.local"

echo -e "\n>> CLEAN UP"
echo "Clean up old vim configuration"
remove ".vim"
remove ".vimrc"

# Link vim files
echo -e "\n>> INSTALL BASE CONFIGURAION"
echo "Installing Vinter configuration files"
link "vim"

echo "Creating example .vimrc.local (${target_dir}/.vimrc.local.example)"
if [ -e ${target_dir}/.vimrc.local.example ] ; then
  rm ${target_dir}/.vimrc.local.example > /dev/null 2>&1
fi
cp ${source_dir}/vimrc.local.example ${target_dir}/.vimrc.local.example

# Install Vundle
echo -e "\n>> INSTALL DEPENDENCIES AND PLUGINS"
echo "Installing Vundle for plugin management"
if [ -d ${target_dir}/.vim/bundle/Vundle.vim ] ; then
    cd ${target_dir}/.vim/bundle/Vundle.vim ; git pull ; cd -
else
    git clone https://github.com/gmarik/Vundle.vim.git ${target_dir}/.vim/bundle/Vundle.vim
fi

# Install all plugins
vim +PluginInstall +qall

# Build the C extension for Command T
echo "Building the Command T C extension"
cd ${target_dir}/.vim/bundle/command-t/ruby/command-t/ext/command-t && ruby extconf.rb && make

# Install ternjs dependencies
cd ${target_dir}/.vim/bundle/tern_for_vim && npm install && cd -

echo -e "\n> DONE"
echo "Done with the installation. Happy hacking!"

exit 0
