local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_format_on_save = function(bufnr)
  vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

local lsp = require('lsp-zero')

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'tsserver',
  'gopls',
    'rust_analyzer'
})

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
    lsp_format_on_save(bufnr)

    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = true})
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', {buffer = true})
    vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', {buffer = true})
end)


-- (Optional) Configure lua language server for neovim
--[[ lsp.nvim_workspace() ]]

lsp.setup()
