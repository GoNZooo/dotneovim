local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

local function parse_tags_file()
    local lines = vim.fn.readfile("tags")
    local entries = {}

    for _, line in ipairs(lines) do
        if not vim.startswith(line, "!") then
            local tag, file, ex_cmd, rest = line:match("([^\t]+)\t([^\t]+)\t/(.-)/;\"(.*)")
            local lnum = rest and rest:match("line:(%d+)")
            if tag and file and ex_cmd then
                local short_file = vim.fn.fnamemodify(file, ":.")
                table.insert(entries, {
                    tag = tag,
                    file = file,
                    short_file = short_file,
                    pattern = ex_cmd,
                    lnum = tonumber(lnum),
                })
            end
        end
    end

    return entries
end

local function make_entry(entry)
    return {
        value = entry,
        display = string.format("%s [%s]", entry.tag, entry.short_file),
        ordinal = entry.tag .. " " .. entry.short_file,
        filename = entry.file,
        lnum = entry.lnum,
        pattern = entry.pattern,
    }
end

M.tag_search_picker = function()
    local entries = parse_tags_file()

    pickers.new({}, {
        prompt_title = "Search Tags",
        finder = finders.new_table {
            results = entries,
            entry_maker = make_entry,
        },
        sorter = conf.generic_sorter({}),
        previewer = conf.grep_previewer({}),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local entry = action_state.get_selected_entry().value
                vim.cmd(string.format("edit %s", vim.fn.fnameescape(entry.file)))
                vim.fn.search(entry.pattern)
            end)
            return true
        end,
    }):find()
end

return M
