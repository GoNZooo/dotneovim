call plug#begin('~/.config/nvim/plugged')

" Language server
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

let g:LanguageClient_serverCommands = {
  \ 'elixir': ['~/tools/elixir-ls/language_server.sh'],
  \ 'haskell': ['hie-wrapper', '--lsp'],
  \ 'ocaml': ['ocaml-language-server', '--stdio'],
  \ 'reason': ['ocaml-language-server', '--stdio'],
  \ 'json': ['json-languageserver', '--stdio']
  \ }

let g:LanguageClient_hoverPreview = "Always"

" Plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_start_length = 2
  " use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'w0rp/ale'
let g:ale_linters = {'haskell': [], 'elixir': []}

"Plug 'ludovicchabant/vim-gutentags'
"let g:gutentags_cache_dir = '~/.tags_cache'

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag -S --nogroup --column'

"Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'int3/vim-extradite'

Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_buffers_jump = 1

Plug 'powerman/vim-plugin-AnsiEsc'

Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'fileformat', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
set laststatus=2

" File browsing, enhanced netrw
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Jump to last position when reopening files
Plug 'farmergreg/vim-lastplace'

" Colorscheme
Plug 'liuchengxu/space-vim-dark'
Plug 'nanotech/jellybeans.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'fenetikm/falcon'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'iCyMind/NeoSolarized'
Plug 'chriskempson/base16-vim'

Plug 'gerw/vim-HiLinkTrace'

Plug 'elixir-editors/vim-elixir'

" org-mode
Plug 'tpope/vim-speeddating'
Plug 'mattn/calendar-vim'
Plug 'jceb/vim-orgmode'

" creole
Plug 'vim-scripts/vim-creole'
call plug#end()

set mouse=""

" Colorscheme
set background=dark
syntax enable
filetype plugin indent on
set termguicolors
colorscheme gonzcolors

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

" Set highlight for column 100
set colorcolumn=80,100

" highlight cursor position
" set cursorline
" set cursorcolumn
set scrolloff=5

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
map <Leader>/ :Ag 
map <Leader>* :Ag <c-r>=expand("<cword>")<cr>

" Fzf
map <leader>ff :Files<cr>
map <leader>fF :Files!<cr>
map <leader>gf :GFiles<cr>
map <leader>gF :GFiles!<cr>
map <leader>bb :Buffers<cr>
map <leader>bB :Buffers!<cr>
map <leader>cf :Commits<cr>
map <leader>cF :Commits!<cr>

" Map tilde (above TAB) to exit insert mode and visual mode
" For some reason it will actually press enter when trying to exit
" command line mode with tilde, meaning that if you try to cancel a :wq
" or the like it will execute it. Need a workaround...
imap § <Esc>
vmap § <Esc>

" Use easymotion
nmap <Leader>s <Plug>(easymotion-s2)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Set higher updaterate
set updatetime=50
set ttimeoutlen=0
set switchbuf=usetab

" Language server bindings
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <localleader>= :call LanguageClient_textDocument_formatting()<CR>
nnoremap <silent> <localleader>s :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <localleader>S :call LanguageClient_workspace_symbol()<CR>
nnoremap <silent> <localleader>r :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <localleader>R :call LanguageClient_textDocument_rename()<CR>

" Goto definition in new tab for language server
nnoremap <silent> <localleader>t :call LanguageClient_textDocument_definition({'gotoCmd': 'tabedit'})<CR>
autocmd BufNewFile,BufRead *.wiki setfiletype creole

function! AdHocSnippet(language, snippet)
  let l:path = "/home/gonz/.config/adhoc-snippets/" . a:language . "/" . a:snippet . ".snippet"
  echom l:path
  execute "read " . l:path
endfunction

" Elixir debugging remaps
inoremap %led <Esc>^"ld$:call AdHocSnippet("elixir", "logger_debug")<CR>j^f,"lP
inoremap %lei <Esc>^"ld$:call AdHocSnippet("elixir", "logger_info")<CR>j^f,"lP
inoremap %lew <Esc>^"ld$:call AdHocSnippet("elixir", "logger_warn")<CR>j^f,"lP
inoremap %lee <Esc>^"ld$:call AdHocSnippet("elixir", "logger_error")<CR>j^f,"lP
