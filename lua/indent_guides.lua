vim.cmd [[highlight IndentBlanklineIndent1 guibg=#2b2b2b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#212121 gui=nocombine]]

require("indent_blankline").setup {
  char = "",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  show_trailing_blankline_indent = false,
}
