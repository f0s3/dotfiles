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

let g:signify_realtime = 1
let g:auto_save = 2
let g:airline_theme='bubblegum'
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI"]
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#enabled = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2

nnoremap <C-,> :bprevious<CR>
nnoremap <C-.> :bnext<CR>

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'mhinz/vim-signify'
Plug '907th/vim-auto-save'
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-dadbod'
Plug 'sheerun/vim-polyglot'
Plug 'valloric/matchtagalways'
Plug 'ap/vim-css-color'
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
call plug#end()

