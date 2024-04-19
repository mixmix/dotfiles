local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-rhubarb",
	-- "tpope/vim-sleuth",
	"tpope/vim-surround",
	"tpope/vim-repeat", -- . action on tpope plugins
	"tpope/vim-eunuch",
	"tpope/vim-abolish",
	"tpope/vim-fugitive",
	"farmergreg/vim-lastplace",
	-- "Eandrju/cellular-automaton.nvim",

	{
		"mbbill/undotree",
		config = function()
			vim.g.undotree_WindowLayout = 3
			vim.g.undotree_SplitWidth = 45
			vim.g.undotree_DiffpanelHeight = 15
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.Undotree_CustomMap = function()
				vim.api.nvim_buf_set_keymap(0, "n", "e", "<plug>UndotreeNextState", { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(
					0,
					"n",
					"n",
					"<plug>UndotreePreviousState",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					0,
					"n",
					"M",
					"<plug>UndotreeNextSavedState",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					0,
					"n",
					"m",
					"<plug>UndotreePreviousSavedState",
					{ noremap = true, silent = true }
				)
			end
		end,
	},

	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
			"j-hui/fidget.nvim",
			"simrat39/rust-tools.nvim",
			"mfussenegger/nvim-dap",
		},
	},

	{
		"j-hui/fidget.nvim",
		tag = "legacy",
	},

	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = require("plugin.cmp"),
	},

	{
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip").filetype_extend("ruby", { "rails" })
		end,
	},

	{
		"mhartington/formatter.nvim",
		config = require("plugin.formatter"),
	},

	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup()
			wk.register({
				["<leader>g"] = { name = "+git" },
				["<leader>l"] = { name = "+lsp" },
				["<leader>h"] = { name = "+harpoon" },
				["<leader>s"] = { name = "+search" },
				["<leader>t"] = { name = "+tab" },
				-- ["<leader>w"] = { name = "+workspace" },
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = require("plugin.gitsigns"),
	},

	{
		-- THEME
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("carbonfox")
		end,
	},

	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = "powerline",
				component_separators = "|",
				section_separators = "",
			},
		},
	},

	{
		"numToStr/Comment.nvim",
		opts = {
			ignore = "^$",
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		config = require("plugin.telescope"),
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		opts = {
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		},
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- {
	-- 	"gbprod/yanky.nvim",
	-- 	config = function()
	-- 		local utils = require("yanky.utils")
	-- 		local mapping = require("yanky.telescope.mapping")
	-- 		require("yanky").setup({
	-- 			ring = {
	-- 				storage = "shada",
	-- 			},
	-- 			system_clipboard = {
	-- 				sync_with_ring = false,
	-- 			},
	-- 			picker = {
	-- 				telescope = {
	-- 					use_default_mappings = false,
	-- 					mappings = {
	-- 						-- default = mapping.put("p"),
	-- 						i = {
	-- 							["<CR>"] = mapping.put("p"),
	-- 							["<S-CR>"] = mapping.put("P"),
	-- 							["<c-x>"] = mapping.delete(),
	-- 							["<c-r>"] = mapping.set_register(utils.get_default_register()),
	-- 						},
	-- 						n = {
	-- 							p = mapping.put("p"),
	-- 							P = mapping.put("P"),
	-- 							d = mapping.delete(),
	-- 							r = mapping.set_register(utils.get_default_register()),
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 		require("telescope").load_extension("yank_history")
	-- 	end,
	-- },

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	-- {
	--   "nvim-telescope/telescope-file-browser.nvim",
	--   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	-- },
	--

	-- {
	-- 	"nvim-telescope/telescope-project.nvim",
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- },

	{
		"stevearc/oil.nvim",
		-- file nav editor
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
			"RRethy/nvim-treesitter-endwise",
			-- "windwp/nvim-ts-autotag",
		},
		config = require("plugin.treesitter"),
	},

	{
		"ruifm/gitlinker.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- TODO: research
	-- {
	--   "nanozuki/tabby.nvim",
	--   config = function()
	--     require("tabby.tabline").use_preset("tab_only", {
	--       -- nerdfont = false,
	--     })
	--   end,
	-- },

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	},

	{
		"windwp/nvim-autopairs",
		-- NOTE: use TAB after to jump outside the tab (thanks to tabout)
		opts = {
			disable_filetype = { "TelescopePrompt", "spectre_panel", "tal" },
			fast_wrap = {
				map = "<C-b>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "e",
				keys = "arsdheiqwfpgjluyozxcvbkmtn", -- colemak
				check_comma = true,
				manual_position = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		},
	},

	{
		"abecodes/tabout.nvim",
		opts = {
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
				{ open = "[", close = "]" },
				{ open = "{", close = "}" },
				{ open = "<", close = ">" },
			},
		},
		dependencies = { "nvim-treesitter", "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	},
}, {})
