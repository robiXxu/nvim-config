local lsp = require('lsp-zero')
local map = vim.keymap.set

lsp.preset('recommended')

lsp.ensure_installed({
  "tsserver",
  "eslint",
  "sumneko_lua",
  "rust_analyzer",
  "gopls",
  "html",
  "cssls",
  "yamlls",
  "ruby_ls",
  "marksman",
  "jsonls",
  "sqlls",
--  "solargraph",
})


-- local cmp = require("cmp")
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({select=true}),
--   ['<C-Space>'] = cmp.mapping.complete(),
-- })

-- lsp.setup_nvim_cmp({
--   mappings = cmp_mappings
-- })


lsp.on_attach(function(client, bufnr)
  local opts = {
    buffer = bufnr,
    remap = false
  }

	map("n", "gD", vim.lsp.buf.declaration, opts)
	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "gh", vim.lsp.buf.hover, opts)
	map("n", "gi", vim.lsp.buf.implementation, opts)
	map("n", "gr", vim.lsp.buf.references, opts)
	map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	-- map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	-- map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	map("n", "<leader>r", vim.lsp.buf.rename, opts)
	map("n", "<leader>c", vim.lsp.buf.code_action, opts)
	-- map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
	map("n", "<leader>e", vim.diagnostic.open_float, opts)
	map("n", "[g", vim.diagnostic.goto_prev, opts)
	map("n", "]g", vim.diagnostic.goto_next, opts)

	-- map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
	map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)


end)

lsp.setup()
