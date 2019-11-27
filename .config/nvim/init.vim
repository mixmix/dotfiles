" symlink this from ~/.config/nvim/init.vim

"PLUGINS
"execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
  " UI
  Plug 'flazz/vim-colorschemes'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdcommenter'
  "Plug 'tpope/vim-fugitive'
  "Plug 'altercation/vim-colors-solarized'

  "syntax related
  Plug 'w0rp/ale'
  Plug 'rust-lang/rust.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'posva/vim-vue'
  " Plug 'scrooloose/syntastic'
  "Plug 'sheerun/vim-polyglot'
  "Plug 'pangloss/vim-javascript'
  "Plug 'kchmck/vim-coffee-script'
  "Plug 'slim-template/vim-slim'

  "navigation-files
  Plug 'scrooloose/nerdtree'
  "Plug 'wincent/command-t'
  "Plug 'christoomey/vim-tmux-navigator'

  "navigation-text
  "Plug 'easymotion/vim-easymotion'
  "Plug 'justinmk/vim-sneak'

  "ruby
  "Plug 'vim-ruby/vim-ruby'
  "Plugin 'tpope/vim-rails'

call plug#end()            " required

" Use ack instead of grep
"set grepprg=ack

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
"
" Put your non-Plugin stuff after this line

" # NERDCommenter
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" # ALE - linter

" settings for linting .vue files
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}

" After this is configured, :ALEFix will try and fix your JS code with Standard.
let g:ale_fixers = {'javascript': ['standard']}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 0

" # Themes
"set background=dark
"colorscheme solarized
"colorscheme spacegray
"colorscheme mango
"colorscheme beekai
"colorscheme maui

set background=light
"colorscheme hemisu
"colorscheme pencil
"colorscheme fx
"colorscheme leya
"colorscheme sol-term
"colorscheme mango
"colorscheme beachcomber

" let g:pencil_higher_contrast_ui=1
set t_Co=16
"let g:solarized_termcolors=16 "note 16 bit looks great but generate minor problems in vim+tmux

"set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
"togglebg#map("<F5>")

" # airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2 "this ensures the statusbar is always visible

" let g:airline_theme='base16_grayscale'
" let g:airline_theme='minimalist'
let g:airline_theme='night_owl'
" let g:airline_theme='soda'

" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"

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

" # Shortcuts
let mapleader = "," "change the leader key from the default \ to comma

nmap <leader>l :ALEToggle<CR>
nmap <leader>f :ALEFix<CR>

imap jj <Esc>
" map jj to be equivalent to Esc

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

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

" run the current file with node
nmap 1 :!clear && node %<CR>
" run the npm test command
nmap ` :!clear && npm test<CR>

"buffer  navigation
map <C-right> :bn<CR>
map <C-l> :bn<CR>

map <C-left> :bp<CR>
map <C-h> :bp<CR>

nmap <leader>w :bd<CR>
" close a buffer

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

" git gutter override
