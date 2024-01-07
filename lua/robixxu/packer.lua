-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		{
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			after = "telescope.nvim",
			run = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		{
			"nvim-telescope/telescope-symbols.nvim",
			after = "telescope.nvim",
		},
	})

	-- use('mrjones2014/smart-splits.nvim')
	-- -- or use a specific version
	-- use({ 'mrjones2014/smart-splits.nvim', tag = 'v1.0.0' })
	-- -- -- to use Kitty multiplexer support, run the post install hook
	-- -- use({ 'mrjones2014/smart-splits.nvim', run = './kitty/install-kittens.bash' })

	-- Theme
	use("marko-cerovac/material.nvim")

	use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
	use({
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	})

	-- LuaLine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Syntax highlighting & more
	use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
	use("nvim-treesitter/playground")

	-- better buffer switch?
	--use({"theprimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" }})

	-- undo tree <leader>u
	use("mbbill/undotree")

	use("tpope/vim-fugitive")

	-- Fuzzy Finder
	use({ "junegunn/fzf", run = ":call fzf#install()" })
	use({ "junegunn/fzf.vim" })

	-- => cs`" = change surrounding ` to "
	use("tpope/vim-surround")

	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- easy comments
	use("tpope/vim-commentary")
	-- use("tomtom/tcomment_vim")

	-- LSP & snippets
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
      { "lvimuser/lsp-inlayhints.nvim" },
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use("sbdchd/neoformat")

	--use("github/copilot.vim")
	-- use({
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			suggestion = { enabled = false },
	-- 			panel = { enabled = false },
	-- 		})
	-- 	end,
	-- })

	-- use({
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- })

	use({ "lewis6991/gitsigns.nvim", tag = "release" })
	use({ "ThePrimeagen/git-worktree.nvim" })

	use({ "stevearc/vim-arduino" })

	-- vgit
	-- use {
	--   'tanvirtin/vgit.nvim',
	--   requires = {
	--     'nvim-lua/plenary.nvim'
	--   }
	-- }

	-- use({
	--   'akinsho/bufferline.nvim',
	--   tag = "v3.*",
	--   requires = 'nvim-tree/nvim-web-devicons'
	-- })

	-- floating signature
	use("ray-x/lsp_signature.nvim")

	-- db client
	use({ "kristijanhusak/vim-dadbod-ui", requires = { "tpope/vim-dadbod" } })

	-- debugging
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({ "theHamsta/nvim-dap-virtual-text", requires = { "mfussenegger/nvim-dap" } })
	use({ "nvim-telescope/telescope-dap.nvim", requires = { "mfussenegger/nvim-dap" } })

	use({ "suketa/nvim-dap-ruby", requires = { "mfussenegger/nvim-dap" } })
	-- This was supposed to allow per project configuration. doesn't seem to work
	-- use({ 'ldelossa/nvim-dap-projects', requires = { "mfussenegger/nvim-dap" }})

	use({ "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim" } })

	--use({ 'suketa/nvim-dap-ruby', requires = {"mfussenegger/nvim-dap"} })
	--use({ "leoluz/nvim-dap-go", requires = {"mfussenegger/nvim-dap"} })
end)
