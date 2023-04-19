local util = require 'lspconfig.util'
local uv = vim.loop
local tcp_client = uv.new_tcp()

function allocate_port()
  -- try to connect to a random port between 5000 and 10000 and if we find one that has nothing on
  -- it we return it
  math.randomseed(os.time())
  local port = math.random(5000, 10000)
  local conn_refused = false
  local tries = 0
  while not conn_refused and tries < 10 do
    tcp_client:connect('127.0.0.1', port, function(err)
      if err then
        conn_refused = true
      end
    end)
    tries = tries + 1
  end

  return port
end

function start_and_connect_to_lsp()
  local port = allocate_port()
  vim.notify('allocated port: ' .. port, vim.log.levels.INFO)
  local lsp_command = 'lfe-ls --transport tcp --port ' .. port
  vim.fn.jobstart(lsp_command, {
    on_exit = function(_, code, _)
      if code ~= 0 then
        vim.notify('lfe-ls exited with code ' .. code, vim.log.levels.ERROR)
      end
    end,
    on_stderr = function(_, data, _)
      vim.notify('lfe-ls stderr: ' .. data, vim.log.levels.ERROR)
    end,
    on_stdout = function(_, data, _)
      local port_match = vim.fn.match(data, 'port: {ok,\\d\\+}')
      if port_match ~= -1 then
        local port_str = vim.fn.matchstr(data[1], "\\d\\+")
        local parsed_port = tonumber(port_str)
        if parsed_port ~= port then
          vim.notify('lfe-ls started on port ' .. parsed_port .. ' but we allocated ' .. port, vim.log.levels.ERROR)
        end
      end
    end,
  })

  return vim.lsp.rpc.connect('127.0.0.1', port)
end


local cmd = start_and_connect_to_lsp()
  
return {
  default_config = {
    cmd = cmd,
    filetypes = { 'lfe' },
    root_dir = util.root_pattern('rebar.config', 'erlang.mk', '.git', 'mix.exs'),
    single_file_support = true,
  },
  docs = {
    description = [[
    lfe-ls
]],
    default_config = {
      root_dir = [[root_pattern('rebar.config', 'erlang.mk', '.git', 'mix.exs')]],
    },
  },
}
