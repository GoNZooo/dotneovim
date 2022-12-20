local whichKey = require("which-key")

whichKey.register(
  {
    t = {
      name = "Terminal",
      -- Opens a terminal on the right side of the screen
      t = { "<cmd>rightbelow vnew +terminal<CR>", "Terminal" },
    },
    G = {
      name = "git",
      P = { "<cmd>Git push<CR>", "Push" },
      G = { "<cmd>Git<CR>", "Status" },
      p = { "<cmd>Git pull<CR>", "Pull" },
      C = { "<cmd>Git commit<CR>", "Commit" },
      B = { "<cmd>Git blame<CR>", "Blame" },
    },
  },
  { prefix = "<leader>" }
)
