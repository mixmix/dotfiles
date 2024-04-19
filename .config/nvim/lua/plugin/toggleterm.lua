return function()
  require("toggleterm").setup({
    direction = "vertical", --"float",
    size = function(term)
      if term.direction == "horizontal" then
        return 22
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    term = vim.fn.getcwd(),
    float_opts = {
      border = "double",
    },
    on_create = function(term)
      if term.display_name ~= "lazygit" then
        -- vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<C-\\><C-n>:ToggleTerm<CR>",
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<C-\\><C-n>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", ":ToggleTerm<CR>", { noremap = true, silent = true })
      end
      local dir = vim.fn.getcwd()
      term.dir = dir
    end,
    on_open = function()
      vim.cmd("startinsert!")
    end,
  })

  local Terminal = require("toggleterm.terminal").Terminal

  local lazygit = Terminal:new({
    id = 99,
    display_name = "lazygit",
    cmd = "lazygit",
    direction = "float",
    float_opts = {
      border = "double",
    },
    -- on_close = function()
    --   vim.cmd("startinsert!")
    -- end,
  })

  function _lazygit_toggle()
    local dir = vim.fn.getcwd()
    lazygit.dir = dir
    lazygit:toggle()
  end
end
