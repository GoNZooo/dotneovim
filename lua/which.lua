local whichKey = require("which-key")
local todo_comments = require("todo-comments")
local build_command = require("build-command")
local tag_picker = require("tag_picker")
local telescope = require("telescope.builtin")

function create_or_open_file()
    local file = vim.fn.input("File name: ")
    local path = vim.fn.expand("%:p:h") .. "/" .. file
    vim.cmd("edit " .. path)
end

local which_key_spec = 
  {
    { "-", group = "File Tree" },
    { "--", "<cmd>Oil<CR>", desc = "Open Oil in current directory" },
    { "-a", function() create_or_open_file() end, desc = "Create or open file" },
    { "<C-h>", "<C-w>h", desc = "Move to left window" },
    { "<C-j>", "<C-w>j", desc = "Move to bottom window" },
    { "<C-k>", "<C-w>k", desc = "Move to top window" },
    { "<C-l>", "<C-w>l", desc = "Move to right window" },
    { "<leader><TAB>", "<C-6>", desc = "Switch to last open buffer" },
    { "<leader><leader>", group = "Source files" },
    { "<leader><leader>L", "<cmd>source ~/.config/nvim/lua/config.lua<CR>", desc = "Config" },
    { "<leader><leader>R", "<cmd>source ~/.config/nvim/init.vim<CR>", desc = "Reload" },
    { "<leader><leader>S", "<cmd>source ~/.config/nvim/lua/snippets.lua<CR>", desc = "Snippets" },
    { "<leader>G", group = "git" },
    { "<leader>GB", "<cmd>Git blame<CR>", desc = "Blame" },
    { "<leader>GC", "<cmd>Git commit<CR>", desc = "Commit" },
    { "<leader>GG", "<cmd>Git<CR>", desc = "Status" },
    { "<leader>GL", "<cmd>Git log<CR>", desc = "Log" },
    { "<leader>GP", "<cmd>Git push<CR>", desc = "Push" },
    { "<leader>Gl", "<cmd>Telescope git_commits<CR>", desc = "Log" },
    { "<leader>Gp", "<cmd>Git pull<CR>", desc = "Pull" },
    { "<leader>s", tag_picker.tag_search_picker, desc = "Search tags" },
    { "<leader>T", group = "TODO comments" },
    { "<leader>TT", function() vim.cmd("TodoTelescope keywords=TODO,FIX") end, desc = "Search TODO & FIX" },
    { "<leader>Ta", function() vim.cmd("TodoTelescope") end, desc = "Show all" },
    { "<leader>t", group = "Terminal" },
    { "<leader>tT", "<cmd>tabnew +terminal<CR>", desc = "Terminal Tab" },
    { "<leader>tt", "<cmd>rightbelow vnew +terminal<CR>", desc = "Terminal" },
    { "<localleader>B", build_command.select_build_command, desc = "Select Build Command" },
    { "<localleader>b", build_command.run_last_command, desc = "Run Last Build Command" },
    { "[", group = "Previous" },
    { "[t", function() todo_comments.jump_prev() end, desc = "Jump to previous TODO comment" },
    { "]", group = "Next" },
    { "]t", function() todo_comments.jump_next() end, desc = "Jump to next TODO comment" },
    { "gd", "g<C-]>", desc = "Go to definition"},
    -- Telescope bindings
    { "<leader>ff", function() telescope.find_files({ hidden = true, no_ignore = true }) end, desc = "Find files" },
    { "<leader>gg", function() telescope.git_files() end, desc = "Git files" },
    { "<leader>bb", function() telescope.buffers() end, desc = "Buffers" },
    { "<leader>/", function() telescope.live_grep() end, desc = "Live grep" },
    { "<leader>*", function() telescope.grep_string() end, desc = "Grep string" },
    { "<leader>hc", function() telescope.commands() end, desc = "Commands" },
    { "<leader>hh", function() telescope.help_tags() end, desc = "Help tags" },
    { "<leader>Gc", function() telescope.git_commits() end, desc = "Git commits" },
    { "<leader>GB", function() telescope.git_bcommits() end, desc = "Git bcommits" },
    { "<leader>Gb", function() telescope.git_branches() end, desc = "Git branches" },
    { "<leader>Gs", function() telescope.git_status() end, desc = "Git status" },
  }

--map <leader>cd :lcd %:p:h<CR>

function file_dir()
    return vim.fn.expand("%:p:h") .. "/"
end

vim.keymap.set("n", "<leader>ew", function() return ":ew " .. file_dir() end, {desc = "Edit path in same window", noremap = true, expr = true})
vim.keymap.set("n", "<leader>et", function() return ":tabedit " .. file_dir() end, {desc = "Edit path in new tab", noremap = true, expr = true})
vim.keymap.set("n", "<leader>ev", function() return ":vsplit " .. file_dir() end, {desc = "Edit path in new vertical split"})
vim.keymap.set("n", "<leader>es", function() return ":split " .. file_dir() end, {desc = "Edit path in new horizontal split"})

vim.keymap.set("n", "/", "<Plug>(easymotion-sn)", {desc = "Search in buffer", noremap = true})
vim.keymap.set("o", "/", "<Plug>(easymotion-tn)", {desc = "Search in buffer", noremap = true})

whichKey.add(which_key_spec)
