-- A library for binding buffers to numbers for quick access, a'la Starcraft camera positions.
-- Inspired by `harpoon` by ThePrimeagen, but I wanted to bind any index at any time.
local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local buffer_table = {}

function buffer_name(buffer_number)
  local name = vim.api.nvim_buf_get_name(buffer_number)
  if name == "" then
    return "[No Name]"
  end

  return name
end

function persist_table()
  local table_string = vim.inspect(buffer_table)
  local has_starcraft_directory = vim.fn.isdirectory(".starcraft") == 1
  if not has_starcraft_directory then
    vim.fn.mkdir(".starcraft")
  end
  local file = io.open(".starcraft/buffers.lua", "w")
  file:write("return " .. table_string)
  file:close()
end

function with_trailing_slash(path)
  if string.sub(path, -1) == "/" then
    return path
  end

  return path .. "/"
end

function remove_cwd_prefix(cwd, filename)
  return string.gsub(filename, with_trailing_slash(cwd), "")
end

function M.load_table()
  if vim.fn.filereadable(".starcraft/buffers.lua") == 0 then
    return
  end
  buffer_table = loadfile(".starcraft/buffers.lua")()
end

function M.bind_buffer(index)
  local buffer_number = vim.api.nvim_get_current_buf()
  local buffer_name = buffer_name(buffer_number)
  if type(index) ~= "string" then
    index = tostring(index)
  end
  buffer_table[index] = buffer_name
  persist_table()
end

function M.go_to_buffer(index)
  if type(index) ~= "string" then
    index = tostring(index)
  end

  local buffer_name = buffer_table[index]
  if buffer_name == nil then
    print("No buffer bound to index " .. index .. ".")
    return
  end

  local buffer_number = vim.fn.bufnr(buffer_name)

  if buffer_number == -1 then
    buffer_number = vim.fn.bufadd(buffer_name)
    vim.fn.bufload(buffer_number)
  end

  vim.api.nvim_set_current_buf(buffer_number)
  vim.api.nvim_buf_set_option(buffer_number, "buflisted", true)
  -- since `bufload` always jumps to the start of the file we need to restore our cursor position
  if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
    vim.cmd("normal! g`\"")
  end
end

function M.pick_buffer()
  local buffer_list = {}
  for key, buffer in pairs(buffer_table) do
    table.insert(buffer_list, {key = key, buffer = buffer})
  end

  pickers.new({}, {
    prompt_title = "Starcraft Buffers",
    finder = finders.new_table {
      results = buffer_list,
      entry_maker = function(entry)
        local cwd = vim.fn.getcwd()
        local displayed_filename = remove_cwd_prefix(cwd, entry.buffer)
        local displayed_name = entry.key .. " = " .. displayed_filename
        
        return {
          value = entry.buffer,
          key = entry.key,
          ordinal = displayed_filename,
          display = displayed_name,
        }
      end,
    },
    sorter = conf.file_sorter({}),
    attach_mappings = function(prompt_filename)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry(prompt_filename)
        actions.close(prompt_filename)
        M.go_to_buffer(selection.key)
      end)

      return true
    end,
  }):find()
end

return M