local whichKey = require("which-key")

function createOrOpenFile()
  local file = vim.fn.input("File name: ")
  local path = vim.fn.expand("%:p:h") .. "/" .. file
  vim.cmd("edit " .. path)
end

whichKey.register(
  {
    ["<leader>"] = {
      t = {
        name = "Terminal",
        -- Opens a terminal on the right side of the screen
        t = { "<cmd>rightbelow vnew +terminal<CR>", "Terminal" },
        -- Opens a new terminal in a new tab
        T = { "<cmd>tabnew +terminal<CR>", "Terminal Tab" },
      },
      G = {
        name = "git",
        P = { "<cmd>Git push<CR>", "Push" },
        G = { "<cmd>Git<CR>", "Status" },
        p = { "<cmd>Git pull<CR>", "Pull" },
        C = { "<cmd>Git commit<CR>", "Commit" },
        B = { "<cmd>Git blame<CR>", "Blame" },
        L = { "<cmd>Git log<CR>", "Log" },
        l = { "<cmd>Telescope git_commits<CR>", "Log" },
      },
    },
    ["-"] = {
      name = "File Tree",
      ["-"] = {"<cmd>NERDTreeToggle<CR>", "Toggle NERDTree"},
      f = {"<cmd>NERDTreeFind<CR>", "Find file in NERDTree"},
      a = {createOrOpenFile, "Create or open file"},
    },
  },
  {}
)
