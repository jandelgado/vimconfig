" list of disabled plugins
let g:pathogen_disabled = ['vim-airline']
execute pathogen#infect()
filetype plugin indent on

" note: set TERM to screen-256color when using tmux
" and start tmux with -2 option so colors are displayed properly.
se t_Co=256

" *** general settings
se mouse=                       " turn off mouse
se tags=tags;/
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
autocmd FileType make setlocal noexpandtab

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

" jump to tag
nnoremap ü <C-]>
nnoremap Ü <C-T>

" CTRL-T is next tab
"noremap <C-T> gt

set laststatus=2
set wildmenu

" buffer navigation
nnoremap <F12>   :bn<CR>      " next buffer
nnoremap <F11>   :bp<CR>      " previous buffer
nnoremap <F5>    :buffers<CR>:buffer<Space>

" navigation in quickfix list
nnoremap ö :cnext<CR>
nnoremap Ö :cprevious<CR>
"nnoremap <leader>a :cclose<CR>

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

" *** solarized
let g:solarized_termcolors=256
syntax on
colorscheme solarized
"se background=dark " order has an effect on colors - looks better for me

" *** vim-go
" auto safe on :GoRun etc
"se autowrite
let g:go_metalinter_autosave = 0    " don't run meta linter on save
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'golint']
"let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
autocmd FileType go nnoremap <leader>f  :GoFmt<CR>
autocmd FileType go nnoremap <leader>r  :w<CR>:GoRun<CR>
autocmd FileType go nnoremap <leader>t  :w<CR>:GoTest<CR>
autocmd FileType go nnoremap <leader>v  :GoVet<CR>
autocmd FileType go nnoremap <leader>l  :GoAlternate<CR>
autocmd FileType go nnoremap <leader>b  :w<CR>:GoBuild<CR>
autocmd FileType go nnoremap <leader>i  :w<CR>:GoInstall<CR>

" *** CtrlP
" nnoremap <leader>. :CtrlPTag<cr>

" *** vim-markdown
let g:vim_markdown_folding_disabled = 1

" *** nerd commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" used to debug vim synax files: place cursor on word and press F10
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" *** lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
se laststatus=2   " always show status

" *** fzf
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"imap <c-x><c-l> <plug>(fzf-complete-line)
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
"
set rtp+=~/.fzf

" *** fzf
noremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
