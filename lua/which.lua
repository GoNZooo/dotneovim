local whichKey = require("which-key")

whichKey.register(
  {
    t = {
      name = "Terminal",
      -- Opens a terminal on the right side of the screen
      t = { "<cmd>rightbelow vnew +terminal<CR>", "Terminal" },
    },
  },
  { prefix = "<leader>" }
)
