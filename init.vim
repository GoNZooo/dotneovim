" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'junnplus/lsp-setup.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/nvim-lsp-installer'

" Completion engine
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" PureScript
Plug 'purescript-contrib/purescript-vim'

" Plug 'w0rp/ale'
" let g:ale_linters = {'haskell': ['hlint'], 'elixir': [], 'javascript': []}
" let g:ale_haskell_ghc_options = '-fno-code -v0 -isrc'
Plug 'mileszs/ack.vim'
let g:ackprg = 'rg --smart-case --vimgrep'

Plug 'easymotion/vim-easymotion'
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
Plug 'GoNZooo/jellybeans.vim'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" org-mode
Plug 'nvim-orgmode/orgmode'

" Nicer quickfix
Plug 'kevinhwang91/nvim-bqf'

" Copilot
Plug 'github/copilot.vim'

let g:copilot_filetypes = {
      \ '*': v:true
      \ }

" Jira
Plug 'n0v1c3/vira', { 'do': './install.sh' }
let g:vira_config_file_servers = $HOME . '/.config/vira/vira_servers.json'
let g:vira_config_file_projects = $HOME . '/.config/vira/vira_projects.json'
call plug#end()

set mouse=""

" Colorscheme
set background=dark
syntax enable
filetype plugin indent on

" only enables termguicolors if we are not running urxvt
if $TERM != 'rxvt-unicode-256color'
  set termguicolors
endif

colorscheme gonz-aurora

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
set scrolloff=2

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
" %% expands to current path, all thanks to Gary Bernhardt & Drew Neil
" See: http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:p:h'))."/"<CR>
" %rc expands to vimrc
cnoremap %rc ~/.config/nvim/init.vim
cnoremap %ll ~/.config/nvim/lua/config.lua

map <leader>cd :lcd %:p:h<CR>

" Useful bindings for opening new files
" Current window
map <leader>ew :e %%
" New tab
map <leader>et :tabe %%
" New window from vertical split
map <leader>ev :vsp %%
" New window from horizontal split
map <leader>es :sp %%

" Fzf
map <C-p> :Files<CR>
map <C-g> :GFiles<CR>
map <leader>ff :Files<CR>
map <leader>fF :Files!<CR>
map <leader>gf :GFiles<CR>
map <leader>gF :GFiles!<CR>
map <leader>gc :GFiles?<CR>
"map <C-b> :Buffers<CR>
map <leader>bb :Buffers<CR>
map <leader>bB :Buffers!<CR>
map <leader>cf :Commits<CR>
map <leader>cF :Commits!<CR>
map <leader>/ :Rg 
map <leader>* :Rg <c-r>=expand("<cword>")<CR>

" Map tilde (above TAB) to exit insert mode and visual mode
" For some reason it will actually press enter when trying to exit
" command line mode with tilde, meaning that if you try to cancel a :wq
" or the like it will execute it. Need a workaround...
imap § <Esc>
vmap § <Esc>

" Use easymotion
nmap <leader>s <Plug>(easymotion-s2)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"" Set higher updaterate
set updatetime=50
set ttimeoutlen=0
set switchbuf=usetab

" Loading project specific config
set exrc
set secure

" completion list
" inoremap <expr><tab> pumvisible() ? "\<c-y>" : "\<tab>"
" imap <expr><c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
" imap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

highlight GutterSignAdd    guifg=#009900 ctermfg=2
highlight GutterSignChange guifg=#bbbb00 ctermfg=3
highlight GutterSignDelete guifg=#ff2222 ctermfg=1
highlight link GitGutterAdd    GutterSignAdd
highlight link GitGutterChange GutterSignChange
highlight link GitGutterDelete GutterSignDelete

" Basic `:Git` mappings
nmap <leader>Gg :Git<CR>

" Load our lua config
lua require("config")

" Enable per-project configurations
set exrc
set secure
