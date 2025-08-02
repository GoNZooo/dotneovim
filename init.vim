" Plugins
call plug#begin('~/.config/nvim/plugged')

" Misc helper functions (dependency of popular plugins)
Plug 'nvim-lua/plenary.nvim'

" Which-key
Plug 'folke/which-key.nvim'

" LSP
Plug 'junnplus/lsp-setup.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Preview in floats
Plug 'rmagatti/goto-preview'

" TypeScript extras
Plug 'jose-elias-alvarez/null-ls.nvim'

" Completion engine
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'onsails/lspkind.nvim'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'ap29600/tree-sitter-odin'

" TODO comments
Plug 'doongjohn/todo-comments.nvim'

" Misc. motions/text search
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'int3/vim-extradite'

" Fuzzy searching
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'powerman/vim-plugin-AnsiEsc'
let g:no_plugin_maps = v:true

" Statusline
Plug 'nvim-lualine/lualine.nvim'
set laststatus=2

" File browsing, enhanced netrw
Plug 'stevearc/oil.nvim'

" Colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'iCyMind/NeoSolarized'
Plug 'chriskempson/base16-vim'
Plug 'GoNZooo/jellybeans.vim'

" HiLinkTrace for debugging colorscheme scopes
Plug 'gerw/vim-HiLinkTrace'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" org-mode
Plug 'nvim-orgmode/orgmode'

" Nicer quickfix
Plug 'kevinhwang91/nvim-bqf'

" Copilot
Plug 'github/copilot.vim'

let g:copilot_filetypes = {
      \ 'dap-repl': v:false,
      \ 'dapui_watches': v:false,
      \ '*': v:true
      \ }

let g:copilot_enabled=v:false

inoremap <C-a> <Plug>(copilot-suggest)

" Comments
Plug 'numToStr/Comment.nvim'

"""
" Language-specific plugins
"""

" Odin
Plug 'Tetralux/odin.vim'

call plug#end()

" Load our lua config
lua require("config")

