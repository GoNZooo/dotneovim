local M = {}

local erl_call = "erl -noshell -sname neovim -eval"

M.beam_dev_helper_rpc = function(node, module, function_name)
  return "rpc:call(" .. node .. ", " .. module .. ", " .. function_name .. ", []), halt(0)."
end

M.execute_erlang_rpc_call = function(node, module, function_name)
  local command = erl_call .. " \"" .. M.beam_dev_helper_rpc(node, module, function_name) .. "\""
  vim.cmd(":silent !" .. command)
end

function execute(function_name)
  local filetype = vim.bo.filetype
  if filetype == "erlang" then
    M.execute_erlang_rpc_call("term@archlinux", "terminal_dev_helpers", function_name)
  elseif filetype == "elixir" then
    M.execute_erlang_rpc_call("term@archlinux", "'Elixir.TerminalDevHelpers'", function_name)
  end
end

M.compile = function()
  execute("compile")
end

M.run_tests = function()
  execute("run_tests")
end

return M
