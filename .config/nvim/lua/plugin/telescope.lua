return function()
	-- Enable telescope fzf native, if installed
	pcall(require("telescope").load_extension, "fzf")

	local actions = require("telescope.actions")
	-- local trouble = require("trouble.providers.telescope")

	require("telescope").setup({
		defaults = {
			file_ignore_patterns = {
				"yarn.lock",
			},
			mappings = {
				n = {},
				i = {
					["<esc>"] = actions.close,
				},
			},
		},
	})
end
