" list of dsiabled plugins
let g:pathogen_disabled = ['ale', 'syntastic', 'Xvim-colors-solarized']
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

se ts=4
se shiftwidth=4
se expandtab
se pastetoggle=<F2>
se nobackup
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

se nobackup
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

" navigation in quicklist: ALT+N, ALT+M
map <leader>n :lnext<CR>
map <leader>m :lprevious<CR>
map <leader>a :lclose<CR>

" auto close quickfix window if no other windows are opened
aug QFClose
  au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" quickly edit/reload vimrc file
nmap <silent> <leader>ev :e  $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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

let g:syntastic_python_checkers = ['pylint']
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
let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']
"let g:go_list_type = "quickfix"
autocmd FileType go nnoremap <leader>f  :GoFmt<CR>
autocmd FileType go nnoremap <leader>r  :w<CR>:GoRun<CR>
autocmd FileType go nnoremap <leader>t  :w<CR>:GoTest<CR>
autocmd FileType go nnoremap <leader>v  :GoVet<CR>
autocmd FileType go nnoremap <leader>l  :GoAlternate<CR>
autocmd FileType go nnoremap <leader>b  :w<CR>:GoBuild<CR>

" *** CtrlP
nnoremap <leader>. :CtrlPTag<cr>

" *** nerd tree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

