----------------------------------
-- LSP Setup ---------------------
----------------------------------
local metals_config = require("metals").bare_config()
local map = vim.keymap.set

-- Example of settings
metals_config.settings = {
	showImplicitArguments = true,
	excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}
metals_config.init_options.statusBarProvider = "on"

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
-- metals_config.init_options.statusBarProvider = "on"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
metals_config.capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Debug settings if you're using nvim-dap
local dap = require("dap")

dap.configurations.scala = {
	{
		type = "scala",
		request = "launch",
		name = "RunOrTest",
		metals = {
			runType = "runOrTestFile",
			--args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
		},
	},
	{
		type = "scala",
		request = "launch",
		name = "Test Target",
		metals = {
			runType = "testTarget",
		},
	},
}

metals_config.on_attach = function(client, bufnr)
	local opts = {
		buffer = bufnr,
		remap = false,
	}
	require("metals").setup_dap()

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

	--map("n", "gH", require("metals").worksheet_hover, opts)
	--map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>')
end

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	-- NOTE: You may or may not want java included here. You will need it if you
	-- want basic Java support but it may also conflict if you are using
	-- something like nvim-jdtls which also works on a java filetype autocmd.
	pattern = { "scala", "sbt", "java" },
	callback = function()
		if string.find(vim.api.nvim_buf_get_name(0), "build.sbt") ~= nil then
      return
		end
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})
