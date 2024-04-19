local cmp = require("cmp")
local opts = { noremap = true, silent = false }

cmp.setup.buffer({
	sources = {},
})

vim.api.nvim_buf_set_keymap(0, "n", "<leader><leader>", "<Cmd>lua require('markdown-togglecheck').toggle()<CR>", opts)

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
	pattern = { ".todo" },
	command = "silent write",
})

if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
	vim.opt_local.conceallevel = 2
	local function map(...)
		vim.api.nvim_buf_set_keymap(0, ...)
	end

	-- autosave files
	-- vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
	--   pattern = { "*.md" },
	--   command = "silent write",
	-- })

	-- Open the link under the caret.
	map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

	-- Create a new note after asking for its title.
	-- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
	-- map("n", "zc", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
	-- Create a new note in the same directory as the current buffer, using the current selection for title.
	map("v", "zct", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
	-- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
	map(
		"v",
		"zcc",
		":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
		opts
	)

	-- Open notes linking to the current buffer.
	-- map("n", "<leader>nb", "<Cmd>ZkBacklinks<CR>", opts)
	-- Alternative for backlinks using pure LSP and showing the source context.
	map("n", "zb", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- Open notes linked by the current buffer.
	map("n", "zl", "<Cmd>ZkLinks<CR>", opts)
	map("n", "zi", "<Cmd>ZkInsertLink<CR>", opts)
	map("v", "zi", ":'<,'>ZkInsertLinkAtSelection<CR>", opts)

	-- Preview a linked note.
	map("n", "k", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- Open the code actions for a visual selection.
	map("v", "<leader>na", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
end
