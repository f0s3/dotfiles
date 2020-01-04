scriptencoding utf-8

""""""""""""""
"  defaults  "
""""""""""""""

set encoding=utf-8
set number
set tabstop=4
set noshowmode
set listchars=tab:▸‒,space:·,eol:↩
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
set hidden

colorscheme space-vim-dark

""""""""""""""""""
"  autocommands  "
""""""""""""""""""

" NERDTree automation stuff (for it to open only when necessary)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd CursorHold * update

" This sets the Airline theme to violet to fit the space-vim-theme
autocmd VimEnter * :execute 'AirlineTheme violet'

" autocmd VimEnter * :execute 'tabr'

" Executes current project session opening on vim enter and initialises an
" empty session if there is nothing yet. It also saves your session when you
" exit vim if you uncomment the secont line.
" Note that you must launch vim without params in the project folder for my
" config (and, in particular, this functionality) to work properly
autocmd VimEnter * if argc() == 0 | :execute 'OpenSession! ' . substitute(getcwd(), '^.*/', '', '') | endif
"autocmd VimLeave * if argc() == 0 | :execute 'SaveSession! ' . substitute(getcwd(), '^.*/', '', '') | endif

" Update session file when a file was opened from nerdtree.
autocmd BufReadPost * if argc() == 0 | call feedkeys("\<F3>") | endif

" Add folding to xml documents
autocmd FileType xml setlocal foldmethod=syntax

"""""""""""""""
"  variables  "
"""""""""""""""

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
let g:ctrlsf_position='bottom'
" This sets language servers to use in intellisense for every language I need.
" TODO: apache camel
" TODO: python
let g:asmsyntax = 'nasm' " sets correct syntax for .asm files
"inoremap <C-x> <C-x><C-o>

"""""""""""""
"  plugins  "
"""""""""""""

call plug#begin('~/.vim/plugins')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree' " nerdtree file manager
Plug 'mhinz/vim-signify' " show git diff in the editor
"Plug 'sheerun/vim-polyglot'
Plug 'valloric/matchtagalways' " shows closing tags for the one that the cursor is on
Plug 'ap/vim-css-color' " display colors in css files
Plug 'kshenoy/vim-signature' " marks (like bookmarks)
Plug 'nathanaelkane/vim-indent-guides' " indent lines
Plug 'Xuyuanp/nerdtree-git-plugin' " show git files status in nerdtree
Plug 'dyng/ctrlsf.vim' " global project search
Plug 'zefei/vim-wintabs' " upper tabs bar
Plug 'zefei/vim-wintabs-powerline' " powerline support of upper tabs bar
Plug 'tomtom/tcomment_vim' " commenting plugin
Plug 'xolox/vim-misc' " some stuff needed for sessions
Plug 'xolox/vim-session' " advanced session manager
Plug 'vim-airline/vim-airline' " bottom statusline
Plug 'vim-airline/vim-airline-themes' " themes for bottom statusline
Plug 'neoclide/coc.nvim', {
		\'branch': 'release',
		\'do': ':CocInstall coc-java coc-json coc-css coc-html coc-vetur coc-sh coc-angular coc-tsserver coc-tslint-plugin coc-pairs coc-snippets coc-vimlsp coc-xml'
	\} " intellisense and code-completion engine
Plug 'rrethy/vim-illuminate' " highlights for things with the same name
" Plug 'mhinz/vim-startify' " start screen when folder opened and no file was selected yet (ex: you did `vim` and want to select a project you want to work on) TODO: integrate me!
" Plug 'tpope/vim-abolish' " smart words transformation (camelize, pythonize, normalize, etc...) TODO: integrate me!

call plug#end()

""""""""""""""
"  mappings  "
""""""""""""""

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
map <C-t>c <Plug>(wintabs_close)
map <C-T>u <Plug>(wintabs_undo)
map <C-T>o <Plug>(wintabs_only)
map <C-W>c <Plug>(wintabs_close_window)
map <C-W>o <Plug>(wintabs_only_window)

" Press F2 to save session and F3 to open the session file for current
" project. Session file name is determined by a project folder name.
nnoremap <F3> :execute 'SaveSession! ' . substitute(getcwd(), '^.*/', '', '')<CR>
nnoremap <F4> :execute 'OpenSession! ' . substitute(getcwd(), '^.*/', '', '')<CR>

" NERDTree add a bookmark by pressing Ctrl+o and then a and typing the name of the
" bookmark. Ctrl+o and then o and then a bookmark name to open that bookmark.
" And Ctrl+o and then c, providing a name to clear the bookmark with that name.
map <C-o>a :Bookmark 
map <C-o>o :OpenBookmark 
map <C-o>c :ClearBookmarks 

" nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> <leader>rc :call LanguageClient#textDocument_rename({'newName': Abolish.camelcase(expand('<cword>'))})<CR>
" nnoremap <silent> <leader>rs :call LanguageClient#textDocument_rename({'newName': Abolish.snakecase(expand('<cword>'))})<CR>
" nnoremap <silent> <leader>ru :call LanguageClient#textDocument_rename({'newName': Abolish.uppercase(expand('<cword>'))})<CR>

""""""""""""""""""""
"  coc extensions  "
""""""""""""""""""""
" :CocInstall coc-java coc-json coc-css coc-html coc-vetur coc-sh coc-angular coc-tsserver coc-tslint-plugin coc-pairs coc-snippets

"""""""""""""""""""""""""""
"  workarounds and fixes  "
"""""""""""""""""""""""""""

" A workaround for vim-session to show the colorscheme properly
if argc() == 0 | call feedkeys("\<F4>") | endif

" what IDEA does:
" [editor] nice syntax highlighting for every type of file
" [editor] vcs (git) integration
" [editor] go through functions
" [editor] search in current file (allows regex to be used, case-(in)sensitive search)
" [editor] unused imports, missing imports fix
" [editor] highlight syntax errors, non-runtime errors
" [editor] smart autocompletion [done]
" [editor] go to definition
" [editor] show usages
" [editor] code folding
" [editor] default settings for different file extensions
" [editor] underline(underwave) typos, warnings, errors(syntax errors, non-runtime errors)
" [editor] autoclose brackets, parentheses, and place cursor in them in insert mode [done]
" [file explorer] with all file operations (create new +types, rename/move file, delete, git integration, module recognition)
" [search] in project (allows regex to be used, case-(in)sensitive search)
" [search] for anything in project tree
" [search] and replace in file (allows regex to be used, case-(in)sensitive search)
" [miscellaneous] clipboard buffer
" [miscellaneous] shared clipboard for all searches and the editor

