"""""""""""""
"  plugins  "
"""""""""""""

call plug#begin('~/.vim/plugins')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree' " nerdtree file manager
Plug 'mhinz/vim-signify' " show git diff in the editor
"Plug 'sheerun/vim-polyglot' " syntax highlighting for omnisharp
Plug 'valloric/matchtagalways' " shows closing tags for the one that the cursor is on
Plug 'ap/vim-css-color' " display colors in css files
Plug 'kshenoy/vim-signature' " marks (like bookmarks)
Plug 'Yggdroot/indentLine' " indent lines
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
		\'do': ':CocInstall coc-java coc-json coc-css coc-html coc-vetur coc-sh coc-angular coc-tsserver coc-tslint-plugin coc-pairs coc-snippets coc-vimlsp coc-xml coc-omnisharp coc-ultisnips coc-neosnippet'
	\} " intellisense and code-completion engine
Plug 'rrethy/vim-illuminate' " highlights for things with the same name
" Plug 'mhinz/vim-startify' " start screen when folder opened and no file was selected yet (ex: you did `vim` and want to select a project you want to work on) TODO: integrate me!
" Plug 'tpope/vim-abolish' " smart words transformation (camelize, pythonize, normalize, etc...) TODO: integrate me!
Plug 'tpope/vim-sleuth' " adaptive indentation for different files
Plug 'OrangeT/vim-csharp' " C# advanced syntax highlighting and Razor support
call plug#end()

