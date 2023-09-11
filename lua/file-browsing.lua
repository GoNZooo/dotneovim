require("oil").setup({
  columns = {
      "icon",
      "permissions",
  },
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["gv"] = "actions.select_vsplit",
    ["gh"] = "actions.select_split",
    ["gt"] = "actions.select_tab",
    ["gp"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["g."] = "actions.toggle_hidden",
    ["gr"] = "actions.refresh",
  },
  use_default_keymaps = false,
  view_options = {
      show_hidden = true,
  },
})
