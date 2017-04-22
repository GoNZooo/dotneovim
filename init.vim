call plug#begin('~/.config/nvim/plugged')

" Plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  " use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
Plug 'neomake/neomake'
  " Run Neomake when I save any buffer
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END
  " Don't tell me to use smartquotes in markdown ok?
  let g:neomake_markdown_enabled_makers = []
    " Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
  let g:neomake_elixir_enabled_makers = ['mix', 'mycredo']
  function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'      " Refactoring opportunities
      let l:type = 'W'
    elseif a:entry.type ==# 'D'  " Software design suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'W'  " Warnings
      let l:type = 'W'
    elseif a:entry.type ==# 'R'  " Readability suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'C'  " Convention violation
      let l:type = 'W'
    else
      let l:type = 'M'           " Everything else is a message
    endif
    let a:entry.type = l:type
  endfunction

  let g:neomake_elixir_mycredo_maker = {
        \ 'exe': 'mix',
        \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
        \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
        \ 'postprocess': function('NeomakeCredoErrorType')
        \ }

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '~/.tags_cache'

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag -S --nogroup --column'

Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'kien/ctrlp.vim'
" Borrowed from @skwp
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

let g:ctrlp_working_path_mode = 0

Plug 'slashmili/alchemist.vim'

Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#displayed_head_limit = 17
set laststatus=2

" Dlang
Plug 'landaire/deoplete-d'

" Go
Plug 'fatih/vim-go'
au BufWritePost *.go GoImports
let g:go_auto_type_info = 1

" Colorscheme
Plug 'morhetz/gruvbox'
call plug#end()

set mouse=""

" Colorscheme
colorscheme gruvbox
set background=dark
syntax enable
filetype plugin indent on

" Sane tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

" SPACE is leader
let g:mapleader=' '
" , is localleader
let g:maplocalleader=','
" Tilde is ESC in insert mode
inoremap § <Esc>

set number
set relativenumber
set encoding=utf-8

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase
" Ignore case when searching lowercase
set smartcase
" Stop highlighting on Enter
map <CR> :noh<CR>

" Set highlight for column 81
set colorcolumn=81

" highlight cursor position
set cursorline
" set cursorcolumn

" Make it so that we always go to the last position we were at
" in the buffer when we were last in it.
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  endif

" Expansions
"
" %% expands to current path, all thanks to Gary Bernhardt
" See: http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:p:h'))."/"<CR>
" %rc expands to vimrc
cnoremap %rc ~/.config/nvim/init.vim

map <Leader>cd :lcd %:p:h<CR>

" Useful bindings for opening new files
" Current window
map <Leader>ew :e %%
" New tab
map <Leader>et :tabe %%
" New window from vertical split
map <Leader>ev :vsp %%
" New window from horizontal split
map <Leader>es :sp %%

" Ack bind
map <Leader>/ :Ack 
map <Leader>* :Ack <c-r>=expand("<cword>")<cr>

" Map tilde (above TAB) to exit insert mode and visual mode
" For some reason it will actually press enter when trying to exit
" command line mode with tilde, meaning that if you try to cancel a :wq
" or the like it will execute it. Need a workaround...
imap § <Esc>
vmap § <Esc>

" Use sneak
let g:sneak#streak = 1
" <Space><Space> is sneak key (only forwards, backwards still S-s)
nmap <Leader><Leader> <Plug>Sneak_s
xmap <Leader><Leader> <Plug>Sneak_s
omap <Leader><Leader> <Plug>Sneak_s

" Set higher updaterate
set updatetime=50

