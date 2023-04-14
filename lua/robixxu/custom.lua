local attach_to_buffer = function(bufnr, pattern, command)
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("robixxu-automagic", { clear = true }),
		pattern = pattern,
		callback = function()
			local append_data = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
				end
			end

			vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "OUTPUT: " })

			vim.fn.jobstart(command, {
				stdout_buffered = true,
				on_stdout = append_data,
				on_stderr = append_data,
			})
		end,
	})
end

vim.api.nvim_create_user_command("StartAuto", function()
	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(
		buf,
		false,
		{ relative = "win", width = 60, col = 190, row = 0, height = 10, anchor = "NE", style = "minimal" }
	)

	attach_to_buffer(buf, "*go", { "go", "run", "main.go" })

	vim.api.nvim_create_user_command("StopAuto", function()
		vim.api.nvim_win_close(win, true)
	end, {})
end, {})

-- vim.o.autoread = true
-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained", "BufWritePost" }, {
--   pattern = "lua",
--   callback = function()
--   end
-- })

vim.api.nvim_create_augroup("robixxu-autoformat", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	-- pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	callback = function()
		vim.cmd("silent Neoformat")
	end,
	group = "robixxu-autoformat",
})
