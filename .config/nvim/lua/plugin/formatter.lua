-- DEPENDENCIES
-- cargo install stylua
-- go install mvdan.cc/gofumpt@latest && asdf reshim
-- npm install -g @fsouza/prettierd eslint_d

return function()
  -- local util = require "formatter.util"
  local ft = require("formatter.filetypes")

  require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
      ["*"] = {
        ft.any.remove_trailing_whitespace,
      },
      css = {
        ft.css.prettierd,
      },
      elixir = {
        ft.elixir.mixformat,
      },
      go = {
        -- ft.go.gofmt,
        ft.go.gofumpt,
      },
      html = {
        ft.html.prettierd,
      },
      javascript = {
        ft.javascript.eslint_d,
        ft.javascript.prettierd,
      },
      javascriptreact = {
        ft.javascriptreact.eslint_d,
        ft.javascriptreact.prettierd,
      },
      json = {
        ft.json.prettierd,
      },
      jsonc = {
        ft.json.prettierd,
      },
      lua = {
        ft.lua.stylua,
      },
      markdown = {
        ft.markdown.prettierd,
      },
      ruby = {
        ft.ruby.rubocop,
      },
      rust = {
        ft.rust.rustfmt,
      },
      terraform = {
        ft.terraform.terraformfmt,
      },
      typescript = {
        ft.typescript.eslint_d,
        ft.typescript.prettier,
        -- ft.typescript.prettierd,
      },
      typescriptreact = {
        ft.typescriptreact.eslint_d,
        ft.typescriptreact.prettierd,
      },
      vue = {
        ft.typescript.eslint_d,
        ft.typescript.prettierd,
      },
      yaml = {
        ft.yaml.prettierd,
      },
    },
  })
end
