scriptencoding utf-8
set encoding=utf-8
set number
set tabstop=4
set noshowmode
set listchars=tab:▸␣,space:·,eol:↩
set list
set ttimeoutlen=0
set shiftwidth=4
set termguicolors
set cursorline
set wildmenu
set showmatch
set incsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
colorscheme space-vim-dark

" NERDTree automation stuff (for it to open only when necessary)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd CursorHold * update

" This sets the Airline theme to violet to fit the space-vim-theme
autocmd VimEnter * :execute 'AirlineTheme violet'

" Executes current project session opening on vim enter and initialises an
" empty session if there is nothing yet. It also saves your session when you
" exit vim if you uncomment the secont line.
" Note that you must launch vim without params in the project folder for my
" config (and, in particular, this functionality) to work properly.
autocmd VimEnter * if argc() == 0 | :execute 'OpenSession! ' . substitute(getcwd(), '^.*/', '', '') | endif
"autocmd VimLeave * if argc() == 0 | :execute 'SaveSession! ' . substitute(getcwd(), '^.*/', '', '') | endif

" Update session file when a file was opened from nerdtree.
autocmd BufReadPost * if argc() == 0 | call feedkeys("\<F2>") | endif

" Add folding to xml documents
autocmd FileType xml setlocal foldmethod=syntax

" variables
let g:signify_realtime = 1
let g:auto_save = 2
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:auto_save_in_insert_mode = 0
let g:airline_powerline_fonts = 1
let g:ctrlp_custom_ignore = 'node_modules\|target/classes'
let g:session_autosave = 'no'
let g:xml_syntax_folding=1
let g:deoplete#enable_at_startup = 1
let g:ctrlsf_position='bottom'
"inoremap <C-x> <C-x><C-o>

" plugins
" TODO: change call plug#begin() to call plug#begin('~/.vim/plugins')
call plug#begin('~/.vim/plugins')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree' " nerdtree file manager
Plug 'mhinz/vim-signify' " show git diff in the editor
"Plug 'sheerun/vim-polyglot'
Plug 'valloric/matchtagalways' " shows closing tags for the one that the cursor is on
Plug 'ap/vim-css-color' " display colors in css files
Plug 'kshenoy/vim-signature' " marks (like bookmarks)
Plug 'nathanaelkane/vim-indent-guides' " indent lines
Plug 'tpope/vim-surround' " add closing parentheses and quotes and all the other kind of stuff
Plug 'Xuyuanp/nerdtree-git-plugin' " show git files status in nerdtree
Plug 'dyng/ctrlsf.vim' " global project search
Plug 'zefei/vim-wintabs' " upper tabs bar
Plug 'zefei/vim-wintabs-powerline' " powerline support of upper tabs bar
Plug 'tomtom/tcomment_vim' " commenting plugin
Plug 'xolox/vim-misc' " some stuff needed for sessions
Plug 'xolox/vim-session' " advanced session manager
Plug 'vim-airline/vim-airline' " bottom statusline
Plug 'vim-airline/vim-airline-themes' " themes for bottom statusline
Plug 'Shougo/deoplete.nvim' " autocompletion
Plug 'roxma/nvim-yarp' " dependency for autocompletion
Plug 'roxma/vim-hug-neovim-rpc' " dependency for autocompletion
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
call plug#end()

" language servers
" call plug#begin('~/.vim/servers')
" Plug 'georgewfraser/java-language-server', {'dir': '~/.vim/servers/java-language-server', 'do': './scripts/link_linux.sh'}
" Plug 'sourcegraph/javascript-typescript-langserver', {'dir': '~/.vim/servers/javascript-typescript-langserver', 'do': 'npm install;npm run build'}
" call plug#end()

" needed for Ctrl+x, Ctrl+c, Ctrl+v to work seamlessly in vim
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Search in project using Ctrl+f in normal mode or select text using visual mode and press Ctrl+f to search for it
nmap <C-f> <Plug>CtrlSFPrompt
vmap <C-f> <Plug>CtrlSFVwordPath

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Switch to the next tab using Ctrl+l and to the previous using Ctrl+h. Press
" Ctrl+t and then c to close currently opened tab, Ctrl+t and then u to undo
" the tab action.
map <C-H> <Plug>(wintabs_previous)
map <C-L> <Plug>(wintabs_next)
map <C-T>c <Plug>(wintabs_close)
map <C-T>u <Plug>(wintabs_undo)
map <C-T>o <Plug>(wintabs_only)
map <C-W>c <Plug>(wintabs_close_window)
map <C-W>o <Plug>(wintabs_only_window)

" Press F2 to save session and F3 to open the session file for current
" project. Session file name is determined by a project folder name.
nnoremap <F2> :execute 'SaveSession! ' . substitute(getcwd(), '^.*/', '', '')<CR>
nnoremap <F3> :execute 'OpenSession! ' . substitute(getcwd(), '^.*/', '', '')<CR>

" NERDTree add a bookmark by pressing Ctrl+o and then a and typing the name of the
" bookmark. Ctrl+o and then o and then a bookmark name to open that bookmark.
" And Ctrl+o and then c, providing a name to clear the bookmark with that name.
map <C-o>a :Bookmark 
map <C-o>o :OpenBookmark 
map <C-o>c :ClearBookmarks 

" A workaround for vim-session to show the colorscheme properly.
if argc() == 0 | call feedkeys("\<F3>") | endif



" This allows LanguageClient to perform operations of modifying multiple buffers like rename.
" TODO: move this set to the top of the script, where it should be
set hidden

" This sets language servers to use in intellisense for every language I need.
" For this to work, you need to install language servers on your machine for
" every language you want intellisense to work.
" bash: `npm i -g bash-language-server`
" java: 
" js and typescript: 
" jsx: 
" vimscript: 
" apache camel: 
" xml: 
" python: 
" vue: 
" TODO: move this let to the other variables
let g:LanguageClient_serverCommands = {
	\ 'sh': ['bash-language-server', 'start'],
	\ 'js': ['tcp://127.0.0.1:2089']
	\ }

" Context menu that allows to do some of the intellisense (smart) operations.
nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" You can map any shortcut to any feature from the LanguageClient_contextMenu.
" Possible options:
" LanguageClient#textDocument_documentSymbol()
" LanguageClient#textDocument_foldingRange()
" LanguageClient#textDocument_documentLink()
" LanguageClient#textDocument_definition() " go to definition
" LanguageClient#textDocument_declaration()
" LanguageClient#textDocument_typeDefinition()
" LanguageClient#textDocument_hover()
" LanguageClient#textDocument_references() " find all references
" LanguageClient#textDocument_implementation() " find implementation

