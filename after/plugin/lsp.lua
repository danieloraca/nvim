
local lsp_zero = require('lsp-zero')

lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
end)

-- here you can setup the language servers
lsps = {
  'bashls',
  'clangd',
  'cmake',
  'cssls',
  'dockerls',
  'gopls',
  'html',
  'jsonls',
  'pyright',
  'rust_analyzer',
  'tsserver',
  'phpactor',
  'vimls',
  'yamlls',
}

for _, lsp in ipairs(lsps) do
  require('lspconfig')[lsp].setup {
    on_attach = lsp_zero.on_attach,
  }
end

