local ih = require("lsp-inlayhints")
local lspconfig = require("lspconfig")
ih.setup()

local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

lspconfig.lua_ls.setup({
	on_attach = function(client, bufnr)
		ih.on_attach(client, bufnr)
	end,
	settings = {
		Lua = {
			hint = {
				enable = true,
			},
		},
	},
})

-- lspconfig.tsserver.setup({
-- 	on_attach = function(client, bufnr)
-- 		ih.on_attach(client, bufnr)
-- 	end,
-- 	settings = {
-- 		init_options = {
-- 			preferences = {
-- 				includeInlayParameterNameHints = "all",
-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
-- 				includeInlayFunctionParameterTypeHints = true,
-- 				includeInlayVariableTypeHints = true,
-- 				includeInlayPropertyDeclarationTypeHints = true,
-- 				includeInlayFunctionLikeReturnTypeHints = true,
-- 				includeInlayEnumMemberValueHints = true,
-- 				importModuleSpecifierPreference = "non-relative",
-- 			},
-- 		},
-- 	},
-- })
