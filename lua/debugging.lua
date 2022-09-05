local dap = require("dap")

dap.adapters.haskell = {
  type = "executable";
  command = "haskell-debug-adapter";
  args = { "--hackage-version=0.0.33.0" };
}
dap.configurations.haskell = {
  {
    type = "haskell",
    request = "launch",
    name = "Debug",
    workspace = "${workspaceFolder}",
    startup = "${file}",
    stopOnEntry = false,
    logFile = vim.fn.stdpath("data") .. "/haskell-dap.log",
    logLevel = "WARNING",
    ghciEnv = vim.empty_dict(),
    ghciPrompt = "Q> ",
    ghciInitialPrompt = "Q> ",
    ghciCmd = "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
    mainArgs = function()
      local argument_string = vim.fn.input("Arguments: ")
      return argument_string
    end,
  },
}

local dapui = require("dapui")

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        "repl",
      },
      size = 0.30, -- 40 columns
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

require("nvim-dap-virtual-text").setup()


vim.keymap.set("n", "<localleader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<localleader>B",
  function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))
  end
)
vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<C-F1>", dap.close)
vim.keymap.set("n", "<F2>", dap.step_over)
vim.keymap.set("n", "<F3>", dap.step_into)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<localleader>dr",
  function()
    dapui.float_element("repl")
  end
)
vim.keymap.set("n", "<localleader>dl", dap.run_last)
vim.keymap.set("n", "<localleader>lp",
  function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  end
)
vim.keymap.set("n", "<localleader>du", dapui.toggle)
