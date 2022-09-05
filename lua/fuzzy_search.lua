require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>")
vim.keymap.set("n", "<leader>gg", "<cmd>Telescope git_files<CR>")
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>*", "<cmd>Telescope grep_string<CR>")
vim.keymap.set("n", "<leader>hc", "<cmd>Telescope commands<CR>")
vim.keymap.set("n", "<leader>hh", "<cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>Gc", "<cmd>Telescope git_commits<CR>")
vim.keymap.set("n", "<leader>GB", "<cmd>Telescope git_bcommits<CR>")
vim.keymap.set("n", "<leader>Gb", "<cmd>Telescope git_branches<CR>")
vim.keymap.set("n", "<leader>Gs", "<cmd>Telescope git_status<CR>")
