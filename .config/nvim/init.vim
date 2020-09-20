source ~/.config/nvim/configurations/coc.vim

scriptencoding utf-8
set encoding=utf-8
set number
set tabstop=4
set noshowmode
set timeoutlen=1000
set ttimeoutlen=0
set shiftwidth=4
set termguicolors
set cursorline
set wildmenu
set showmatch
set incsearch
set foldenable
set hidden
colorscheme one
set background=dark
set updatetime=100
set scrolloff=8


call plug#begin('~/.config/nvim/plugins')

Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all' } " fzf for os and base for nvim
Plug 'junegunn/fzf.vim' " fzf nvim integration

Plug 'airblade/vim-rooter' " sets project root directory automatically

" top open files tab. C-h - one tab to the left, C-l - one tab to the right, C-t c - close tab, C-u - undo
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline' "powerline theme for top open files tab

Plug 'vim-airline/vim-airline' " botom status line
Plug 'vim-airline/vim-airline-themes' " powerline theme for bottom statusline

Plug 'rakr/vim-one', { 'do': '\cp -r ~/.config/nvim/plugins/colors ~/.config/nvim' } " color scheme

" intellisense engine
" extensions used: coc-vimlsp, coc-tabnine, coc-css, coc-html, coc-tsserver,
" coc-pairs, coc-yaml, coc-vetur, coc-angular, coc-sql, coc-sh, coc-python
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'mhinz/vim-signify' " show changes to the left of the numbers column (in the sign column)
Plug 'tpope/vim-fugitive' " C-g - git status, s - stage, u - unstage, dv - git diff (useful for conflicts resolution)

Plug 'tpope/vim-commentary' " gcc to comment line; visual mode selection and gc to comment range

Plug 'tpope/vim-sleuth' " respect tab settings of current file

Plug 'Chiel92/vim-autoformat' " C-i to indent current file

call plug#end()

" signify
" todo: i don't like how signify behaves, i might change this plugin to
" something other later
let g:signify_sign_add               = '█'
let g:signify_sign_delete            = '█'
let g:signify_sign_delete_first_line = '█'
let g:signify_sign_change            = '█'
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" airline
let g:airline_theme='one'
let g:airline_powerline_fonts = 1

" fzf + ripgrep
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" todo: comment me and look if anything changes (seems like it's default now)
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" top bar
map <C-H> <Plug>(wintabs_previous)
map <C-L> <Plug>(wintabs_next)
map <C-t>c <Plug>(wintabs_close)
map <C-T>u <Plug>(wintabs_undo)
map <C-T>o <Plug>(wintabs_only)
map <C-W>c <Plug>(wintabs_close_window)
map <C-W>o <Plug>(wintabs_only_window)

" fzf + ripgrep
nnoremap <S-f> :Rg<CR>
nnoremap <C-f> :BLines<CR>
map <C-n> :GFiles<CR>

" fugitive - git difftool and git status
nmap <C-Left> :diffget //3<CR>
nmap <C-Right> :diffget //2<CR>
nmap <S-g> :G<CR>

" move visually selected lines up and down while preserving the indentation
xnoremap <C-Up> :m '<-2<CR>gv=gv
xnoremap <C-Down> :m '>+1<CR>gv=gv

" autoformat code
noremap <C-i> :Autoformat<CR>


"Get GFiles
command! -bang -nargs=? -complete=dir GFiles
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

