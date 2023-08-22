local whichKey = require("which-key")

local erl_call = "erl -noshell -sname neovim -eval"

local Erlang = {}
local Golang = {}

Erlang.beam_dev_helper_rpc = function(node, module, function_name)
  return "rpc:call(" .. node .. ", " .. module .. ", " .. function_name .. ", []), halt(0)."
end

Erlang.execute_erlang_rpc_call = function(node, module, function_name)
  local command = erl_call .. " \"" .. M.beam_dev_helper_rpc(node, module, function_name) .. "\""
  vim.cmd(":silent !" .. command)
end

function execute(function_name)
  local filetype = vim.bo.filetype
  if filetype == "erlang" then
    Erlang.execute_erlang_rpc_call("term@archlinux", "terminal_dev_helpers", function_name)
  elseif filetype == "elixir" then
    Erlang.execute_erlang_rpc_call("term@archlinux", "'Elixir.TerminalDevHelpers'", function_name)
  end
end

Erlang.compile = function()
  execute("compile")
end

Erlang.run_tests = function()
  execute("run_tests")
end

Golang.go_to_test_file = function()
  local current_file = vim.fn.expand("%:p")
  -- NOTE: `%` is used for escaping characters in Lua
  local test_file = current_file:gsub("%.go", "_test.go")
  vim.cmd(":e " .. test_file)
end

beam_which_bindings = function()
  whichKey.register({
    ["<localleader>"] = {
      name = "BEAM",
      c = { Erlang.compile, "Compile" },
      t = { Erlang.run_tests, "Run tests" },
    }
  })
end

golang_which_bindings = function()
  whichKey.register({
    ["<localleader>"] = {
      name = "Go",
      T = { Golang.go_to_test_file, "Go to test file" },
    },
  })
end

vim.api.nvim_create_augroup("WhichBindings", {
  clear = false
})

vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = {"*.ex", "*.exs", "*.erl", "*.hrl"},
  group = "WhichBindings",
  callback = function()
    beam_which_bindings()
  end,
})

vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = {"*.go", "go.mod"},
  group = "WhichBindings",
  callback = function()
    golang_which_bindings()
  end,
})
