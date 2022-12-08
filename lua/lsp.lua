require("nvim-lsp-installer").setup {}

local lspconfig = require("lspconfig")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

local telescope = require("telescope.builtin")

local null_ls = require("null-ls")

null_ls.setup({
  on_attach = function(client, _) -- client, bufnr
    if client.server_capabilities.documentFormattingProvider then
      -- format on save
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
  sources = {
    null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
  },
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Disable formatting for tsserver (this should be handled by null-ls)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "<localleader>r", telescope.lsp_references, bufopts)
  vim.keymap.set("n", "<localleader>S", telescope.lsp_document_symbols, bufopts)
  vim.keymap.set("n", "<localleader>s", telescope.lsp_workspace_symbols, bufopts)
  vim.keymap.set("n", "<localleader>d", telescope.diagnostics, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", ",,", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", ",=", vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
--
-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.sumneko_lua.setup {
  on_attach = on_attach, flags = lsp_flags, capabilities = capabilities
}

lspconfig.pyright.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }
lspconfig.tsserver.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.hls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    ["haskell"] = {
      plugin = {
        tactics = {
          globalOn = false,
        },
      }
    }
  }
}

lspconfig.jsonls.setup {
  on_attach = on_attach, flags = lsp_flags, capabilities = capabilities
}

lspconfig.eslint.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.elixirls.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.serve_d.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

lspconfig.purescriptls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    ["purescript"] = {
      ["formatter"] = "tidy",
      ["addImportOnCompletion"] = true
    }
  }
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach, flags = lsp_flags, capabilities = capabilities
}

lspconfig.clangd.setup { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

local prettier = require("prettier")

prettier.setup({
  bin = "prettierd",
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
  },
})

-- Lua
vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync()]]

-- Haskell
vim.cmd [[autocmd BufWritePre *.hs lua vim.lsp.buf.formatting_sync()]]

-- PureScript
vim.cmd [[autocmd BufWritePre *.purs lua vim.lsp.buf.formatting_sync()]]

-- Elixir
vim.cmd [[autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync()]]

-- Rust
vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync()]]

-- C
vim.cmd [[autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.h lua vim.lsp.buf.formatting_sync()]]

-- C++
vim.cmd [[autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.hpp lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.cc lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.hh lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.cxx lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.hxx lua vim.lsp.buf.formatting_sync()]]

local disable_auto_formatting = function()
  vim.cmd [[autocmd WinEnter <buffer> set eventignore+=BufWritePre]]
  vim.cmd [[autocmd WinLeave <buffer> set eventignore-=BufWritePre]]
end

vim.api.nvim_create_user_command("DisableAutoFormattingForBuffer", disable_auto_formatting, {})
