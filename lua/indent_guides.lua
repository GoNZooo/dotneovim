vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  extends = "❯",
  precedes = "❮",
  nbsp = "␣",
}

require("indent_blankline").setup {
  show_end_of_line = false,
  show_tab = true,
  show_current_context_start = true,
  show_current_context = true,
}
