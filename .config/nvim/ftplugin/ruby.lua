local opts = { noremap = true, silent = false }

-- Test
vim.api.nvim_set_keymap("n", "<leader>rr", ":TestFile<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rR", ":TestSuite<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rp", ":TestLast<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rl", ":TestNearest<CR>", opts)

-- Rails alt files
vim.api.nvim_set_keymap("n", "<leader>aa", ":A<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>av", ":AV<CR>", opts)
