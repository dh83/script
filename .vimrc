set nocompatible " be iMproved
set encoding=utf-8

" Prefix/namespace for user commands
let mapleader=";"

" Configure & load bundles
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:tagbar_ctags_bin = g:easytags_cmd
" jslint: force node instead of javascriptcore: https://github.com/hallettj/jslint.vim/issues/31
let $JS_CMD = 'node'

runtime bundles.vim

" Setup bundles
let g:acp_behaviorKeywordLength = 3
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:cssColorVimDoNotMessMyUpdatetime = 'kthxbye'
" indent guides
let g:indent_guides_indent_levels = 12
let g:indent_guides_start_level = 3
" let g:indent_guides_guide_size = 0
let g:indent_guides_auto_colors = 0


let g:CommandTMaxHeight=7
let g:CommandTMatchWindowReverse=1
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>tb :TagbarToggle<cr>
nnoremap <leader>e  :CommandT<cr>
nnoremap <leader>TF :CommandTFlush<cr>

" 
function! TexSpell()
    cexp system('trex check ')
    copen
endfunction
command! TexSpell call TexSpell()

" Load project-local settings if any
set exrc secure

" Anticipating some common typos
function! CommandAlias(abbreviation, expansion)
    execute 'cabbr ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction
command! -nargs=+ CommandAlias call CommandAlias(<f-args>)
" Use it on itself to define a simpler abbreviation for itself.
CommandAlias alias CommandAlias

" Quick (re)sourcing to .vimrc & testing vimscript code
nmap <leader>src :source $MYVIMRC<cr>
function! DoIt() range
    let lines = join(getline(a:firstline, a:lastline), "\n")
    execute lines
endfunction
command! DoIt call DoIt()
map <leader>d :DoIt<cr>

" Remap 'quit' keys
if ! exists('vimpager')
    nnoremap q :q
endif
CommandAlias qw wq
CommandAlias W w

syntax on
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

let NERDTreeIgnore=['\.pyc$', '\~$', '^\.svn', '\.o$', '\.aux$', '\.out$', '\..*\.orig$', '\.synctex.gz$', '\.toc$', '\.blg$', '\.bbl', '\.lof', '\.lot']

" enable status line always
set laststatus=2
" let &statusline=' %f%( %y%m%r%)%=L%l C%v '
" set statusline+=%(%{fugitive#statusline()}\ %)
let Powerline_symbols='unicode'

autocmd VimEnter,Colorscheme * :highlight link IndentGuidesOdd CursorLine
autocmd VimEnter,Colorscheme * :highlight clear IndentGuidesEven

" set the status line to flashy colors in insert mode
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse

" FileTypes ==================================================================
" autowrap for .txt and .tex files
autocmd FileType tex setlocal wrap spell
autocmd BufRead,BufNewFile *.txt setlocal wrap spell
autocmd BufRead,BufNewFile *.md setlocal wrap spell


set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set wildmenu wildmode=list:longest,full wildignore+=*.swp,*.bak,*.pyc,*.elc,*.zwc,*.class,*.git
set ruler
set showcmd
set showmode
set number
set hidden
set wrap
set scrolloff=2
nmap <leader>w :set wrap!<cr>
set visualbell
set fillchars=""
set cursorline
set nofoldenable
set history=1000

" Sane indentation defaults
set expandtab
set smartindent
set autoindent

" undoing even after closing the file
set undofile
set undodir=~/.vim-undo
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

function! SetIndent(...)
    let size = (a:0 == 0) ? 4 : a:1
    execute 'set tabstop=' . size
    execute 'set shiftwidth=' . size
    execute 'set softtabstop=' . size
endfunction
command! -nargs=? SetIndent call SetIndent(<f-args>)
cnoremap seti SetIndent
" call once to set the default
SetIndent

" Which EOL conventions to detect
set fileformats=unix,dos,mac

set backspace=indent,eol,start
"set cpoptions+=$ " mark changed area
set whichwrap=b,s,h,l,<,>,[,]
" <Del> works, I don't see why <BS> shouldn't
map <bs> X

