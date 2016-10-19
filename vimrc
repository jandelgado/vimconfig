execute pathogen#infect()
filetype plugin indent on

se t_Co=256

" solarized
syntax on
let g:solarized_termcolors=256
colorscheme solarized


" airline
se laststatus=2
let g:airline_theme='dark'

" CTRL-T is next tab
noremap <C-T> gt

" mark columns 80+
let &colorcolumn=join(range(81,999),",")

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']

" general settings
se bg=dark
se ts=4
se shiftwidth=4
se expandtab
se paste
se nobackup
se number
se so=2     " scroll offset
se hidden
se backspace=indent,eol,start
se autoindent

se hlsearch
se incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set wildmenu
