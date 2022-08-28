require('orgmode').setup_ts_grammar()

require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'haskell',
    'rust',
    'lua',
    'python',
    'javascript',
    'typescript',
    'html',
    'css',
    'json',
    'markdown',
    'yaml',
    'kotlin',
    'nix',
    'org',
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = { 'org' },
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
}

require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>ep', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>en', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr) -- client, bufnr
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<space>R', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>gg', vim.lsp.buf.workspace_symbol, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', ',,', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', ',=', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local cmp = require 'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
    { name = 'orgmode' },
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.sumneko_lua.setup {
  on_attach = on_attach, flags = lsp_flags, capabilities = capabilities
}
lspconfig.pyright.setup {
  on_attach = on_attach, flags = lsp_flags, capabilities = capabilities
}
lspconfig.tsserver.setup {
  on_attach = on_attach, flags = lsp_flags, capabilities = capabilities
}
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
lspconfig.kotlin_language_server.setup {
  on_attach = on_attach, flags = lsp_flags, capabilities = capabilities
}
lspconfig.jsonls.setup {
  on_attach = on_attach, flags = lsp_flags, capabilities = capabilities
}
lspconfig.marksman.setup {
  on_attach = on_attach, flags = lsp_flags, capabilities = capabilities
}

vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.hs lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.tsx? lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.md lua vim.lsp.buf.formatting_sync()]]
-- vim.cmd [[autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()]]

require('orgmode').setup({
  org_agenda_files = { '~/org/*' },
  org_default_notes_file = '~/org/notes.org',
})

require('table-of-contents').setup()