nmap <leader>qf :botright copen<cr>
nmap <leader>spell :setlocal spell!<cr>

" Sudo write that file!
command! SudoWrite write !sudo tee % > /dev/null
cmap w!! :SudoWrite

" Invisible characters: shortcut to rapidly toggle
nmap <leader>i :set list!<cr>
set listchars=tab:▸\ ,eol:\ ,trail:·,nbsp:_,extends:→,precedes:→

" Unhighlight search results in normal mode (and still redraw screen)
nnoremap <silent> <C-l> :silent nohlsearch<cr><C-l>

" Opening files relative to current one, e.g. :e %/bar.txt
cnoremap %% <C-r>=expand('%:p:.:h') . '/' <Enter>

" mark character exceeding the 80 limit as errors
" match Error /\%>80v/

" Use Ctrl-[ and Ctrl-] to navigate tags
"inoremap <C-]> <ESC><C-]>i
"inoremap <C-[> <ESC><C-t>i
"noremap  <M-[> <ESC><C-t>
"inoremap <D-.> <ESC>:

" arrow mapping ===============================================================
" arrows shouldn't jump over wrapped lines
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <buffer> <silent> <Home> g<Home>
nnoremap <buffer> <silent> <End>  g<End>

vnoremap <Down> gj
vnoremap <Up> gk
vnoremap <buffer> <silent> <Home> g<Home>
vnoremap <buffer> <silent> <End>  g<End>

inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End> <C-o>g<End>

"" key mappings ===============================================================
"command Q q " Bind :Q to :q

" directly jump to edit mode from visual mode
vmap i <ESC>i
vmap o <ESC>o
vmap a <ESC>a
vmap A <ESC>A
" eclipse style autocompletion
imap <C-SPACE> <C-p>
map <C-SPACE> i<C-p>

" enable emacs-style line navigation and editing
map  <C-e> <ESC>$
imap <C-e> <ESC>A
map  <C-a> <ESC>^
imap <C-a> <ESC>^i
imap <C-k> <ESC>Di
map  <C-k> <ESC>D

" directly jump into visual block mode from insert mode
imap <C-v> <ESC><C-v>

"AlignCtrl l:
vmap <C-A> :Align=<CR> 

" Remap line-exchange commands to match TextMate's shortcuts. Thanks to vimcasts.org for this :)
" Requires vim-unimpaired
nmap <C-up> [e
nmap <C-down> ]e
vmap <C-up> [egv
vmap <C-down> ]egv
vnoremap < <gv
vnoremap > >gv

" Open line above (ctrl-shift-o much easier than ctrl-o shift-O)
"imap <C-Enter> <C-o>o
"nmap <C-Enter> o
"imap <C-S-Enter> <C-o>O
"nmap <C-S-Enter> O

"make <space> and <enter> work directly from normal mode
nnoremap <space> i<space><esc>
nnoremap <enter> i<enter><esc>

" Mac-like tab navigation
map <D-S-]> gt
map <D-S-[> gT

" Show highlighting group for current word
function! <SID>SyntaxStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
nmap <leader>P :call <SID>SyntaxStack()<Enter>

" Create directories when saving
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p %:h" | redraw! | endif
augroup END

" Remove GUI menu and toolbar
set guioptions-=T
"set guioptions-=m
set guifont=Consolas:h11,Menlo:h11

set mouse=a

" Color scheme and tweaks
set background=dark
"let g:solarized_menu=0
colorscheme solarized
highlight Cursor guibg=#ecff55 " was #eabf50
highlight NonText term=NONE ctermfg=2 ctermbg=NONE guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
highlight clear Conceal
highlight default link Conceal Statement
highlight default link qfSeparator Conceal


" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

if has("gui_macvim")
   macmenu &File.New\ Tab key=<nop>
   map <D-t> <Plug>PeepOpen
end

" vim: set ts=4 sw=4 ts=4 :
