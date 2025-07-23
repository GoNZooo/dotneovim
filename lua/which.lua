local whichKey = require("which-key")
local language_integration = require("language_integration")
local starcraft = require("starcraft")
local todo_comments = require("todo-comments")
local build_command = require("build-command")
local tag_picker = require("tag_picker")
local telescope = require("telescope.builtin")

function create_or_open_file()
    local file = vim.fn.input("File name: ")
    local path = vim.fn.expand("%:p:h") .. "/" .. file
    vim.cmd("edit " .. path)
end

function telescope_buffer_tags()
    return telescope.current_buffer_tags({ctags_file = "tags", show_kind = false})
end

function telescope_all_tags()
    return telescope.tags({ctags_file = "tags", show_kind = false})
end

whichKey.register(
  {
    ["<localleader>"] = {
        B = { function() build_command.select_build_command() end, "Select Build Command" },
        b = { function() build_command.run_last_command() end, "Run Last Build Command" },
    },
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
      s = {telescope_buffer_tags,  "Search tags for buffer"},
      S = {tag_picker.tag_search_picker,  "Search tags"},
      ["<leader>"] = {
        name = "Source files",
        S = { "<cmd>source ~/.config/nvim/lua/snippets.lua<CR>", "Snippets" },
        L = { "<cmd>source ~/.config/nvim/lua/config.lua<CR>", "Config" },
        R = { "<cmd>source ~/.config/nvim/init.vim<CR>", "Reload" },
      },
      ["<TAB>"] = {"<C-6>", "Switch to last open buffer"},
      m = {
        name = "Starcraft",
        ["1"] = { function() starcraft.bind_buffer("1") end, "Bind Starcraft buffer #1" },
        ["2"] = { function() starcraft.bind_buffer("2") end, "Bind Starcraft buffer #2" },
        ["3"] = { function() starcraft.bind_buffer("3") end, "Bind Starcraft buffer #3" },
        ["4"] = { function() starcraft.bind_buffer("4") end, "Bind Starcraft buffer #4" },
        ["5"] = { function() starcraft.bind_buffer("5") end, "Bind Starcraft buffer #5" },
        ["6"] = { function() starcraft.bind_buffer("6") end, "Bind Starcraft buffer #6" },
        ["7"] = { function() starcraft.bind_buffer("7") end, "Bind Starcraft buffer #7" },
        ["8"] = { function() starcraft.bind_buffer("8") end, "Bind Starcraft buffer #8" },
        ["9"] = { function() starcraft.bind_buffer("9") end, "Bind Starcraft buffer #9" },
        ["0"] = { function() starcraft.bind_buffer("0") end, "Bind Starcraft buffer #10" },
      },
      ["1"] = { function() starcraft.go_to_buffer("1") end, "Go to Starcraft buffer #1" },
      ["2"] = { function() starcraft.go_to_buffer("2") end, "Go to Starcraft buffer #2" },
      ["3"] = { function() starcraft.go_to_buffer("3") end, "Go to Starcraft buffer #3" },
      ["4"] = { function() starcraft.go_to_buffer("4") end, "Go to Starcraft buffer #4" },
      ["5"] = { function() starcraft.go_to_buffer("5") end, "Go to Starcraft buffer #5" },
      ["6"] = { function() starcraft.go_to_buffer("6") end, "Go to Starcraft buffer #6" },
      ["7"] = { function() starcraft.go_to_buffer("7") end, "Go to Starcraft buffer #7" },
      ["8"] = { function() starcraft.go_to_buffer("8") end, "Go to Starcraft buffer #8" },
      ["9"] = { function() starcraft.go_to_buffer("9") end, "Go to Starcraft buffer #9" },
      ["0"] = { function() starcraft.go_to_buffer("0") end, "Go to Starcraft buffer #10" },
      T = {
          name = "TODO comments",
          a = { function() vim.cmd("TodoTelescope") end, "Show all" },
          T = { function() vim.cmd("TodoTelescope keywords=TODO,FIX") end, "Search TODO & FIX" },
      },
    },
    ["-"] = {
      name = "File Tree",
      ["-"] = {"<cmd>Oil<CR>", "Open Oil in current directory"},
      a = {create_or_open_file, "Create or open file"},
    },
    ["<C-h>"] = { "<C-w>h", "Move to left window" },
    ["<C-j>"] = { "<C-w>j", "Move to bottom window" },
    ["<C-k>"] = { "<C-w>k", "Move to top window" },
    ["<C-l>"] = { "<C-w>l", "Move to right window" },
    ["<C-p>"] = { function() starcraft.pick_buffer() end, "Pick Starcraft buffer" },
    m = {
      name = "Starcraft",
      ["<F1>"] = { function() starcraft.bind_buffer("F1") end, "Bind Starcraft buffer F1" },
      ["<F2>"] = { function() starcraft.bind_buffer("F2") end, "Bind Starcraft buffer F2" },
      ["<F3>"] = { function() starcraft.bind_buffer("F3") end, "Bind Starcraft buffer F3" },
      ["<F4>"] = { function() starcraft.bind_buffer("F4") end, "Bind Starcraft buffer F4" },
      ["<F5>"] = { function() starcraft.bind_buffer("F5") end, "Bind Starcraft buffer F5" },
      ["<F6>"] = { function() starcraft.bind_buffer("F6") end, "Bind Starcraft buffer F6" },
      ["<F7>"] = { function() starcraft.bind_buffer("F7") end, "Bind Starcraft buffer F7" },
      ["<F8>"] = { function() starcraft.bind_buffer("F8") end, "Bind Starcraft buffer F8" },
      ["<F9>"] = { function() starcraft.bind_buffer("F9") end, "Bind Starcraft buffer F9" },
      ["<F10>"] = { function() starcraft.bind_buffer("F10") end, "Bind Starcraft buffer F10" },
      ["<F11>"] = { function() starcraft.bind_buffer("F11") end, "Bind Starcraft buffer F11" },
      ["<F12>"] = { function() starcraft.bind_buffer("F12") end, "Bind Starcraft buffer F12" },
      ["1"] = { function() starcraft.bind_buffer("1") end, "Bind Starcraft buffer #1" },
      ["2"] = { function() starcraft.bind_buffer("2") end, "Bind Starcraft buffer #2" },
      ["3"] = { function() starcraft.bind_buffer("3") end, "Bind Starcraft buffer #3" },
      ["4"] = { function() starcraft.bind_buffer("4") end, "Bind Starcraft buffer #4" },
      ["5"] = { function() starcraft.bind_buffer("5") end, "Bind Starcraft buffer #5" },
      ["6"] = { function() starcraft.bind_buffer("6") end, "Bind Starcraft buffer #6" },
      ["7"] = { function() starcraft.bind_buffer("7") end, "Bind Starcraft buffer #7" },
      ["8"] = { function() starcraft.bind_buffer("8") end, "Bind Starcraft buffer #8" },
      ["9"] = { function() starcraft.bind_buffer("9") end, "Bind Starcraft buffer #9" },
      ["0"] = { function() starcraft.bind_buffer("0") end, "Bind Starcraft buffer #10" },
    },
    ["'"] = {
      name = "Starcraft jump",
      ["<F1>"] = {function() starcraft.go_to_buffer("F1") end, "Go to Starcraft buffer F1"},
      ["<F2>"] = {function() starcraft.go_to_buffer("F2") end, "Go to Starcraft buffer F2"},
      ["<F3>"] = {function() starcraft.go_to_buffer("F3") end, "Go to Starcraft buffer F3"},
      ["<F4>"] = {function() starcraft.go_to_buffer("F4") end, "Go to Starcraft buffer F4"},
      ["<F5>"] = {function() starcraft.go_to_buffer("F5") end, "Go to Starcraft buffer F5"},
      ["<F6>"] = {function() starcraft.go_to_buffer("F6") end, "Go to Starcraft buffer F6"},
      ["<F7>"] = {function() starcraft.go_to_buffer("F7") end, "Go to Starcraft buffer F7"},
      ["<F8>"] = {function() starcraft.go_to_buffer("F8") end, "Go to Starcraft buffer F8"},
      ["<F9>"] = {function() starcraft.go_to_buffer("F9") end, "Go to Starcraft buffer F9"},
      ["<F10>"] = {function() starcraft.go_to_buffer("F10") end, "Go to Starcraft buffer F10"},
      ["<F11>"] = {function() starcraft.go_to_buffer("F11") end, "Go to Starcraft buffer F11"},
      ["<F12>"] = {function() starcraft.go_to_buffer("F12") end, "Go to Starcraft buffer F12"},
      ["1"] = {function() starcraft.go_to_buffer("1") end, "Go to Starcraft buffer #1"},
      ["2"] = {function() starcraft.go_to_buffer("2") end, "Go to Starcraft buffer #2"},
      ["3"] = {function() starcraft.go_to_buffer("3") end, "Go to Starcraft buffer #3"},
      ["4"] = {function() starcraft.go_to_buffer("4") end, "Go to Starcraft buffer #4"},
      ["5"] = {function() starcraft.go_to_buffer("5") end, "Go to Starcraft buffer #5"},
      ["6"] = {function() starcraft.go_to_buffer("6") end, "Go to Starcraft buffer #6"},
      ["7"] = {function() starcraft.go_to_buffer("7") end, "Go to Starcraft buffer #7"},
      ["8"] = {function() starcraft.go_to_buffer("8") end, "Go to Starcraft buffer #8"},
      ["9"] = {function() starcraft.go_to_buffer("9") end, "Go to Starcraft buffer #9"},
      ["0"] = {function() starcraft.go_to_buffer("0") end, "Go to Starcraft buffer #10"},
    },
    ["<F1>"] = {function() starcraft.go_to_buffer("F1") end, "Go to Starcraft buffer F1"},
    ["<F2>"] = {function() starcraft.go_to_buffer("F2") end, "Go to Starcraft buffer F2"},
    ["<F3>"] = {function() starcraft.go_to_buffer("F3") end, "Go to Starcraft buffer F3"},
    ["<F4>"] = {function() starcraft.go_to_buffer("F4") end, "Go to Starcraft buffer F4"},
    ["<F5>"] = {function() starcraft.go_to_buffer("F5") end, "Go to Starcraft buffer F5"},
    ["<F6>"] = {function() starcraft.go_to_buffer("F6") end, "Go to Starcraft buffer F6"},
    ["<F7>"] = {function() starcraft.go_to_buffer("F7") end, "Go to Starcraft buffer F7"},
    ["<F8>"] = {function() starcraft.go_to_buffer("F8") end, "Go to Starcraft buffer F8"},
    ["<F9>"] = {function() starcraft.go_to_buffer("F9") end, "Go to Starcraft buffer F9"},
    ["<F10>"] = {function() starcraft.go_to_buffer("F10") end, "Go to Starcraft buffer F10"},
    ["<F11>"] = {function() starcraft.go_to_buffer("F11") end, "Go to Starcraft buffer F11"},
    ["<F12>"] = {function() starcraft.go_to_buffer("F12") end, "Go to Starcraft buffer F12"},
    ["["] = {
        name = "Previous",
        t = {function() todo_comments.jump_prev() end, "Jump to previous TODO comment"},
    },
    ["]"] = {
        name = "Next",
        t = {function() todo_comments.jump_next() end, "Jump to next TODO comment"},
    },
  },
  {}
)
