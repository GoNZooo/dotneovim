M = {}

-- Runs `table-of-contents inject <file>`
local function inject(event)
  local file = event.match
  local cmd = string.format("table-of-contents inject %s", file)
  local ok, _, _ = vim.fn.system(cmd)
  if not ok then
    vim.fn.echoerr(string.format("Failed to inject table of contents into %s", file))
  end

  vim.fn.setbufvar(event.buf, "&modified", 0)
  vim.cmd([[edit %]])
end

local function enable_autocommand()
  -- Create augroup
  vim.api.nvim_create_augroup("TableOfContents", { clear = true })

  -- Run `table-of-contents inject <file>` on every buffer change
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = "TableOfContents",
    pattern = "*.md",
    callback = function(file)
      inject(file)
    end
  })
end

local function disable_autocommand()
  vim.api.nvim_del_augroup_by_name("TableOfContents")
end

function M.setup()
  -- Create vim user commands for enabling and disabling the autocommands
  vim.api.nvim_create_user_command("TableOfContentsEnable", enable_autocommand, {})
  vim.api.nvim_create_user_command("TableOfContentsDisable", disable_autocommand, {})
end

return M
