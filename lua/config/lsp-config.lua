local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_format_on_save = function(bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

-- lsp-zero
local lsp = require('lsp-zero')

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'tsserver',
  'gopls',
  'rust_analyzer',
  'lua_ls',
  'tailwindcss',
  'prismals',
  'clangd',
  'svelte',
  'angularls',
  'jdtls'
})


lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
  --[[ lsp.default_keymaps({ buffer = bufnr }) ]]
  local opts = { buffer = bufnr, remap = false }
  lsp_format_on_save(bufnr)

  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = true })
  vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { buffer = true })
  vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', { buffer = true })
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})


lsp.set_preferences({
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
--[[ lsp.nvim_workspace() ]]
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.skip_server_setup({ 'jdtls' })

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
