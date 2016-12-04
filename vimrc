execute pathogen#infect()
filetype plugin indent on

" note: set TERM to screen-256color when using tmux
" and start tmux with -2 option so colors are displayed properly.
se t_Co=256

" *** general settings
let mapleader=","               " change map leader to , key

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
se hlsearch
se incsearch

" set whitspace characters to show with 'set list' command
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" CTRL-T is next tab
"noremap <C-T> gt

set laststatus=2
set wildmenu

" navigation in quicklist
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

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
"se background=dark
colorscheme solarized
" order has an effect on colors - looks better for me
se background=dark

" *** airline
se laststatus=2
let g:airline_theme='dark'

" *** vim-go
" auto safe on :GoRun etc
"se autowrite
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_list_type = "quickfix"

