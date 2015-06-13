#!/usr/bin/env bash

set -eof pipefail

#
# Install script for Vinter
#

# Set global variables
backup_dir="${HOME}/.vinter-backup.$(date +%Y%m%dT%H%M%S)"
force_install=0
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
  echo -e "--force\t\tForce install. Will remove your ${target_dir}/.vimrc.local file (will be backed up)"
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

  if [ -e ${backup_dir}/${1} ] ; then
    echo "Backing up ${target_dir}/${1} to ${backup_dir}/${1}"
    mv ${target_dir}/${1} ${backup_dir}/${1}
  fi
}

# Link files
#
# Args:
# - File to link to target
link()
{
  echo "Linking ${target_dir}/${1} to ${source_dir}/.${1}"
  ln -s ${target_dir}/${1} ${source_dir}/.${1}
}

###########################
#
# Argument parsing
#
###########################

if [ "${1}" == "--help" ] ; then
  print_usage
  exit 0
elif [ "${1}" == "--force" ] ; then
  force_install=1
fi

###########################
#
# Main program
#
###########################

echo "Installing Vinter"

# Backup local vim files
echo "Backing up all your old vim files to ${backup_dir}"
backup ".vim"
backup ".vimrc"
backup ".vimrc.plugins"

if [ ${force_install} -eq 1 ] ; then
  backup ".vimrc.local"
  backup ".vimrc.plugins.local"
fi

# Link vim files
echo "Installing Vinter configuration files"
rm ${target_dir}/.vimrc.local.example > /dev/null 2>&1
link "vim"
link "vimrc"
link "vimrc.plugins"
link "vimrc.local.example"
touch ${target_dir}/.vimrc.plugins.local

# Install Vundle
if [ -d ${target_dir}/.vim/bundle/Vundle.vim ] ; then
    cd ${target_dir}/.vim/bundle/Vundle.vim ; git pull ; cd -
else
    git clone https://github.com/gmarik/Vundle.vim.git ${target_dir}/.vim/bundle/Vundle.vim
fi

# Install all plugins
vim +PluginInstall +qall

# Build the C extension for Command T
echo "Building the Command T C extension"
cd ${target_dir}/.vim/bundle/command-t/ruby/command-t && ruby extconf.rb && make

echo "Done with the installation. Happy hacking!"

exit 0
