" symlink this from ~/.config/nvim/init.vim

"PLUGINS

set nocompatible             " disable compatability
filetype on                  " enable type file detection
filetype plugin on           " enable plugins and load plugins
filetype indent on           " load an indent file for detexted file type
syntax on                    " syntax highlighting

" disable default file explorer
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
  " Themes
  Plug 'patstockwell/vim-monokai-tasty'
  " Plug 'pineapplegiant/spaceduck', { 'branch': 'main' } 
  " Plug 'ghifarit53/daycula-vim' , {'branch' : 'main'}

  " Plug 'flazz/vim-colorschemes'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " UI
  Plug 'lewis6991/gitsigns.nvim', { 'tag': 'v0.5' } " TODO

  Plug 'scrooloose/nerdcommenter'
  "Plug 'altercation/vim-colors-solarized'

  "Language related
  Plug 'pangloss/vim-javascript'
  Plug 'posva/vim-vue'
  Plug 'jparise/vim-graphql'
  "Plug 'leafgarland/typescript-vim'
  "Plug 'scrooloose/syntastic'
  "Plug 'sheerun/vim-polyglot'
  "Plug 'slim-template/vim-slim'
  Plug 'w0rp/ale'

  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  " TODO, install clients:
  " :CocInstall coc-tsserver
  " :CocInstall coc-rust-analyzer

  " Plug 'rust-lang/rust.vim'
  " Plug 'Olical/conjure'

  "Navigation-files
  " Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-tree/nvim-tree.lua', { 'tag': 'compat-nvim-0.7' } "TODO
  " Plug 'scrooloose/nerdtree'
  " Plug 'wincent/command-t'
  " Plug 'christoomey/vim-tmux-navigator'

  Plug 'junegunn/goyo.vim'
call plug#end()

:lua require('gitsigns').setup()
:lua << EOF
  require('nvim-tree').setup({
    renderer = {
      -- highlight_opened_files = "all",
      icons = {
        webdev_colors = false,
        git_placement = "after",
        -- show = {
        --   file = false,
        --   folder = true,
        --   folder_arrow = true,
        --   git = true,
        -- },
        -- glyphs = {
        --   default = "",
        --   symlink = "",
        --   bookmark = "",
        --   folder = {
        --     arrow_closed = ">",
        --     arrow_open = "",
        --     default = "",
        --     open = "",
        --     empty = "",
        --     empty_open = "",
        --     symlink = "",
        --     symlink_open = "",
        --   },
        --   git = {
        --     unstaged = "✗",
        --     staged = "✓",
        --     unmerged = "",
        --     renamed = "➜",
        --     untracked = "★",
        --     deleted = "",
        --     ignored = "◌",
        --   },
        -- },
      },
      -- special_files = { 
      --   "README.md",
      --   "readme.md",
      --   "Cargo.toml",
      --   "Makefile"
      -- },
      -- symlink_destination = true,
    }
  })
EOF

" Use rg instead of grep
"set grepprg=rg

"
" Put your non-Plugin stuff after this line
"

" highlight code blocks
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json', 'html']


" # NERDCommenter
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" # ALE - linter

" settings for linting .vue files
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
\ 'javascript': ['standard'],
\ 'vue': ['eslint', 'vls']
\}
" 'javascript': ['eslint', 'standard'],

" After this is configured, :ALEFix will try and fix your JS code with Standard.
let g:ale_fixers = {'javascript': ['standard']}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 0

" # Themes

set termguicolors

colorscheme vim-monokai-tasty
  let g:vim_monokai_tasty_italic = 1
  let g:airline_theme='monokai_tasty'

" colorscheme daycula
"   let g:airline_theme = "daycula"

highlight Comment gui=italic
" highlight Comment cterm=italic  < if not set termguicolors

" # airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2 "this ensures the statusbar is always visible


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

"stop vim from tracking fils and changes
set nobackup
set noswapfile

" always show signcolumns
set signcolumn=yes

"SHORTCUTS ===================================
" = change the leader key from the default \ to comma
" let mapleader = "," 

" = map jj to be equivalent to Esc
imap jj <Esc>

" = mouse scrolling!
" :map <ScrollWheelUp> <C-E>
" :map <ScrollWheelDown> <C-Y>

" autocmd VimEnter * call StartUp()


"NvimTree ====================================
nmap <leader>n :NvimTreeToggle<CR>


"Buffer shortcuts ============================
map <C-l> :bn<CR>
map <C-right> :bn<CR>
"stop me using the arrow keys :P
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

map <C-h> :bp<CR>
map <C-left> :bp<CR>

" = close a buffer
nmap <leader> w :bd<CR>
map <C-w> w :bd<CR>


"NODE shortcuts ===============================
" = run the current file with node
nmap ` :!clear && node % <CR>
" nmap ` :!clear && npm test<CR>
" nmap 1 :!clear && node %<CR>


"ALE shortcuts ================================
nmap <leader>l :ALEToggle<CR>
nmap <leader>f :ALEFix<CR>


"COC shortcuts ================================
nmap <silent> f :RustFmt<CR>

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"======

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

" spelling auto-fix - src: https://castel.dev/post/lecture-notes-1/#correcting-spelling-mistakes-on-the-fly
" setlocal spell
" set spelllang=en_gb
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
