-- define variables for this file
local map = vim.api.nvim_set_keymap
local telescope = require("telescope.builtin")
local opts = { noremap = true, silent = false }

-- CLEAR HIGHLIGHTED SEARCH
vim.keymap.set("n", "<esc>", vim.cmd.noh)

-- -- RENAMING
-- map("n", "<leader>R", ":%s/<C-r><C-w>/", opts)

-- -- YANKY - clipboard history
-- vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
-- vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
-- vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
-- vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
-- vim.keymap.set("n", "<C-d>", "<Plug>(YankyCycleForward)")
-- vim.keymap.set("n", "<C-g>", "<Plug>(YankyCycleBackward)")
-- -- vim.keymap.set("n", "<leader>Y", function()
-- --   require("telescope").extensions.yank_history.yank_history()
-- -- end, { desc = "[Y]ank history" })

-- -- SCROLLING/SEARCH
-- vim.keymap.set("", "<C-s>", "<C-b>zz", opts)
-- vim.keymap.set("", "<C-t>", "<C-f>zz", opts)
-- vim.keymap.set("n", "m", "nzz", opts)
-- vim.keymap.set("n", "M", "Nzz", opts)
-- vim.keymap.set("n", "<C-b>", "", opts)
-- vim.keymap.set("n", "<C-f>", "", opts)

-- MOVING LINES
-- move current line up/down
map("n", "<C-k>", ":<C-u>m-2<CR>==", opts)
map("n", "<C-j>", ":<C-u>m+<CR>==", opts)
-- move selected lines up/down
map("x", "<C-k>", ":m-2<CR>gv=gv", opts)
map("x", "<C-j>", ":m'>+<CR>gv=gv", opts)

-- BUFFERS
map("n", "<C-h>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<C-l>", "<Cmd>BufferNext<CR>", opts)
map("n", "<C-w>", "<Cmd>BufferClose<CR>", opts)

-- BarbarDisable
-- BarbarEnable

