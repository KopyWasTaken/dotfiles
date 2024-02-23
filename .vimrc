" all the basics 
syntax on
set tabstop=4
set shiftwidth=4
set textwidth=120
set ai
set number
set hlsearch
set ruler
highlight Comment ctermfg=green

" set leader key to space
let mapleader = ' '

" key mappings
inoremap jk <esc>

" edit this file by pressing certain keys to get here
nnoremap <leader>ev :edit $MYVIMRC<cr> 
nnoremap <leader>ez :edit ~/.zshrc<cr>
nnoremap <leader>eb :edit ~/.bashrc<cr>
nnoremap <leader>en :edit ~/Documents/personal_wiki/TODO.txt<cr>
