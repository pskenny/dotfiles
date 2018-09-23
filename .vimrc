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

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Open NERDTree when vim starts
autocmd vimenter * NERDTree

