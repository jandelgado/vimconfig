" one-time " initialize vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" utf-8 byte sequence
set encoding=utf-8

" load plugins
call plug#begin()
"Plug 'elixir-editors/vim-elixir'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go',
"Plug 'sebdah/vim-delve'
Plug 'janko/vim-test',
"Plug 'pangloss/vim-javascript'
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

"Plug 'reinh/vim-makegreen',
Plug 'mgedmin/coverage-highlight.vim',
Plug 'scrooloose/nerdcommenter',
Plug 'dense-analysis/ale',
Plug 'airblade/vim-gitgutter',
Plug 'tpope/vim-fugitive',
Plug 'tpope/vim-abolish',
Plug 'tpope/vim-surround',
Plug 'tpope/vim-dispatch',
Plug 'tpope/vim-vinegar'
Plug 'preservim/vim-markdown',
Plug 'mzlogin/vim-markdown-toc',
Plug 'godlygeek/tabular',
Plug 'itchyny/lightline.vim',
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
Plug 'Chiel92/vim-autoformat',
Plug 'sbdchd/neoformat'
Plug 'morhetz/gruvbox',
Plug 'majutsushi/tagbar'
Plug 'rust-lang/rust.vim'
"Plug 'vimwiki/vimwiki'
"Plug 'michal-h21/vim-zettel'
"Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'josa42/coc-go'
call plug#end()

filetype plugin indent on

" note: set TERM to screen-256color when using tmux
" and start tmux with -2 option so colors are displayed properly.
se t_Co=256

" *** general settings
se mouse=
se tags=./tags;,tags;
let mapleader=","               " change map leader to , key

" mark colum 79
highlight MyLineTooLongMarker ctermbg=magenta
set colorcolumn=79

" tab settings: spaces as tabs, tab width=4
se tabstop=4
se shiftwidth=4
se expandtab
se softtabstop=0
"se smarttab
"se textwidth=79
autocmd FileType make setlocal noexpandtab

" python settings
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \  softtabstop=4
    \  shiftwidth=4
    \  expandtab
    \  autoindent
    \  fileformat=unix
    \  encoding=utf-8
    \  foldmethod=indent
    \  foldnestmax=2
" vim-autoformat
"let g:formatters_python = ['yapf']
let g:formatters_python = ['black']

se pastetoggle=<F2>
se number relativenumber
" toggle line numbers on/off
nnoremap <leader>n :se number! relativenumber!<CR>   

se so=2     " scroll offset
se hidden
se backspace=indent,eol,start
se autoindent

" Enable folding, use <space> to fold/unfold
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

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

" keep visual selection on shift operations
vnoremap < <gv
vnoremap > >gv

" set whitspace characters to show with 'set list' command
" <leader>w to toggle visibility
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
nnoremap <leader>w :set list!<CR>   

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" diff buffer with original file
" command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" jump to tag
" nnoremap ü <C-]>
" nnoremap Ü <C-O>
nnoremap ü :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>
nnoremap Ü <C-O>

" CTRL-T is next tab
"noremap <C-T> gt

set laststatus=2
set wildmenu

" buffer navigation
nnoremap <leader>n   :bn<CR>      " next buffer
nnoremap <leader>p   :bp<CR>      " previous buffer
nnoremap <leader>b    :Buffers<CR>

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
" leader+h: history
nmap <silent> <leader>h :His<CR>

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" activate matchit plugin
source $VIMRUNTIME/macros/matchit.vim   

" *** custom commands  

" trim trailing witespace in current buffer.
command TrimWS :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>

" *** solarized
"let g:solarized_termcolors=256
"colorscheme solarized

se background=dark " order has an effect on colors - looks better for me

" *** gruvbox
colorscheme gruvbox
let g:gruvbox_italic=1
"let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" *** vim-go
" auto safe on :GoRun etc
"se autowrite
let g:go_metalinter_autosave = 0    " don't run meta linter on save
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'golint']
"let g:go_list_type = "quickfix"
"let g:go_fmt_command = "goimports"
let g:go_fmt_command = "gofmt"
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor
autocmd FileType go nnoremap <leader>f  :GoFmt<CR>
autocmd FileType go nnoremap <leader>r  :w<CR>:GoRun<CR>
autocmd FileType go nnoremap <leader>t  :w<CR>:GoTest<CR>
autocmd FileType go nnoremap <leader>v  :GoVet<CR>
autocmd FileType go nnoremap <leader>l  :GoAlternate<CR>
"autocmd FileType go nnoremap <leader>b  :w<CR>:GoBuild<CR>
"autocmd FileType go nnoremap <leader>i  :w<CR>:GoInstall<CR>
" go auto completion. use with ^X + ^O
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" *** vim-markdown
let g:vim_markdown_folding_disabled = 1
autocmd FileType markdown set conceallevel=2
let g:vim_markdown_conceal_code_blocks=0
let g:vim_markdown_follow_anchor=1
let g:vim_markdown_auto_insert_bullets=0
let g:vim_markdown_strikethrough=1
let g:vim_markdown_follow_anchor = 1

" format lists correctly with `gq`
" see https://github.com/preservim/vim-markdown/issues/232
autocmd FileType markdown
    \ set formatoptions-=q |
    \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+


" *** nerd commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" used to debug vim synax files: place cursor on word and press F10
"map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

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
imap <c-x><c-f> <plug>(fzf-complete-path)
"inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"imap <c-x><c-l> <plug>(fzf-complete-line)
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
"
set rtp+=~/.fzf

" *** tagbar
nmap <F8> :TagbarToggle<CR>

" *** vim-test
" use vim-dispatch as execution environment
let test#strategy = 'dispatch'
"let test#strategy = 'makegreen'
let test#python#runner = 'pytest'

" *** coverage-highlight.vim (python)
let g:coverage_script = 'coverage'

autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" add yaml stuff
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

syntax on
syntax sync minlines=5000
let c_minlines = 5000

" *** vim-editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" *** ale fixers. Run with :ALEFix

" disable ale LSP functionality because we use coc-vim
let g:ale_disable_lsp = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort'],
\   'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines']
\}

let g:ale_linters = {
\  'rust': ['analyzer'],
\}

" let ale parse makefile for compiler setting
let g:ale_c_parse_makefile = 1
" As-you-type autocomplete
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

" treat ino, pde as cpp
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" *** nerdtree
map - :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" *** spell checking
se spelllang=de_de
hi clear SpellBad
hi SpellBad cterm=underline
set visualbell

" *** https://github.com/justinmk/vim-sneak
let g:sneak#label = 1

" *** Rust
" https://blog.logrocket.com/configuring-vim-rust-development/
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

source ~/.vim/vim-coc

