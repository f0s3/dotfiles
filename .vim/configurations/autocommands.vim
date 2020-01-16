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

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guifg=#606060
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guifg=#708070

