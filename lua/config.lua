require("fuzzy_search")
require("orgmode").setup_ts_grammar()
require("snippets")
require("github")
require("table-of-contents").setup()
require("treesitter")
require("orgmode").setup({
  org_agenda_files = { "~/Dropbox/org/*" },
  org_default_notes_file = "~/Dropbox/org/notes.org",
})
require("lsp")
require("completion")
require("statusline")

-- Exiting insert mode in the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

require("which")
require("comments")
require("indent_guides")
require("file-browsing")
