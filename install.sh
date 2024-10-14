#!/bin/bash

sudo apt update
sudo apt install \
  git curl wget zsh neovim ripgrep keepassxc \
  make gcc g++ libtool \
  xclip flameshot \
  vlc gimp inkscape \
  htop slurm \
  filelight tree

curl https://sh.rustup.rs -sSf | sh

cd ~
if [ ! -e ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
