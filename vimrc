" list of dsiabled plugins
let g:pathogen_disabled = ['syntastic']
execute pathogen#infect()
filetype plugin indent on

" note: set TERM to screen-256color when using tmux
" and start tmux with -2 option so colors are displayed properly.
se t_Co=256

" *** general settings
let mapleader=","               " change map leader to , key
nnoremap - :

" mark colum 79
highlight MyLineTooLongMarker ctermbg=magenta
set colorcolumn=79

" tab settings: spaces as tabs, tab width=4
se tabstop=4
se shiftwidth=4
se expandtab
se softtabstop=0
se smarttab

se pastetoggle=<F2>
se number
se so=2     " scroll offset
se hidden
se backspace=indent,eol,start
se autoindent

" file search
se path+=**

" searching
se smartcase    " ignore case when lowercase, case-sensitve otherwise
se hlsearch
se incsearch

se history=1000
se undolevels=1000

se backup
se noswapfile

" set whitspace characters to show with 'set list' command
" <leader>w to toggle visibility
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
nnoremap <leader>w :set list!<CR>   

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" CTRL-T is next tab
"noremap <C-T> gt

set laststatus=2
set wildmenu

" buffer navigation
nnoremap <F12>   :bn<CR>      " next buffer
nnoremap <F11>   :bp<CR>      " previous buffer
nnoremap <F5>    :buffers<CR>:buffer<Space>

" navigation in location list
nnoremap <leader>n :lnext<CR>
nnoremap <leader>m :lprevious<CR>
nnoremap <leader>a :lclose<CR>

" auto close quickfix window if no other windows are opened
aug QFClose
  au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" quickly edit/reload vimrc file
nmap <silent> <leader>ev :e  $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

map <silent> <F3> :Lexplore<CR>

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" activate matchit plugin
source $VIMRUNTIME/macros/matchit.vim

" *** syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" *** solarized
let g:solarized_termcolors=256
syntax on
colorscheme solarized
se background=dark " order has an effect on colors - looks better for me

" *** airline
se laststatus=2
let g:airline_theme='dark'

" *** vim-go
" auto safe on :GoRun etc
"se autowrite
let g:go_metalinter_autosave = 0    " don't run meta linter on save
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'golint']
"let g:go_list_type = "quickfix"
autocmd FileType go nnoremap <leader>f  :GoFmt<CR>
autocmd FileType go nnoremap <leader>r  :w<CR>:GoRun<CR>
autocmd FileType go nnoremap <leader>t  :w<CR>:GoTest<CR>
autocmd FileType go nnoremap <leader>v  :GoVet<CR>
autocmd FileType go nnoremap <leader>l  :GoAlternate<CR>
autocmd FileType go nnoremap <leader>b  :w<CR>:GoBuild<CR>
autocmd FileType go nnoremap <leader>i  :w<CR>:GoInstall<CR>

" *** CtrlP
nnoremap <leader>. :CtrlPTag<cr>


" *** vim-markdown
let g:vim_markdown_folding_disabled = 1

