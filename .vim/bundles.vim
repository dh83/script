set nocompatible
filetype off " required

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

command! PluginUpdate PluginInstall!

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" UI improvements
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}  
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'

" Plugin 'altercation/vim-colors-solarized'
Plugin 'cdlm/vim-colors-solarized'

" Language modes
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'hallison/vim-markdown'
Plugin 'vim-pandoc/vim-markdownfootnotes'
Plugin 'skammer/vim-css-color'
Plugin 'tpope/vim-haml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'postmodern/vim-yard'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ntpeters/vim-better-whitespace' 
Plugin 'Valloric/YouCompleteMe' 
" fast file opening
Plugin 'wincent/command-t'

" Use Supertab for ycm and snipmate compatibility
Plugin 'ervandew/supertab'
" Editing
Plugin 'sickill/vim-pasta'
Plugin 'godlygeek/tabular'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'Gundo'
Plugin 'Align'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" External tools
Plugin 'hallettj/jslint.vim'
Plugin 'mileszs/ack.vim'
Plugin 'hari-rangarajan/CCTree' 

call vundle#end()

filetype plugin indent on
