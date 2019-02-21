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

" Add maktaba and codefmt to the runtimepath.
" " (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" " Also add Glaive, which is used to configure codefmt's maktaba flags. See
" " `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
" " ...
call vundle#end()
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

filetype plugin indent on    " required

" Open NERDTree when vim starts
" autocmd vimenter * NERDTree

colorscheme moonshine

" Turn on mouse support
set mouse=a

