vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  extends = "❯",
  precedes = "❮",
  nbsp = "␣",
}
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#404040 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#606060 gui=nocombine]]

require("indent_blankline").setup {
  show_end_of_line = false,
  show_tab = true,
  show_current_context_start = false,
  show_current_context = true,
}
