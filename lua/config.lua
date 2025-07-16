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

require("which")
require("comments")
require("indent_guides")
require("file-browsing")
