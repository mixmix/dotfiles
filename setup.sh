#!/bin/bash

dotfiles="${HOME}/projects/dotfiles"

# LOGGING /////////////////////////////////////////
name=""
function start () {
  name="$1"
  echo "   ${name}"
}

CLEAR="\e[1A\e[K"  # go up one line, clear that line
# CLEAR=""
progress=""
function step () { 
  progress="${progress}."
  echo -e "${CLEAR}   ${name}${progress}"
  # echo -n "."
}
function end () {
  progress=""
  echo -e "${CLEAR} ✓ ${name}${progress}"
}

# BACKUP /////////////////////////////////////////
function backup_initial () {
  local config="${HOME}/$1"
  local config_backup="${config}.initial"
  if [ -f $config ] && [ ! -f $conf_backup ]; then
    cp $config $config_backup
  fi
}

# LINKUP /////////////////////////////////////////
function linkup () {
  # $1 is assumed to be the path relative to ~
  local dest_path="${HOME}/$1"
  local dest_dir=$(dirname $dest_path)
  local src_path="${dotfiles}/$1"

  ln -fs $src_path $dest_dir 
}

function linkupDir () {
  # $1 is assumed to be the path relative to ~
  local dest_path="${HOME}/$1"
  local src_path="${dotfiles}/$1"

  ln -fs $src_path $dest_path
}


############################################################
start "zsh"

backup_initial .zshrc
step

linkup .zshrc
step

end
############################################################
start "neovim"

cd ~
mkdir -p ~/.config

backup_initial .config/nvim
step

linkupDir .config/nvim
step

end

echo "   => to complete setup, run :Lazy"
############################################################
start "regolith"

mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status


end
############################################################

