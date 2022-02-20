call plug#begin('~/.config/nvim/plugged')

" Language server
" Plug 'autozimu/LanguageClient-neovim', {
"   \ 'branch': 'next',
"   \ 'do': 'bash install.sh',
"   \ }

" let g:LanguageClient_useVirtualText = 0

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" let g:LanguageClient_serverCommands = {}

" let g:LanguageClient_diagnosticsDisplay = {
"  \    1: {
"  \        "name": "Error",
"  \        "texthl": "ALEError",
"  \        "signText": ">",
"  \        "signTexthl": "ALEErrorSign",
"  \        "virtualTexthl": "Error",
"  \    },
"  \    2: {
"  \        "name": "Warning",
"  \        "texthl": "ALEWarning",
"  \        "signText": "-",
"  \        "signTexthl": "ALEWarningSign",
"  \        "virtualTexthl": "Todo",
"  \    },
"  \    3: {
"  \        "name": "Information",
"  \        "texthl": "ALEInfo",
"  \        "signText": "i",
"  \        "signTexthl": "ALEInfoSign",
"  \        "virtualTexthl": "Todo",
"  \    },
"  \    4: {
"  \        "name": "Hint",
"  \        "texthl": "ALEInfo",
"  \        "signText": "h",
"  \        "signTexthl": "ALEInfoSign",
"  \        "virtualTexthl": "Todo",
"  \    },
"  \}
  " \ 'purescript': ['purescript-language-server', '--stdio', '--log', './psc-ide-log']
  " \ 'ocaml': ['ocaml-language-server', '--stdio'],
  " \ 'reason': ['ocaml-language-server', '--stdio'],
  " \ 'json': ['json-languageserver', '--stdio'],
  " \ 'javascript': ['javascript-typescript-stdio'],
  " \ 'elixir': ['~/tools/elixir-ls/language_server.sh'],
  " \ 'haskell': ['hie-wrapper', '--lsp']

" let g:LanguageClient_hoverPreview = "Always"

" Plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-y>" : "\<tab>"
  imap <expr><c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
  imap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

" PureScript
Plug 'purescript-contrib/purescript-vim'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
" Don't automatically show buffer for GHCID; use terminal instead
let g:ghcid_background = 1
Plug 'w0rp/ale'
let g:ale_linters = {'haskell': ['hlint'], 'elixir': [], 'javascript': []}
" let g:ale_haskell_ghc_options = '-fno-code -v0 -isrc'

Plug 'mileszs/ack.vim'
let g:ackprg = 'rg --smart-case --vimgrep'

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
Plug 'GoNZooo/jellybeans.vim'

Plug 'luochen1990/rainbow'

let g:rainbow_active = 0

Plug 'gerw/vim-HiLinkTrace'

Plug 'elixir-editors/vim-elixir'

" org-mode
Plug 'tpope/vim-speeddating'
Plug 'mattn/calendar-vim'
Plug 'jceb/vim-orgmode'

" creole
Plug 'vim-scripts/vim-creole'

" nix
Plug 'LnL7/vim-nix'

" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

" Deoplete
call deoplete#custom#option('min_pattern_length', 2)

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

" Set higher updaterate
set updatetime=50
set ttimeoutlen=0
set switchbuf=usetab

" Loading project specific config
set exrc
set secure

" Language server bindings
augroup language_server_protocol
  " inoremap <silent><expr> <c-space> coc#refresh()
  " nnoremap <silent> K :call CocAction('doHover')<CR>
  " nmap <silent> gd <Plug>(coc-definition)
  " nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
  " nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
  " nnoremap <silent> <localleader>r <Plug>(coc-references)
  " nnoremap <silent> <localleader>= :call CocAction('format')<CR>
  " nnoremap <silent> <localleader>, <Plug>(coc-codeaction)
  " nmap <localleader>R <Plug>(coc-rename)

  nnoremap <silent> <localleader>s :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <silent> <localleader>S :call LanguageClient_workspace_symbol()<CR>
  nnoremap <silent> <localleader>R :call LanguageClient_textDocument_rename()<CR>
  nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  " Goto definition in new tab for language server
  nnoremap <silent> <localleader>t :call LanguageClient_textDocument_definition({'gotoCmd': 'tabedit'})<CR>
augroup END

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

augroup filetype_prettier
  autocmd FileType typescript nnoremap <buffer> <localleader>= :Prettier<CR>
  autocmd FileType typescript.tsx nnoremap <buffer> <localleader>= :Prettier<CR>
  autocmd FileType javascript.jsx nnoremap <buffer> <localleader>= :Prettier<CR>
  autocmd FileType html nnoremap <buffer> <localleader>= :Prettier<CR>
  autocmd FileType yaml nnoremap <buffer> <localleader>= :Prettier<CR>

  let g:prettier#config#print_width = 100
  let g:prettier#config#tab_width = 2
  let g:prettier#config#single_quote = 'false'
  let g:prettier#config#trailing_comma = 'es5'
  let g:prettier#config#arrow_parens = 'always'
  let g:prettier#config#bracket_spacing = 'true'
augroup END

augroup vimrc_appearance | autocmd!
	autocmd ColorScheme * call s:vimrc_postcolorscheme()
augroup END

highlight GutterSignAdd    guifg=#009900 ctermfg=2
highlight GutterSignChange guifg=#bbbb00 ctermfg=3
highlight GutterSignDelete guifg=#ff2222 ctermfg=1
highlight link GitGutterAdd    GutterSignAdd
highlight link GitGutterChange GutterSignChange
highlight link GitGutterDelete GutterSignDelete
