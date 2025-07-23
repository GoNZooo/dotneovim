local M = {}

M.last_build_command = {}
M.marks = {}
M.namespace_id = 0

function load_configurations()
    -- Configurations are stored in `$cwd/build-commands.lua`
    -- And specify
    -- {
    --     ["Name of command"] = {
    --         {
    --             command = "command to run",
    --             error_pattern = "regex pattern to find errors in output",
    --         },
    --         {
    --             command = "other command to run",
    --             error_pattern = "regex pattern to find errors in this command output",
    --         },
    --     }
    -- }
    
    local config_path = vim.fn.getcwd() .. "/build-commands.lua"
    if vim.fn.filereadable(config_path) == 1 then
        local config = dofile(config_path)
        if type(config) == "table" then
            return config
        else
            vim.api.nvim_err_writeln("Invalid configuration format in " .. config_path)
        end
    else
        vim.api.nvim_err_writeln("Configuration file not found: " .. config_path)
    end
end

function M.select_build_command()
    local config = load_configurations()
    if not config then
        return
    end

    local commands = {}
    for name, cmds in pairs(config) do
        local current_commands = {}
        for _, cmd in ipairs(cmds) do
            table.insert(current_commands, {command = cmd.command, error_pattern = cmd.error_pattern})
        end
        table.insert(commands, {name = name, commands = current_commands})
    end

    if #commands == 0 then
        vim.api.nvim_err_writeln("No build commands found in configuration.")
        return
    end

    local function on_choice(choice)
        if choice and choice then
            M.run_build_command(choice)
        end
    end

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    function entry_maker(entry)
        return {
            value = entry,
            display = entry.name,
            ordinal = entry.name,
            commands = entry.commands,
            on_choice = on_choice,
        }
    end
    function attach_mappings(prompt_buffer_number, map)
        actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            if selection then
                selection.on_choice(selection.value)
            end
        end)
        return true
    end
    pickers.new({
        prompt_title = "Select Build Command",
        finder = finders.new_table({
            results = commands,
            entry_maker = entry_maker,
        }),
        sorter = conf.generic_sorter(opts),
        entry_maker = entry_maker,
        attach_mappings = attach_mappings,
    }):find()
end

function M.run_build_command(command_spec)
    M.last_build_command = command_spec

    local all_output = ""
    local errors = {}
    for i, cmd in ipairs(command_spec.commands) do
        all_output = all_output .. "> " .. cmd.command .. "\n"
        local current_output = vim.fn.system(cmd.command)
        all_output = all_output .. current_output

        for line in current_output:gmatch("[^\n]+") do
            -- if cmd.error_pattern is not undefined or "", we want to match on it
            if cmd.error_pattern ~= "" and line:match(cmd.error_pattern) then
                -- Filenames: group 1
                -- Line: group 2
                -- Column: group 3
                -- Error message: group 4
                local filename, line_num, col_num, message = line:match(cmd.error_pattern)
                local matching_error = {
                    filename = filename or "unknown",
                    lnum = tonumber(line_num) or 0,
                    col = tonumber(col_num) or 0,
                    text = message or "Unknown error",
                }

                table.insert(errors, matching_error)
            end
        end

        if i ~= #command_spec.commands then
            all_output = all_output .. "\n\n"
        end

        local has_error = vim.v.shell_error ~= 0
        if has_error then
            -- break from our loop, we don't need to run more commands, but we want to display the
            -- errors we have
            vim.api.nvim_err_writeln("Command failed: " .. cmd.command)
            break
        end
    end

    if M.namespace_id == 0 then
        M.namespace_id = vim.api.nvim_create_namespace("build_errors")
    end

    if #M.marks > 0 then
        for _, mark in ipairs(M.marks) do
            vim.api.nvim_buf_del_extmark(mark.bufnr, M.namespace_id, mark.id)
        end
    end

    if #errors > 0 then
        vim.fn.setqflist({}, ' ', { title = "Build Errors", items = errors })
        for _, error in ipairs(errors) do
            local bufnr = vim.fn.bufnr(error.filename)
            if bufnr ~= -1 then
                local mark_id = vim.api.nvim_buf_set_extmark(bufnr, M.namespace_id, error.lnum - 1, 0, {
                    virt_text = {{error.text, "Error"}},
                    virt_text_pos = "eol",
                    hl_mode = "combine",
                })
                table.insert(M.marks, {bufnr = bufnr, id = mark_id})
            end
        end
        -- Open the quickfix window
        vim.cmd("copen")
    else
        vim.api.nvim_out_write("No errors found in command output.\n")
    end

    local floating_buffer = vim.api.nvim_create_buf(false, true)
    local ui = vim.api.nvim_list_uis()[1]
    local options = {
        relative = "editor",
        width = math.floor(ui.width * 0.5),
        height = math.floor(ui.height * 0.9),
        row = math.floor((ui.height - math.floor(ui.height * 0.9)) / 2),
        col = math.floor((ui.width - math.floor(ui.width * 0.5))),
        style = "minimal",
    }
    vim.api.nvim_open_win(floating_buffer, true, options)
    vim.api.nvim_buf_set_lines(floating_buffer, 0, -1, false, vim.split(all_output, "\n"))
    vim.api.nvim_buf_set_option(floating_buffer, 'modifiable', false)
    vim.api.nvim_buf_set_option(floating_buffer, 'filetype', 'build_output')
    vim.api.nvim_buf_set_option(floating_buffer, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(floating_buffer, 'winfixheight', true)
    vim.api.nvim_buf_set_option(floating_buffer, 'winfixwidth', true)
    vim.api.nvim_buf_set_option(floating_buffer, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(floating_buffer, 'swapfile', false)
    vim.api.nvim_buf_set_option(floating_buffer, 'buflisted', false)
end

function M.run_last_command()
    if not M.last_build_command then
        vim.api.nvim_err_writeln("No last build command found. Please select a build command first.")
        return
    end

    M.run_build_command(M.last_build_command)
end

return M
