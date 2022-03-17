"                 ▄▄
"  ▀████▀   ▀███▀ ██
"    ▀██     ▄█
"     ██▄   ▄█  ▀███ ▀████████▄█████▄ ▀███▄███ ▄██▀██
"      ██▄  █▀    ██   ██    ██    ██   ██▀ ▀▀██▀  ██
"      ▀██ █▀     ██   ██    ██    ██   ██    ██
" ▄▄    ▄██▄      ██   ██    ██    ██   ██    ██▄    ▄
" ██     ██     ▄████▄████  ████  ████▄████▄   █████▀
"
" High Point University ~/.vimrc file!
" Author: Ethan Cox
" Date: 3/15/2022
"
" Recommended Plugins:
" ====================
" 1. lightline:   better status bar                        [https://github.com/itchyny/lightline.vim]
" 2. syntastic:   syntax checker                           [https://github.com/vim-syntastic/syntastic]
" 3. vim-rainbow: highlights pairs of parentheses by color [https://github.com/frazrepo/vim-rainbow]
" 4. NERDTree:    filesystem explorer, multiple vim tabs   [https://github.com/preservim/nerdtree]
"


" General Settings
" ================
syntax on                       " Enable syntax highlighting
filetype plugin indent on       " Enable file-specific syntax highlighting
set number	                    " Display line numbers
set ruler                       " Display line number & character number in botton-right
set cursorline                  " Enable a line below the cursor
set nowrap                      " Disable line-wrap (recommanded max chars per line is 40)
set nocompatible                " Disable vi-compatibility
set background=dark             " Enable dark mode

set tabstop=4                   " Change the display of tabstops to 4 spaces, without affecting behavior
set softtabstop=4               " Change 'tab' to 4 spaces, without affecting visuals
set expandtab                   " Converts the 'tab' key into N spaces where N=softtabstop
set smarttab                    " Adjust indent based on current indentation level
set shiftwidth=4                " Force tab=4 spaces (idk why required, but it breaks without it, lol)

set laststatus=2                " Always display the status bar

set backspace=indent,eol,start  " Enable deletion of vim auto-inserted space

set autoindent                  " Enable automatic indentation to match current indentation level
set smartindent                 " Adjust automatic indentation to current indentation level

set wildmenu                    " Enable auto-complete for commandline commands
set showcmd                     " Show partial commands on last line of screen

set hlsearch                    " Highlight search terms in addition to jumping to them
set ignorecase                  " Make searches non-case-sensitive
set smartcase                   " Ignore 'ignorecase' if you use capital letters ("NaN" != "naN")
nnoremap <C-L> :nohl<CR><C-L>   " Disable highlighting after 

if has('mouse')                 " Enable selecting line via mouse -- you're welcome.
    set mouse=a
endif

set pastetoggle=<F11>           " Toggle 'paste'/'nopaste' with F11
