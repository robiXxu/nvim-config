local actions = require("telescope.actions")
local lactions = require("telescope.actions.layout")
local finders = require("telescope.builtin")

require("telescope").setup({
	defaults = {
    layout_strategy = 'vertical',
		file_ignore_patterns = {
			"node_modules",
			"vendor",
			".git",
			".yardoc",
			"doc",
		},
		prompt_prefix = " ❯ ",
		initial_mode = "insert",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
				["<C-s>"] = actions.send_selected_to_qflist,
				["<C-q>"] = actions.send_to_qflist,
				["<C-h>"] = lactions.toggle_preview,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- "smart_case" | "ignore_case" | "respect_case"
		},
	},
})

require("telescope").load_extension("git_worktree")

local Telescope = setmetatable({}, {
	__index = function(_, k)
		if vim.bo.filetype == "NvimTree" then
			vim.cmd.wincmd("l")
		end
		return finders[k]
	end,
})

local opts = {
  --cwd = vim.fn.expand("%:p:h")
}

-- Ctrl-p = fuzzy finder
vim.keymap.set("n", "<C-P>", function()
	local ok = pcall(Telescope.find_files, { show_untracked = true })
	if not ok then
		Telescope.find_files(opts)
	end
end)

-- Get :help at the speed of light
vim.keymap.set("n", "<leader>H", Telescope.help_tags)

-- vim.keymap.set("n", "<leader>q", Telescope.)

-- Fuzzy find active buffers
vim.keymap.set("n", "'b", function()
  Telescope.buffers(opts)
end)
vim.keymap.set("n", "'w", function()
  Telescope.grep_string(opts)
end)

-- Search for string
vim.keymap.set("n", "'r", function()
  Telescope.live_grep(opts)
end)

-- Fuzzy find changed files in git
vim.keymap.set("n", "'c", function()
  Telescope.git_status(opts)
end)
vim.keymap.set("n", "<leader>g", Telescope.git_commits)

vim.keymap.set("n", "'gs", require("telescope").extensions.git_worktree.git_worktrees);
vim.keymap.set("n", "'gc", require("telescope").extensions.git_worktree.create_git_worktree);
