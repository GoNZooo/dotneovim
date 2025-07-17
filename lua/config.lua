require("fuzzy_search")
--require("orgmode").setup_ts_grammar()
require("snippets")
require("github")
require("treesitter")
require("mason").setup()
require("mason-lspconfig").setup()
require("lsp")
require("completion")
require("statusline")

-- Exiting insert mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.o.shell = "powershell.exe"
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellquote = ""
vim.o.shellxquote = ""

require("which")
require("comments")
require("indent_guides")
require("file-browsing")
require("build-command")
