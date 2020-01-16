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

" Show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Seach in file highlighting
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> <leader>rc :call LanguageClient#textDocument_rename({'newName': Abolish.camelcase(expand('<cword>'))})<CR>
" nnoremap <silent> <leader>rs :call LanguageClient#textDocument_rename({'newName': Abolish.snakecase(expand('<cword>'))})<CR>
" nnoremap <silent> <leader>ru :call LanguageClient#textDocument_rename({'newName': Abolish.uppercase(expand('<cword>'))})<CR>

