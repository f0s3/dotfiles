let g:coc_global_extensions = [
\ 'coc-java', " Java
\ 'coc-omnisharp', " C#
\ 'coc-angular', " Angular
\ 'coc-vetur', " Vue.js
\ 'coc-tsserver', " JS and TS
\ 'coc-tslint-plugin', " TSLint
\ 'coc-css', " CSS
\ 'coc-html', " HTML
\ 'coc-sh', " ShellScript
\ 'coc-vimlsp', " VimScript
\ 'coc-json', " JSON
\ 'coc-xml', " XML
\ 'coc-sql', " SQL
\ 'coc-pairs', " auto-pairs for () {} [] '' `` \"\"
\ 'coc-snippets', " snippets
\ 'coc-neosnippet', " snippets
\ 'coc-ultisnips', " snippets
\ 'coc-stylelint' " linting for CSS, SCSS, LESS, PostCSS, Vue.js
\ ]

call plug#begin('~/.vim/plugins')
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder
Plug 'scrooloose/nerdtree' " nerdtree file manager
Plug 'mhinz/vim-signify' " show git diff in the editor
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
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install() } } " intellisense and code-completion engine
Plug 'rrethy/vim-illuminate' " highlights for things with the same name
Plug 'tpope/vim-sleuth' " adaptive indentation for different files
Plug 'haya14busa/incsearch.vim' " search highlighting
Plug 'yuezk/vim-js' " js syntax highlighting
Plug 'maxmellon/vim-jsx-pretty' " jsx support
Plug 'OrangeT/vim-csharp' " C# errors and syntax highlighting support
call plug#end()


" \'do': ':CocInstall coc-java coc-json coc-css coc-html coc-vetur coc-sh coc-angular coc-tsserver coc-tslint-plugin coc-pairs coc-snippets coc-vimlsp coc-xml coc-omnisharp coc-ultisnips coc-neosnippet coc-stylelint coc-sql'


