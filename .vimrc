set nocompatible              " be iMproved, required
filetype off                  " required

" Display line numbers
:set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Different status line
Plugin 'itchyny/lightline.vim'
" Nav tree
Plugin 'scrooloose/nerdtree'
" Git gutter
Plugin 'airblade/vim-gitgutter'
" Color schemes
Plugin 'flazz/vim-colorschemes'

call vundle#end()
" the glaive#Install() should go after the "call vundle#end()"

filetype plugin indent on    " required

" Open NERDTree when vim starts
" autocmd vimenter * NERDTree

colorscheme moonshine

" Turn on mouse support
set mouse=a

