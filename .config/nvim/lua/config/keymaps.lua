-- Tabs Mapping
vim.keymap.set("n", "<leader>tt", vim.cmd.tabnew, { silent = true })
vim.keymap.set("n", "<leader>tn", vim.cmd.tabNext, { silent = true })
vim.keymap.set("n", "<leader>tb", vim.cmd.tabprevious, { silent = true })
vim.keymap.set("n", "<leader>tx", vim.cmd.tabclose, { silent = true })

-- Telescope Maping:
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>ft", builtin.git_files, { desc = "[F]ind gi[T]" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind  [F]iles" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
