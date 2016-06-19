" reference : http://www.drbunsen.org/the-text-triumvirate/

"PLUGINS
"execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" UI
Plugin 'altercation/vim-colors-solarized'
"Plugin 'tomasr/molokai'
"Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'

Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'

"syntax related
Plugin 'scrooloose/syntastic'
"Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim'

"navigation-files
Plugin 'wincent/Command-T'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'

"navigation-text
Plugin 'easymotion/vim-easymotion'
"Plugin 'justinmk/vim-sneak'

"ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

call vundle#end()            " required

" Use ack instead of grep
"set grepprg=ack

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



set background=dark
colorscheme solarized
set t_Co=16
let g:solarized_termcolors=16 "note 16 bit looks great but generate minor problems in vim+tmux 
"set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
"togglebg#map("<F5>")

set laststatus=2 "this ensures the statusbar is always visible
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"


"formatting stuff
"set smartindent
"set autoindent

set tabstop=2
set shiftwidth=2
set expandtab  
set hlsearch "highlights all search matches

set number

syntax enable

"stop vim from tracking fils and changes
set nobackup
set noswapfile

"change the leader key from the default \ to comma 
let mapleader = ","

" close a buffer
nmap <leader>w :bd<CR>

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Vim-Sneak
"let g:sneak#s_next = 1

" auto open NERDTree if there's no file passed : 
function! StartUp()
  if 0 == argc()
    NERDTree
  end
endfunction

autocmd VimEnter * call StartUp()

"stop me using the arrow keys :P
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"buffer  navigattion
map <C-right> :bn<CR>
map <C-left> :bp<CR>

" Yank text to the clipboard
" you need to install a vim with +xterm_clipboard to ensure you can copy to
" the system clipboard (try  sudo apt-get install vim-gnome)
set clipboard=unnamedplus
"map <leader>y :w !xsel -i -b<CR>

"noremap <leader>y "*y
"noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" add tabbing btwn splits
noremap <tab> <c-w><c-w> 

