local whichKey = require("which-key")
local language_integration = require("language_integration")

function create_or_open_file()
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
      ["<leader>"] = {
        name = "Source files",
        S = { "<cmd>source ~/.config/nvim/lua/snippets.lua<CR>", "Snippets" },
        L = { "<cmd>source ~/.config/nvim/lua/config.lua<CR>", "Config" },
        R = { "<cmd>source ~/.config/nvim/init.vim<CR>", "Reload" },
      },
      ["<TAB>"] = {"<C-6>", "Switch to last open buffer"},
    },
    ["-"] = {
      name = "File Tree",
      ["-"] = {"<cmd>NERDTreeToggle<CR>", "Toggle NERDTree"},
      f = {"<cmd>NERDTreeFind<CR>", "Find file in NERDTree"},
      a = {create_or_open_file, "Create or open file"},
    },
    ["<localleader>"] = {
      name = "Language integration",
      c = { language_integration.compile, "Compile" },
      t = { language_integration.run_tests, "Run tests" },
    },
    ["<C-h>"] = { "<C-w>h", "Move to left window" },
    ["<C-j>"] = { "<C-w>j", "Move to bottom window" },
    ["<C-k>"] = { "<C-w>k", "Move to top window" },
    ["<C-l>"] = { "<C-w>l", "Move to right window" },
  },
  {}
)
