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

	-- Theme
	-- use({
	-- 	"rose-pine/neovim",
	-- 	as = "rose-pine",
	-- 	config = function()
	-- 		-- vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- })

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
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})

	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})

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
	use({ "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim" } })

	--use({ 'suketa/nvim-dap-ruby', requires = {"mfussenegger/nvim-dap"} })
	--use({ "leoluz/nvim-dap-go", requires = {"mfussenegger/nvim-dap"} })
end)