-- BUFFERs as Tabs
-- -- map("n", "<header>ta", ":$tabnew<CR>", { noremap = true, desc = "[t]ab [a]dd" })
-- -- map("n", "<leader>tc", ":tabclose<CR>", { noremap = true, desc = "[t]ab [c]lose" })
-- -- map("n", "<leader>to", ":tabonly<CR>", { noremap = true, desc = "[t]ab [o]nly" })
-- -- map("n", "<leader>tn", ":tabn<CR>", { noremap = true, desc = "[t]ab [n]ext" })
-- -- map("n", "<leader>tp", ":tabp<CR>", { noremap = true, desc = "[t]ab [p]revious" })
-- -- -- move current tab to previous position
-- -- map("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true, desc = "[t]ab [m]ove [p]revious" })
-- -- -- move current tab to next position
-- -- map("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true, desc = "[t]ab [n]ext" })

-- yank path
-- vim.keymap.set("n", "yp", ':let @" = expand("%")<cr>', { remap = false, desc = "yank relative path" })
-- vim.keymap.set("n", "yP", ':let @" = expand("%:p")<cr>', { remap = false, desc = "yank absolute path" })
-- vim.keymap.set("n", "yp", ':let @*=expand("%")<CR>', { remap = false, desc = "yank relative path" })
-- vim.keymap.set("n", "yP", ':let @*=expand("%:p")<CR>', { remap = false, desc = "yank absolute path" })

-- -- quickfix
-- vim.keymap.set("n", "<leader>qn", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<leader>qp", "<cmd>cprev<CR>zz")
-- -- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- -- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- DIAGNOSTICS - use for jumping between LSP errors
-- vim.keymap.set("n", "<F10>", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "<F11>", vim.diagnostic.goto_next)

-- FILES - search
local search_text = require("telescope.builtin").live_grep
local search_filename = function()
	if vim.fn.finddir(".git", vim.fn.expand("%:p") .. ";") == ".git" then
		require("telescope.builtin").git_files({ show_untracked = true })
	else
		require("telescope.builtin").find_files()
	end
end
local search_filename_all = function()
	require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end
vim.keymap.set("n", "<leader>st", search_text, { desc = "[s]earch [t]ext" })
vim.keymap.set("n", "<leader><leader>", search_text, { desc = "[s]earch text" })
vim.keymap.set("n", "<leader>ss", search_filename, { desc = "[s]earch filename" })
vim.keymap.set("n", "<leader>sS", search_filename_all, { desc = "[s]earch filename (ALL)" })

vim.keymap.set("n", "<leader>*", require("telescope.builtin").grep_string, { desc = "search by grep" })
vim.keymap.set("n", "<leader>sb", telescope.buffers)
vim.keymap.set("n", "<leader>/", require("telescope.builtin").oldfiles, { desc = "[/] Find recently opened files" })

-- vim.keymap.set("n", "<leader><leader>", telescope.builtin)
-- vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[s]earch [h]elp" })
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>sr",
-- 	require("telescope.builtin").lsp_dynamic_workspace_symbols,
-- 	{ desc = "[s]earch symbols" }
-- )
-- vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[s]earch [d]iagnostics" })
-- vim.keymap.set("n", "<leader>sq", require("telescope.builtin").quickfix, { desc = "[s]earch [q]uickfix" })
-- vim.keymap.set("n", "<leader>sf", ":TodoTelescope<CR>", { desc = "[s]earch [f]ooo todos" })
-- vim.keymap.set("n", "<leader>sp", function()
-- 	require("telescope").extensions.project.project()
-- end, { desc = "[s]earch git [p]rojects" })

-- FILES - tree
local tree_toggle = function()
	vim.cmd.Neotree("toggle")
end
vim.keymap.set("n", "<tab>", vim.cmd.Neotree)
vim.keymap.set("n", "<leader>n", tree_toggle, { desc = "neotree" })
-- vim.keymap.set("n", "<leader>n", require("oil").open, { desc = "Open parent directory" })
-- vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- open things
map("n", "gx", '<Cmd>call jobstart(["open", expand("<cfile>")])<CR>', {
	noremap = true,
	silent = true,
	desc = "open links (or other things) from the cursor you're at",
})

-- GITHUB BROWSER
map(
	"n",
	"<leader>gx",
	'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	{ silent = true, desc = "[g]it open in browser" }
)
map(
	"n",
	"<leader>gX",
	'<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	{ silent = true, desc = "[g]it [H]omepage" }
)

-- -- GIT
-- vim.keymap.set("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "lazy[g]it" })
-- vim.keymap.set("n", "<leader>gf", telescope.git_status, { desc = "[g]it working [f]iles" })
-- vim.keymap.set("n", "<leader>gh", telescope.git_bcommits, { desc = "[g]it [h]istory for file" })
-- vim.keymap.set("n", "<leader>gH", telescope.git_commits, { desc = "[g]it [H]istory" })
-- map("n", "<leader>gb", ":Git blame<CR>", { desc = "[g]it [b]lame" })
-- map("n", "<leader>gm", ":Git mergetool<CR>", { desc = "[g]it [m]erge" })

-- -- " git mergediff keybindings
-- if vim.api.nvim_win_get_option(0, "diff") then
-- 	vim.api.nvim_buf_set_keymap(0, "n", "ml", ":diffget LOCAL<CR>", { noremap = true, silent = true })
-- 	vim.api.nvim_buf_set_keymap(0, "n", "mb", ":diffget BASE<CR>", { noremap = true, silent = true })
-- 	vim.api.nvim_buf_set_keymap(0, "n", "mr", ":diffget REMOTE<CR>", { noremap = true, silent = true })
-- 	vim.api.nvim_buf_set_keymap(0, "n", "mn", "/<<<<<<<<CR><esc>", { noremap = true, silent = true })
-- 	vim.api.nvim_buf_set_keymap(0, "n", "me", "?<<<<<<<<CR><esc>", { noremap = true, silent = true })
-- end

-- DIAGNOSIC
vim.keymap.set("n", "K", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- -- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- vim.keymap.set("n", "<leader>,", ":HopLine<CR>", { remap = true })
-- vim.keymap.set("n", ",", ":HopWord<CR>", { remap = true })

-- -- HARPOON
-- local harpoon = require("harpoon")
-- vim.keymap.set("n", "<leader>hh", function()
-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
-- end, { desc = "[h]arpoon [h]ome" })
-- vim.keymap.set("n", "<leader>ha", function()
-- 	harpoon:list():append()
-- end, { desc = "[h]arpoon [a]dd" })
-- vim.keymap.set("n", "<leader>hc", function()
-- 	harpoon:list():clear()
-- end, { desc = "[h]arpoon [c]lear" })
-- vim.keymap.set("", "<C-n>", function()
-- 	harpoon:list():select(1)
-- end, { desc = "[h]arpoon 1" })
-- vim.keymap.set("", "<C-e>", function()
-- 	harpoon:list():select(2)
-- end, { desc = "[h]arpoon 2" })
-- vim.keymap.set("", "<C-i>", function()
-- 	harpoon:list():select(3)
-- end, { desc = "[h]arpoon 3" })
-- vim.keymap.set("", "<C-S-n>", function()
-- 	harpoon:list():select(4)
-- end, { desc = "[h]arpoon 4" })
-- vim.keymap.set("", "<C-S-e>", function()
-- 	harpoon:list():select(5)
-- end, { desc = "[h]arpoon 5" })
-- vim.keymap.set("", "<C-S-i>", function()
-- 	harpoon:list():select(6)
-- end, { desc = "[h]arpoon 6" })

-- for i = 1, 5 do
-- 	vim.keymap.set("n", "<F" .. i .. ">", function()
-- 		harpoon:list():select(i)
-- 	end, { desc = "[h]arpoon file " .. i })
-- end

-- UNDOTREE
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "undotree" })

-- NOPE annoying menu
vim.keymap.set({ "n", "x" }, "q:", "")

-- COLEMAK STUFF
-- vim.keymap.set("", "n", "j", opts)
-- vim.keymap.set("", "e", "k", opts)

-- vim.keymap.set("", "j", "mzJ`z", opts)
-- vim.keymap.set("", "k", "K", opts)
-- vim.keymap.set("", "S", "E", opts)
-- vim.keymap.set("", "s", "e", opts)

-- vim.keymap.set("", "gs", "<Plug>VSurround", opts)
-- vim.keymap.set("", "gS", "<Plug>VgSurround", opts)
