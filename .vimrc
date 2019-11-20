scriptencoding utf-8
set encoding=utf-8
set number
set ts=4
set noshowmode
set listchars=tab:▸␣,space:·,eol:↩
set list
syntax on
set ttimeoutlen=0
colorscheme onedark

map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd CursorHold * update
autocmd FileType java setlocal omnifunc=javacomplete#Complete

let g:signify_realtime = 1
let g:auto_save = 2
let g:auto_save_events = ["InsertLeave", "TextChanged"] 
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:auto_save_in_insert_mode = 0
let g:deoplete#enable_at_startup = 1

nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
"inoremap <C-x> <C-x><C-o>

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-signify'
"Plug 'powerline/powerline'
"Plug 'tpope/vim-dadbod'
Plug 'sheerun/vim-polyglot'
Plug 'valloric/matchtagalways'
Plug 'ap/vim-css-color'
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'maralla/completor.vim'
"Plug 'artur-shaik/vim-javacomplete2'
Plug 'dyng/ctrlsf.vim'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'powerline/powerline'
call plug#end()

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

nnoremap <C-f> :CtrlSF 

map <C-H> <Plug>(wintabs_previous)
map <C-L> <Plug>(wintabs_next)
map <C-T>c <Plug>(wintabs_close)
map <C-T>u <Plug>(wintabs_undo)
map <C-T>o <Plug>(wintabs_only)
map <C-W>c <Plug>(wintabs_close_window)
map <C-W>o <Plug>(wintabs_only_window)

