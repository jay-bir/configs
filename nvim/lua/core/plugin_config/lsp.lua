local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
  'clangd',
  'pyright',
  'dockerls',
  'bashls',
  'lua_ls'
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = true})
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function () vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function () vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function () vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function () vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<c-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
