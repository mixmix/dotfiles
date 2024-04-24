-- Commands that are auto-run after vim events

-- format on save
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*" },
--   command = "FormatWrite",
-- })

-- Don't create comment on newline
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "*" },
--   command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]],
-- })
