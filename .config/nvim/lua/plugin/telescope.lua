return function()
  -- Enable telescope fzf native, if installed
  pcall(require("telescope").load_extension, "fzf")

  local actions = require("telescope.actions")
  local trouble = require("trouble.providers.telescope")

  require("telescope").setup({
    defaults = {
      file_ignore_patterns = {
        "cassettes",
        "yarn.lock",
      },
      mappings = {
        n = {
          ["<c-t>"] = trouble.open_with_trouble,
        },
        i = {
          ["<c-t>"] = trouble.open_with_trouble,
          ["<C-u>"] = false,
          ["<C-d>"] = false,
          ["<C-j>"] = false,
          ["<C-k>"] = false,
          ["<esc>"] = actions.close,
        },
      },
    },
    extensions = {
      project = {
        base_dirs = { "~/dev" },
        hidden_files = true,
        -- theme = "dropdown",
        -- order_by = "asc",
        -- search_by = "title",
        sync_with_nvim_tree = true, -- default false
        on_project_selected = function(prompt_bufnr)
          local project_actions = require("telescope._extensions.project.actions")
          local project_path = project_actions.get_selected_path(prompt_bufnr)

          project_actions.find_project_files(prompt_bufnr)
          -- TODO create new tab at the same time
          -- vim.cmd.tabnew()
          vim.cmd.tcd(project_path)
        end,
      },
    },
  })
end
