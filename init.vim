" SPACE is leader
let g:mapleader=' '
" , is localleader
let g:maplocalleader=','

set mouse=a

if !exists('g:vscode')
  call plug#begin('C:\Users\ricka\code\vim\dotneovim\plugged')
  
  " Language server
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  
  let g:LanguageClient_serverCommands = {
    \ 'elixir': ['~/tools/elixir-ls/language_server.sh'],
    \ 'purescript': ['purescript-language-server', '--stdio', '--log', './psc-ide-log']
    \ }
    " \ 'ocaml': ['ocaml-language-server', '--stdio'],
    " \ 'reason': ['ocaml-language-server', '--stdio'],
    " \ 'json': ['json-languageserver', '--stdio'],
    " \ 'javascript': ['javascript-typescript-stdio'],
    " \ 'haskell': ['hie-wrapper', '--lsp']
    " \ }
  
  " let g:LanguageClient_hoverPreview = "Always"
  
  " Alternative language server plugin
  " Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  
  " Plugins
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#auto_complete_start_length = 2
    let g:deoplete#python3_host_prog = 'python3.exe'
    " use tab for completion
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  
  " PureScript
  " Plug 'purescript-contrib/purescript-vim'
  
  " Haskell
  Plug 'neovimhaskell/haskell-vim'
  Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
  Plug 'alx741/vim-hindent'
  Plug 'alx741/vim-stylishask'
  let g:hindent_on_save = 0
  let g:stylishask_on_save = 0
  " Don't automatically show buffer for GHCID; use terminal instead
  let g:ghcid_background = 1
  Plug 'w0rp/ale'
  let g:ale_linters = {'haskell': ['hlint'], 'elixir': [], 'javascript': [], 'zig': ['zigbuild']}
  " let g:ale_haskell_ghc_options = '-fno-code -v0 -isrc'
  " Plug 'parsonsmatt/intero-neovim'
  " Plug 'neomake/neomake'
  " Intero starts automatically. Set this if you'd like to prevent that.
  " let g:intero_start_immediately = 1
  
  " Enable type information on hover (when holding cursor at point for ~1 second).
  " let g:intero_type_on_hover = 0
  
  " Change the intero window size; default is 10.
  " let g:intero_window_size = 80
  
  " Sets the intero window to split vertically; default is horizontal
  " let g:intero_vertical_split = 1
  
  "Plug 'ludovicchabant/vim-gutentags'
  "let g:gutentags_cache_dir = '~/.tags_cache'
  
  Plug 'mileszs/ack.vim'
  let g:ackprg = 'rg --smart-case --vimgrep'
  
  " Plugins from the Lord of Vim 
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-commentary'
  
  "Plug 'justinmk/vim-sneak'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
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
  Plug 'joshdick/onedark.vim'
  Plug 'GoNZooo/jellybeans.vim'
  
  " Rainbow parens
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
  " Plug 'LnL7/vim-nix'
  
  " TypeScript
  Plug 'leafgarland/typescript-vim'
  Plug 'ianks/vim-tsx'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  
  " zig
  let g:zig_fmt_autosave = 0
  Plug 'ziglang/zig.vim'
  
  call plug#end()
  
  set guifont=Consolas:h15
  
  " if has('gui_vmrc')
  "   source ginit.vim
  " endif
  
  " zig ALE linter by fubd @ FreeNode
  " Author: Kevin Watters <kevinwatters@gmail.com>
  " Description: This file adds support for checking zig code.
  "
  
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_zig_compiler = "zig"
  
  function! ZigGetExecutable(buffer) abort
      return g:ale_zig_compiler
  endfunction
  
  function! s:find_build_dir(direc, count) abort
      let l:path = a:direc . "/build.zig"
      if filereadable(l:path)
          return a:direc
      else
          if a:count < 10
              return s:find_build_dir(expand(a:direc . "../"), a:count + 1)
          endif
      endif 
  
      return "."
  endif
  
  endfunction
  
  function! ZigGetCommand(buffer) abort
      let l:buf_direc = expand('%:h')
      let l:direc = s:find_build_dir(l:buf_direc, 0)
  
      return 'cd ' . direc . ' && ' . fnameescape(ZigGetExecutable(a:buffer))
      \   . ' build --verbose'
  endfunction
  
  function! ZigHandleZigCompilerCheck(buffer, lines) abort
      " Regular expression to match messages:
      " They look like:
      "
      " C:\Users\Foo\src\myproject\src\main.zig:24:4: error: invalid token: '.'
      "
      let l:pattern = '\v([^\(]+):(\d+):(\d+): error: (.*)$'
  
      let l:output = [] " For each match, update the l:output list:
  
      for l:match in ale#util#GetMatches(a:lines, l:pattern)
          call add(l:output, {
          \   'filename': expand(l:match[1]),
          \   'lnum': str2nr(l:match[2]),
          \   'col': str2nr(l:match[3]),
          \   'text': l:match[4],
          \   'type': 'E'
          \})
      endfor
  
      return l:output
  endfunction
  
  call ale#linter#Define('zig', {
  \   'name': 'zigbuild',
  \   'executable_callback': 'ZigGetExecutable',
  \   'command_callback': 'ZigGetCommand',
  \   'callback': 'ZigHandleZigCompilerCheck',
  \   'output_stream': 'both'
  \})
  
  "set mouse=""
  
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
  cnoremap %rc C:/Users/ricka/AppData/Local/nvim/init.vim
  cnoremap %code C:/Users/ricka/code
  
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
    " nmap <silent> <localleader>r <Plug>(coc-references)
    " nmap <silent> <localleader>= :call CocAction('format')<CR>
    " nmap <silent> <localleader>, <Plug>(coc-codeaction)
    " nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)
    " nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
    " nmap <silent> <leader>el :CocList diagnostics<CR>
    " nmap <localleader>R <Plug>(coc-rename)
    "
    " nnoremap <silent> <localleader>s :call LanguageClient_textDocument_documentSymbol()<CR>
    " nnoremap <silent> <localleader>S :call LanguageClient_workspace_symbol()<CR>
    " nnoremap <silent> <localleader>R :call LanguageClient_textDocument_rename()<CR>
    " Goto definition in new tab for language server
    " nnoremap <silent> <localleader>t :call LanguageClient_textDocument_definition({'gotoCmd': 'tabedit'})<CR>
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
  
  " Helper function, called below with mappings
  " Taken from https://blog.jez.io/haskell-development-with-neovim/
  function! HaskellFormat(which) abort
    if a:which ==# 'hindent' || a:which ==# 'both'
      :Hindent
    endif
    if a:which ==# 'stylish' || a:which ==# 'both'
      :Stylishask
    endif
  endfunction
  
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
    let g:prettier#config#config_precedence = 'prefer-file'
  augroup END
  
  " haskell bindings
  augroup filetype_haskell
    " autocmd FileType haskell nnoremap <buffer> <silent> K :InteroGenericType<CR>
    " autocmd FileType haskell nnoremap <buffer> <silent> gd :InteroGoToDef<CR>
    " autocmd FileType haskell nnoremap <buffer> <silent> <leader>il :InteroLoadCurrentFile<CR>
    " autocmd FileType haskell nnoremap <buffer> <silent> <leader>im :InteroLoadCurrentModule<CR>
    " autocmd FileType haskell nnoremap <buffer> <silent> <leader>io :InteroOpen<CR>
    " autocmd FileType haskell nnoremap <buffer> <silent> <leader>ih :InteroHide<CR>
    " autocmd FileType haskell nnoremap <buffer> <silent> <leader>ir :InteroReload<CR>
    " autocmd FileType haskell nnoremap <buffer> <silent> <leader>it :InteroInsertType<CR>
    " autocmd FileType haskell nnoremap <buffer> <leader>ist :InteroSetTargets<CR>
    " autocmd FileType haskell nnoremap <buffer> <silent> <leader>ict :InteroClearTargets<CR>
    autocmd FileType haskell nnoremap <buffer> <localleader>i :call HaskellFormat('hindent')<CR>
    autocmd FileType haskell nnoremap <buffer> <localleader>= :call HaskellFormat('both')<CR>
    autocmd FileType haskell nnoremap <buffer> <leader>= :call HaskellFormat('stylish')<CR>
    autocmd FileType haskell nnoremap <buffer> <C-s> :Tags<CR>
    autocmd FileType haskell nmap <buffer> gd <C-]>
    set tags=codex.tags,tags
  augroup END
  
  " zig bindings
  augroup filetype_zig
    autocmd FileType zig nnoremap <buffer> <leader>en :ALENextWrap<CR>
    autocmd FileType zig nnoremap <buffer> <leader>ep :ALEPreviousWrap<CR>
    autocmd FileType zig nnoremap <silent> <localleader>= :call zig#fmt#Format()<CR>
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
else
  nnoremap <leader>en :call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
  nnoremap <leader>ep :call VSCodeNotify('editor.action.marker.prevInFiles')<CR>
  nnoremap <leader>h :call VSCodeNotify('editor.action.showHover')<CR>
endif
