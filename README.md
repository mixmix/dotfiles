## System

- Kubuntu 16.04
- Konsole
- vim.gtk3 (debian package)


## Setup

- Vim
  - `update-alternatives --list vim` check which version of vim you have installed
  - `vim --version` check what current version of vim was built with
  - Commant-T ruby versin: 
    - `~/.vim/bundle/Command-T/ruby/command-t`
    - something like : rbenv install new ruby, `ruby extconf.rb`, `make`

- Kubuntu 
  - remap caps to esc
  - drop window menu / title bars
  - multiple desktops


## Resources:

- [Text Triumvirate](http://www.drbunsen.org/the-text-triumvirate/)
- https://github.com/powerline/powerline
- [Widdershin](https://github.com/Widdershin/dotfiles)

- rbenv
- nvm
  

## Old notes from Xubuntu

  - [Powerline fonts install](https://powerline.readthedocs.org/en/latest/installation/linux.html#fontconfig)
  - note font driectories in Xubuntu are : 
    - `/usr/share/fonts/X11/misc` : where you install font
    - `/etc/fonts/conf.avail` : install font .conf here then symlink to conf.d folder
  - I also deleted the symlink for the `70-no-bitmap-fonts.conf`
  - [remap caps keys  in xubuntu](http://askubuntu.com/questions/149971/how-do-you-remap-a-key-to-the-caps-lock-key-in-xubuntu)
