return function()
  require("nvim-treesitter.install").update({ with_sync = true })

  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "diff",
      "dockerfile",
      "eex",
      "elixir",
      "erlang",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "heex",
      "html",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "python",
      "ruby",
      "rust",
      "scss",
      "sql",
      "supercollider",
      "terraform",
      "toml",
      "tsx",
      "typescript",
      "vimdoc",
      "vim",
      "vue",
    },
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "markdown" },
    },
    indent = { enable = true, disable = { "python", "ruby" } },
    incremental_selection = {
      enable = false,
      -- keymaps = {
      --   init_selection = "<c-space>",
      --   node_incremental = "<c-space>",
      --   scope_incremental = "<c-s>",
      --   node_decremental = "<M-space>",
      -- },
    },
    context = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          -- ["ab"] = "@block.outer",
          -- ["ib"] = "@block.inner"
        },
      },
      move = {
        enable = false,
        -- set_jumps = true, -- whether to set jumps in the jumplist
        -- goto_next_start = {
        --   ["]m"] = "@function.outer",
        --   ["]]"] = "@class.outer",
        -- },
        -- goto_next_end = {
        --   ["]M"] = "@function.outer",
        --   ["]["] = "@class.outer",
        -- },
        -- goto_previous_start = {
        --   ["[m"] = "@function.outer",
        --   ["[["] = "@class.outer",
        -- },
        -- goto_previous_end = {
        --   ["[M"] = "@function.outer",
        --   ["[]"] = "@class.outer",
        -- },
      },
      swap = {
        enable = false,
        -- swap_next = {
        --   ["<leader>a"] = "@parameter.inner",
        -- },
        -- swap_previous = {
        --   ["<leader>A"] = "@parameter.inner",
        -- },
      },
    },
    endwise = {
      enable = true,
    },
    -- autotag = {
    --   enable = true,
    -- },
  })

  -- context highlighting/background
  vim.cmd.hi("TreesitterContext guibg=#073148")
  vim.cmd.hi("TreesitterContextLineNumber guifg=#3498db")
end
