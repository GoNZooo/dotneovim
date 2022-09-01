local ls = require("luasnip")
local types = require("luasnip.util.types")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

ls.config.set_config {
  -- Remember last snippet
  history = true,

  -- Update snippets as we type
  updateevents = "TextChanged,TextChangedI",

  enable_autosnippets = true,
}

vim.keymap.set({ "i", "s" }, "<c-q>",
  function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end,
  { silent = true }
)

vim.keymap.set({ "i", "s" }, "<c-s-q>",
  function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end,
  { silent = true }
)

vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("n", "<leader><leader>s",
  function()
    require("luasnip.loaders").edit_snippet_files(nil)
  end,
  { silent = true }
)
