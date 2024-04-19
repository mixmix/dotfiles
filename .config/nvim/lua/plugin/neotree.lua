return function()
  require("neo-tree").setup({
    filesystem = {
      bind_to_cwd = false,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
    window = {
      position = "float",
      mappings = {
        ["<esc>"] = "close_window",
        ["-"] = "navigate_up",
        ["gk"] = "prev_git_modified",
        ["gj"] = "next_git_modified",
        ["<C-s>"] = "open_split",
        ["<C-v>"] = "open_vsplit",
        ["m"] = "none",
        ["l"] = "none",
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "", -- this can only be used in the git_status source
          renamed = "", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },
    },
  })

  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
end
