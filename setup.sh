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


############################################################
start "zsh"

cd ~
if [ ! -e ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
step

backup_initial .zshrc
step

linkup .zshrc
step

end
############################################################
start "neovim"

cd ~
mkdir -p ~/.config/nvim

backup_initial .config/nvim/init.vim
step

linkup .config/nvim/init.vim
step

if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
step

end

echo "   => to complete setup, run :PlugInstall"
############################################################
start "regolith"

mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status


end
############################################################

