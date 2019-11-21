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
set shiftwidth=4

map <C-n> :NERDTreeToggle<CR>
map <C-o> :NERDTreeToggle %<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd CursorHold * update

let g:signify_realtime = 1
let g:auto_save = 2
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:auto_save_in_insert_mode = 0
let g:deoplete#enable_at_startup = 1
let g:airline_powerline_fonts = 1
let g:ctrlp_custom_ignore = 'node_modules\|target/classes'
"inoremap <C-x> <C-x><C-o>

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree' "nerdtree vim file manager
Plug 'mhinz/vim-signify' "show git diff in the editor
"Plug 'sheerun/vim-polyglot'
Plug 'valloric/matchtagalways' "shows closing tags for the one that the cursor is on
Plug 'ap/vim-css-color' "display colors in css files
Plug 'kshenoy/vim-signature' "marks (like bookmarks)
Plug 'nathanaelkane/vim-indent-guides' "indent lines
Plug 'tpope/vim-surround' "add closing parentheses and quotes and all the other kind of stuff
Plug 'Xuyuanp/nerdtree-git-plugin' "show git files status in nerdtree
Plug 'dyng/ctrlsf.vim' "global project search
Plug 'zefei/vim-wintabs' "upper tabs bar
Plug 'zefei/vim-wintabs-powerline' "powerline support of upper tabs bar
"Plug 'powerline/powerline'
Plug 'tomtom/tcomment_vim'
Plug 'xolox/vim-misc' "some stuff needed for sessions
Plug 'xolox/vim-session' "advanced session manager
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'artur-shaik/vim-javacomplete2'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

nmap <C-f> <Plug>CtrlSFPrompt
vmap <C-f> <Plug>CtrlSFVwordPath

map <C-H> <Plug>(wintabs_previous)
map <C-L> <Plug>(wintabs_next)
map <C-T>c <Plug>(wintabs_close)
map <C-T>u <Plug>(wintabs_undo)
map <C-T>o <Plug>(wintabs_only)
map <C-W>c <Plug>(wintabs_close_window)
map <C-W>o <Plug>(wintabs_only_window)

nnoremap <F2> :execute 'SaveSession! ' . substitute(getcwd(), '^.*/', '', '')<CR>
nnoremap <F3> :execute 'OpenSession! ' . substitute(getcwd(), '^.*/', '', '')<CR>

