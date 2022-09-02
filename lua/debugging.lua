local dap = require("dap")

dap.adapters.haskell = {
  type = 'executable';
  command = 'haskell-debug-adapter';
  args = { '--hackage-version=0.0.33.0' };
}
dap.configurations.haskell = {
  {
    type = 'haskell',
    request = 'launch',
    name = 'Debug',
    workspace = '${workspaceFolder}',
    startup = "${file}",
    stopOnEntry = false,
    logFile = vim.fn.stdpath('data') .. '/haskell-dap.log',
    logLevel = 'WARNING',
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

dapui.setup()

require("nvim-dap-virtual-text").setup()


vim.keymap.set("n", "<localleader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<localleader>B",
  function()
    dap.set_breakpoint(nil, nil, vim.fn.input('Breakpoint condition: '))
  end
)
vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<C-F1>", dap.close)
vim.keymap.set("n", "<F2>", dap.step_over)
vim.keymap.set("n", "<F3>", dap.step_into)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<localleader>dr", dap.repl.open)
vim.keymap.set("n", "<localleader>dl", dap.run_last)
vim.keymap.set("n", "<localleader>lp",
  function()
    dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
  end
)
vim.keymap.set("n", "<localleader>du", dapui.toggle)
