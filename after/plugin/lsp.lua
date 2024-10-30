local lsp = require("lsp-zero")
local map = vim.keymap.set

lsp.preset("recommended")

lsp.ensure_installed({
	"clangd",
	-- "tsserver",
	"eslint",
	-- "rust_analyzer",
	"gopls",
	"html",
	"cssls",
	"yamlls",
	"marksman",
	"jsonls",
	"sqlls",
	"vvtslstsls",
	"solargraph",
})

local on_attach = function(client, bufnr)
	local opts = {
		buffer = bufnr,
		remap = false,
	}

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true)
	end

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
	map("n", "<leader>so", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)

	--lsp.buffer_autoformat()
end

-- print(vim.inspect(lsp.configure))
require("mason").setup()
require("mason-lspconfig").setup()

lsp.on_attach(on_attach)
lsp.nvim_workspace()
lsp.setup({
	flags = {
		debounce_text_changes = 2,
	},
})


vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = true,
})
