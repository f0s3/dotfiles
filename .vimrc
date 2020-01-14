scriptencoding utf-8

source ~/.vim/configurations/settings.vim

colorscheme space-vim-dark

source ~/.vim/configurations/autocommands.vim
source ~/.vim/configurations/variables.vim
source ~/.vim/configurations/plugins.vim
source ~/.vim/configurations/mappings.vim
source ~/.vim/configurations/functions.vim

" A workaround for vim-session to show the colorscheme properly
if argc() == 0 | call feedkeys("\<F4>") | endif

" what IDE does:
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

