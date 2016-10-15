execute pathogen#infect()
filetype plugin indent on

se t_Co=256

" solarized
syntax on
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" general setting
se ts=4
se shiftwidth=4
se expandtab
se paste
se nobackup
se number
se so=2     " scroll offset
se hidden

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

