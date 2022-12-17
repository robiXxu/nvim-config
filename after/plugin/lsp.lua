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

	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	map("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	-- map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	map("n", "<leader>c", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
	map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	map("n", "[g", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	map("n", "]g", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	-- map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
	map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)


end)

lsp.setup()
