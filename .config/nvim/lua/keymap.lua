local telescope = require("telescope.builtin")
local trouble = require("trouble")
local opts = { noremap = true, silent = false }

-- wqa terminal fix
vim.cmd("command Z w | qa")
vim.cmd("cabbrev wqa Z")

-- CLEAR HIGHLIGHTED SEARCH
vim.keymap.set("n", "<esc>", vim.cmd.noh)

-- COLEMAK FRIENDLY
-- vim.keymap.set("", "m", "j", opts)
-- vim.keymap.set("", "l", "k", opts)
-- vim.keymap.set("", "e", "l", opts)
-- vim.keymap.set("", "E", "L", opts)

-- unused
vim.keymap.set("", "N", "", opts)

-- harpoon uses c-i
vim.keymap.set("n", "<C-u>", "<C-i>")

-- TODO: marks as H or C-u?
-- vim.keymap.set("n", "H", "m", opts)

vim.keymap.set("", "n", "j", opts)
vim.keymap.set("", "e", "k", opts)

vim.keymap.set("", "j", "mzJ`z", opts)
vim.keymap.set("", "k", "K", opts)
-- vim.keymap.set("", "R", "s", opts)
vim.keymap.set("", "S", "E", opts)
vim.keymap.set("", "s", "e", opts)
-- vim.keymap.set("", "gs", "ge", opts)
-- vim.keymap.set("", "gS", "gE", opts)

-- quickly jump to last edited line
-- vim.keymap.set("n", "''", "'[")

-- SURROUND
vim.keymap.set("", "gs", "<Plug>VSurround", opts)
vim.keymap.set("", "gS", "<Plug>VgSurround", opts)

vim.keymap.set({ "n", "x" }, "q:", "")
vim.keymap.set({ "n", "x" }, "<Leader>:", "q:", { desc = "Command line history" })

-- RENAMING
vim.api.nvim_set_keymap("n", "<Leader>R", ":%s/<C-r><C-w>/", opts)

-- YANKY
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<C-d>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<C-g>", "<Plug>(YankyCycleBackward)")
-- vim.keymap.set("n", "<Leader>Y", function()
--   require("telescope").extensions.yank_history.yank_history()
-- end, { desc = "[Y]ank history" })

vim.keymap.set("n", "<leader>M", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "make it rain!" })

-- SCROLLING/SEARCH
vim.keymap.set("", "<C-s>", "<C-b>zz", opts)
vim.keymap.set("", "<C-t>", "<C-f>zz", opts)
vim.keymap.set("n", "m", "nzz", opts)
vim.keymap.set("n", "M", "Nzz", opts)
vim.keymap.set("n", "<C-b>", "", opts)
vim.keymap.set("n", "<C-f>", "", opts)

-- MOVING LINES
-- move selected lines up one line
vim.api.nvim_set_keymap("x", "<C-j>", ":m-2<CR>gv=gv", opts)
-- move selected lines down one line
vim.api.nvim_set_keymap("x", "<C-k>", ":m'>+<CR>gv=gv", opts)
-- move current line up one line
vim.api.nvim_set_keymap("n", "<C-j>", ":<C-u>m-2<CR>==", opts)
-- move current line down one line
vim.api.nvim_set_keymap("n", "<C-k>", ":<C-u>m+<CR>==", opts)

-- vim.api.nvim_set_keymap("n", "<header>ta", ":$tabnew<CR>", { noremap = true, desc = "[t]ab [a]dd" })
-- vim.api.nvim_set_keymap("n", "<Leader>tc", ":tabclose<CR>", { noremap = true, desc = "[t]ab [c]lose" })
-- vim.api.nvim_set_keymap("n", "<Leader>to", ":tabonly<CR>", { noremap = true, desc = "[t]ab [o]nly" })
-- vim.api.nvim_set_keymap("n", "<Leader>tn", ":tabn<CR>", { noremap = true, desc = "[t]ab [n]ext" })
-- vim.api.nvim_set_keymap("n", "<Leader>tp", ":tabp<CR>", { noremap = true, desc = "[t]ab [p]revious" })
-- -- move current tab to previous position
-- vim.api.nvim_set_keymap("n", "<Leader>tmp", ":-tabmove<CR>", { noremap = true, desc = "[t]ab [m]ove [p]revious" })
-- -- move current tab to next position
-- vim.api.nvim_set_keymap("n", "<Leader>tmn", ":+tabmove<CR>", { noremap = true, desc = "[t]ab [n]ext" })

