require("fuzzy_search")
--require("orgmode").setup_ts_grammar()
require("snippets")
require("treesitter")
require("mason").setup()
require("mason-lspconfig").setup()
require("completion")
require("statusline")
require("comments")
require("indent_guides")
require("file-browsing")
require("build-command")
require("lsp")

local TERM_VALUE = vim.env.TERM or ""
if TERM_VALUE ~= "rxvt-unicode-256color" then
    vim.opt.termguicolors = true
end

-- colorscheme gonz-aurora
vim.cmd([[ colorscheme gonz-aurora ]])

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.mouse = ""

vim.opt.background = "dark"
vim.cmd([[ syntax enable ]])
vim.cmd([[ filetype plugin indent on ]])

-- SPACE is leader
vim.g.mapleader = " "
-- , is localleader
vim.g.maplocalleader = ","
-- Tilde is ESC in insert mode
vim.keymap.set("i", "§", "<Esc>", { noremap = true, silent = true })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = "utf-8"

-- Highlight search results
vim.opt.hlsearch = true
-- Incremental search, search as you type
vim.opt.incsearch = true
-- Ignore case when searching
vim.opt.ignorecase = true
-- Ignore case when searching lowercase
vim.opt.smartcase = true

-- Stop highlighting on Enter
function nohlsearch()
    vim.cmd("nohlsearch")
end
vim.keymap.set("n", "<CR>", nohlsearch, { noremap = true, silent = true })

-- " Set highlight for column 80,100,120
-- set colorcolumn=80,100,120
vim.opt.colorcolumn = "80,100,120"

-- highlight cursorposition
vim.opt.cursorcolumn = true
-- Show 2 lines away from cursor
vim.opt.scrolloff = 2

-- Expansions
--
-- %% expands to current path, all thanks to Gary Bernhardt & Drew Neil
-- See: http://vimcasts.org/episodes/the-edit-command/
vim.cmd([[ cnoremap %% <C-R>=fnameescape(expand('%:p:h'))."/"<CR> ]])
-- %rc expands to vimrc
if vim.fn.has("win64") == 1 then
    vim.cmd([[ cnoremap %rc ~/AppData/Local/nvim/init.vim ]])
    vim.cmd([[ cnoremap %ll ~/AppData/Local/nvim/lua/config.lua ]])
else
    vim.cmd([[ cnoremap %rc ~/.config/nvim/init.vim ]])
    vim.cmd([[ cnoremap %ll ~/.config/nvim/lua/config.lua ]])
end

vim.opt.updatetime = 50
vim.opt.ttimeoutlen = 0
vim.opt.switchbuf = "usetab"

vim.opt.foldmethod = "indent"
 -- Open all folds by default
vim.opt.foldlevel = 99
vim.opt.foldenable = false

vim.opt.clipboard:append("unnamedplus")

-- Disable swap files
vim.opt.swapfile = false
-- Enable undofiles that persist to home directory
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/nvim/undodir")

-- Set shell stuff on Windows
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    vim.opt.shell = "powershell.exe"
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end

require("which")

-- Exiting insert mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

local aug = vim.api.nvim_create_augroup("Config", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = aug,
    callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    group = aug,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local line_count = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= line_count then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
