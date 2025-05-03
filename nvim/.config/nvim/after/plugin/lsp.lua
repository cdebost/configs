local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr}
  local bind = vim.keymap.set

  bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  bind('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  bind('n', '<leader>dl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
end)

lsp.setup()