-- GLOBAL CLIPBOARD
vim.keymap.set("n", "<Leader>y", '"+y', { remap = false })
vim.keymap.set("v", "<Leader>y", '"+y', { remap = false })
vim.keymap.set("x", "<Leader>p", '"_dP', { remap = false })

-- yank path
vim.keymap.set("n", "yp", ':let @" = expand("%")<cr>', { remap = false, desc = "yank relative path" })
vim.keymap.set("n", "yP", ':let @" = expand("%:p")<cr>', { remap = false, desc = "yank absolute path" })
vim.keymap.set("n", "<Leader>yp", ':let @*=expand("%")<CR>', { remap = false, desc = "yank relative path" })
vim.keymap.set("n", "<Leader>yP", ':let @*=expand("%:p")<CR>', { remap = false, desc = "yank absolute path" })

-- quickfix
vim.keymap.set("n", "<leader>qn", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>qp", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- TROUBLE
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- EDIT CONFIGS
vim.keymap.set("n", "<Leader>cv", ":e ~/.config/nvim/<CR>", { remap = true })
vim.keymap.set("n", "<Leader>cz", ":e ~/.zshrc<CR>", { remap = true })

-- DIAGNOSTICS
vim.keymap.set("n", "<F10>", function()
	if trouble.is_open() then
		trouble.previous({ skip_groups = true, jump = true })
	else
		vim.diagnostic.goto_prev()
	end
end)

vim.keymap.set("n", "<F11>", function()
	if trouble.is_open() then
		trouble.next({ skip_groups = true, jump = true })
	else
		vim.diagnostic.goto_next()
	end
end)

-- TELESCOPE
vim.keymap.set("n", "<Leader><Leader>", telescope.builtin)
vim.keymap.set("n", "<Leader>sS", function()
	require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end, { desc = "[s]earch all files" })

vim.keymap.set("n", "<Leader>ss", function()
	if vim.fn.finddir(".git", vim.fn.expand("%:p") .. ";") == ".git" then
		require("telescope.builtin").git_files({ show_untracked = true })
	else
		require("telescope.builtin").find_files()
	end
end, { desc = "[s]earch files" })

vim.keymap.set("n", "<Leader>sh", require("telescope.builtin").help_tags, { desc = "[s]earch [h]elp" })
vim.keymap.set("n", "<Leader>st", require("telescope.builtin").live_grep, { desc = "[s]earch [t]ext" })
vim.keymap.set(
	"n",
	"<Leader>sr",
	require("telescope.builtin").lsp_dynamic_workspace_symbols,
	{ desc = "[s]earch symbols" }
)
vim.keymap.set("n", "<Leader>*", require("telescope.builtin").grep_string, { desc = "search by grep" })
vim.keymap.set("n", "<Leader>sd", require("telescope.builtin").diagnostics, { desc = "[s]earch [d]iagnostics" })
vim.keymap.set("n", "<Leader>sq", require("telescope.builtin").quickfix, { desc = "[s]earch [q]uickfix" })
vim.keymap.set("n", "<Leader>sf", ":TodoTelescope<CR>", { desc = "[s]earch [f]ooo todos" })
vim.keymap.set("n", "<Leader>sb", telescope.buffers)
vim.keymap.set("n", "<Leader>/", require("telescope.builtin").oldfiles, { desc = "[/] Find recently opened files" })
vim.keymap.set("n", "<Leader>sp", function()
	require("telescope").extensions.project.project()
end, { desc = "[s]earch git [p]rojects" })

-- TERMINAL
-- for i = 0, 9 do
--   vim.keymap.set("n", "<Leader>" .. i, ":ToggleTerm " .. i .. "<CR>")
-- end
-- vim.keymap.set("n", "<C-`>", function()
--   vim.api.nvim_command(":ToggleTerm " .. vim.fn.tabpagenr() .. " direction=horizontal <CR>")
-- end)

-- vim.keymap.set("n", "<Leader><Leader>",
--   function() vim.api.nvim_command(":ToggleTerm " .. vim.fn.tabpagenr() .. " direction=float <CR>") end)

-- -- NEOTREE
-- vim.keymap.set("n", "-", ":Neotree %:p:h<CR>")
-- vim.keymap.set("n", "<C-->", ":Neotree `pwd`<CR>")
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- GIT
vim.keymap.set("n", "<Leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "lazy[g]it" })
vim.keymap.set("n", "<Leader>gf", telescope.git_status, { desc = "[g]it working [f]iles" })
vim.keymap.set("n", "<Leader>gh", telescope.git_bcommits, { desc = "[g]it [h]istory for file" })
vim.keymap.set("n", "<Leader>gH", telescope.git_commits, { desc = "[g]it [H]istory" })
vim.api.nvim_set_keymap("n", "<Leader>gb", ":Git blame<CR>", { desc = "[g]it [b]lame" })
vim.api.nvim_set_keymap("n", "<Leader>gm", ":Git mergetool<CR>", { desc = "[g]it [m]erge" })

-- " git mergediff keybindings
if vim.api.nvim_win_get_option(0, "diff") then
	vim.api.nvim_buf_set_keymap(0, "n", "ml", ":diffget LOCAL<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(0, "n", "mb", ":diffget BASE<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(0, "n", "mr", ":diffget REMOTE<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(0, "n", "mn", "/<<<<<<<<CR><esc>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(0, "n", "me", "?<<<<<<<<CR><esc>", { noremap = true, silent = true })
end

-- open things
vim.api.nvim_set_keymap(
	"n",
	"gx",
	'<Cmd>call jobstart(["open", expand("<cfile>")])<CR>',
	{ noremap = true, silent = true }
)

-- GITHUB BROWSER
vim.api.nvim_set_keymap(
	"n",
	"<Leader>gx",
	'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	{ silent = true, desc = "[g]it open in browser" }
)
vim.api.nvim_set_keymap(
	"v",
	"<Leader>gx",
	'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	{ desc = "[g]it open in browser" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>gX",
	'<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	{ silent = true, desc = "[g]it [H]omepage" }
)

-- NOTES
vim.api.nvim_set_keymap(
	"n",
	"<Leader>nc",
	"<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>",
	{ noremap = true, desc = "[n]ote [c]reate" }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>ns",
	"<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
	{ noremap = true, desc = "[n]ote [s]earch" }
)
vim.api.nvim_set_keymap("n", "<Leader>nn", "<Cmd>ZkTags<CR>", { noremap = true, desc = "[n]ote by tags" })
vim.keymap.set("n", "<Leader>nt", function()
	if vim.fn.filereadable("./.todo.md") == 1 then
		vim.cmd(":e .todo.md")
	else
		vim.cmd(":e ~/.todo.md")
	end
end, { noremap = true, desc = "[n]ote [t]odo" })
vim.api.nvim_set_keymap("n", "<Leader>ni", ":e ~/notes/index.md<CR>", { noremap = true, desc = "[n]ote [i]ndex" })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>nT",
	":! ln -s '%' .todo.md<CR>",
	{ noremap = true, desc = "[n]ote [T]odo symlink" }
)
vim.api.nvim_set_keymap("v", "<Leader>ns", ":'<,'>ZkMatch<CR>", { noremap = true, desc = "[n]ote [s]earch" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "K", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("n", "<Leader>,", ":HopLine<CR>", { remap = true })
vim.keymap.set("n", ",", ":HopWord<CR>", { remap = true })

-- HARPOON
local harpoon = require("harpoon")
vim.keymap.set("n", "<Leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "[h]arpoon [h]ome" })
vim.keymap.set("n", "<Leader>ha", function()
	harpoon:list():append()
end, { desc = "[h]arpoon [a]dd" })
vim.keymap.set("n", "<Leader>hc", function()
	harpoon:list():clear()
end, { desc = "[h]arpoon [c]lear" })
vim.keymap.set("", "<C-n>", function()
	harpoon:list():select(1)
end, { desc = "[h]arpoon 1" })
vim.keymap.set("", "<C-e>", function()
	harpoon:list():select(2)
end, { desc = "[h]arpoon 2" })
vim.keymap.set("", "<C-i>", function()
	harpoon:list():select(3)
end, { desc = "[h]arpoon 3" })
vim.keymap.set("", "<C-S-n>", function()
	harpoon:list():select(4)
end, { desc = "[h]arpoon 4" })
vim.keymap.set("", "<C-S-e>", function()
	harpoon:list():select(5)
end, { desc = "[h]arpoon 5" })
vim.keymap.set("", "<C-S-i>", function()
	harpoon:list():select(6)
end, { desc = "[h]arpoon 6" })

for i = 1, 5 do
	vim.keymap.set("n", "<F" .. i .. ">", function()
		harpoon:list():select(i)
	end, { desc = "[h]arpoon file " .. i })
end

-- UNDOTREE
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[u]ndotree" })

-- SPECTRE
vim.keymap.set("n", "<leader>F", '<cmd>lua require("spectre").open()<CR>', {
	desc = "Open Spectre",
})
vim.keymap.set("n", "<leader>fw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "[f]ind current [w]ord",
})
vim.keymap.set("v", "<leader>fw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "[f]ind current [w]ord",
})
vim.keymap.set("n", "<leader>ff", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "[f]ind on current [f]ile",
})
