require("fuzzy_search")
require("orgmode").setup_ts_grammar()
require("snippets")
require("github")
require("table-of-contents").setup()
require("treesitter")
require("orgmode").setup({
  org_agenda_files = { "~/org/*" },
  org_default_notes_file = "~/org/notes.org",
})
require("lsp")
require("completion")
require("debugging")

vim.keymap.set("n", "<leader><leader>S", "<cmd>source ~/.config/nvim/lua/snippets.lua<CR>")
vim.keymap.set("n", "<leader><leader>L", "<cmd>source ~/.config/nvim/lua/config.lua<CR>")
vim.keymap.set("n", "<leader><leader>R", "<cmd>source ~/.config/nvim/init.vim<CR>")
