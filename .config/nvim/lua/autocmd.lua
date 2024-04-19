-- format on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*" },
  command = "FormatWrite",
})

-- don't create comment on newline
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]],
})

-- .todo files are markdown
-- vim.api.nvim_create_autocmd({ "BufRead, BufNewFile" }, {
  -- pattern = { "*.todo" },
 --  command = "setfiletype markdown",
-- })

-- ensure tab working dir matches cwd
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  pattern = { "*" },
  callback = function()
    local project_path = vim.fn.getcwd()
    vim.cmd.tcd(project_path)
  end,
})

-- rename tab to project name
-- vim.api.nvim_create_autocmd({ "DirChanged", "VimEnter", "BufRead" }, {
--   pattern = { "*" },
--   callback = function()
--     local project_path = vim.fn.getcwd()
--     local tab_name = require("tabby.feature.tab_name")

--     if tab_name and project_path ~= nil or project_path ~= "" then
--       local split_at = project_path:len() - project_path:reverse():find("/") + 2
--       local project_name = project_path:sub(split_at)
--       tab_name.set(0, project_name)
--     end
--   end,
-- })

-- share yanky clipboard between neovim instances
vim.api.nvim_create_autocmd({ "FocusGained", "FocusLost" }, {
  pattern = { "*" },
  command = [[if exists(':rshada') | rshada | endif]],
})

-- share yanky clipboard between neovim instances
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  pattern = { "*" },
  command = [[if exists(':rshada') | wshada | endif]],
})
