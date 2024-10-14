# Kubuntu / i3

- tools
  - `sudo apt install git curl zsh ripgrep keepassxc flameshot htop slurm filelight`
  - https://ohmyz.sh/#install
  - git
    - link `.gitconfig`
    - set up user
    - set up ssh keys

- [NeoVim](https://github.com/neovim/neovim)
  - may need to be "unstable" ppp repo
  - link : `.config/nvim
  - `cargo install stylua`
  - install `gnome-tweaks` to change CAPS > Esc (if using gnome)

- [Alacritty](https://alacritty.org/)
  - `sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50`
  - `sudo update-alternatives --config x-terminal-emulator`
  - `chsh -s $(which zsh) mixmix` (last arg is username)

- languages
  - node: https://github.com/nvm-sh/nvm
  - rust: https://www.rust-lang.org/learn/get-started

- regolith linux : https://regolith-desktop.com/

- firefox: fullscreen video only covers window (not whole screen)
  - `about:config`
  - `full-screen-api.ignore-widgets` => `true`



## Laptop T14s > current

## Laptop T440s > previous

• Intel Core i7-4600U Processor( 2.10GHz 1600MHz 4MB)
• 14.0" FHD IPS AntiGlare LED Backlight 1920x1080
• Intel HD 4400
• 8.0GB PC3-12800 DDR3L SDRAM 1600 MH
• Intel Dual Band Wireless-AC 7260
• Bluetooth Version 4.0

bought Oct 2014

- https://01.org/linuxgraphics
  - no longer needed?


- trackpad
  - mtrack / synaptic / libinput (using this one atm?)
    - sudo apt-get install xserver-xorg-input-libinput (think this is pre-installed)
---

## System

terminal tools:
  - zsh / oh-my-zsh
  - rg
  - fd : https://github.com/sharkdp/fd
  - tree
  - feh
  - slurm
  - nmcli
  - alsamixer
  - cmus
  - powertop
  - xrandr

gui tools
  - pavucontol
  - gparted
  - filelight
  - vim (windows > single window mode)
  - polo (gui)

## Setup

- Kubuntu - remap caps to esc
  - drop window menu / title bars
  - multiple desktops


## Other Resources:

- [Text Triumvirate](http://www.drbunsen.org/the-text-triumvirate/)
- https://github.com/powerline/powerline
- [Widdershin](https://github.com/Widdershin/dotfiles)
- rbenv

## Older tools

i3
  - i3 : sudo apt-get install i3
  - i3-gaps : https://github.com/Airblader/i3 (gaps-next)
  - link : .config/i3/config .config/i3status/config
  - notification styling: .config/dunst


Vim
  - `update-alternatives --list vim` check which version of vim you have installed
    - found using vim-gtk worked ok, but was verion 7
  - `vim --version` check what current version of vim was built with
  - Commant-T ruby version:
    - `~/.vim/bundle/Command-T/ruby/command-t`
    - something like : rbenv install new ruby, `ruby extconf.rb`, `make`

## Old notes from Xubuntu

  - [Powerline fonts install](https://powerline.readthedocs.org/en/latest/installation/linux.html#fontconfig)
  - note font driectories in Xubuntu are :
    - `/usr/share/fonts/X11/misc` : where you install font
    - `/etc/fonts/conf.avail` : install font .conf here then symlink to conf.d folder
  - I also deleted the symlink for the `70-no-bitmap-fonts.conf`
  - [remap caps keys  in xubuntu](http://askubuntu.com/questions/149971/how-do-you-remap-a-key-to-the-caps-lock-key-in-xubuntu)
