-- local util = require("lspconfig.util")

require("lspconfig").sourcekit.setup({
  cmd = {
    "sourcekit-lsp",
  },
})

local on_attach_overrides = {
  -- eslint = function(client, bufnr)
  --   vim.api.nvim_create_autocmd("BufWritePre", { buffer = bufnr, command = "EslintFixAll" })
  -- end,
  rust_analyzer = function(_, bufnr)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { remap = true, buffer = bufnr })
    vim.keymap.set("n", "<C-d>", rt.hover_actions.hover_actions, { remap = true, buffer = bufnr })
    vim.keymap.set("n", "<leader>d", function()
      os.execute("cargo doc --open")
    end, { desc = "open cargo project docs", remap = true, buffer = bufnr })
    vim.keymap.set("n", "<C-/>", rt.code_action_group.code_action_group, { buffer = bufnr })
    -- vim.keymap.set("n", "<leader>rr", rt.run, { buffer = bufnr })
  end,
  tsserver = function(_, bufnr)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { remap = true, buffer = bufnr })
  end,
}

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  -- client.resolved_capabilities.document_formatting = false
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<F12>", vim.lsp.buf.code_action, "[C]ode [A]ction")

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  -- nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  -- nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  -- See `:help K` for why this keymap
  nmap("k", vim.lsp.buf.hover, "Hover Documentation")
  -- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  -- nmap("<leader>wl", function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, "[W]orkspace [L]ist Folders")

  if on_attach_overrides[client.name] then
    on_attach_overrides[client.name]()
  end
end

-- SERVER CONFIGURATIONS
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local servers = {
  clangd = {},
  jsonls = {},
  gopls = {},
  tsserver = {},
  volar = {},
  yamlls = {
    yaml = {
      -- cloudformation
      customTags = {
        "!FindInMap",
        "!FindInMap sequence",
        "!GetAtt",
        "!GetAtt sequence",
        "!Join",
        "!Join sequence",
        "!Ref",
        "!Ref sequence",
        "!Select",
        "!Select sequence",
        "!Split",
        "!Split sequence",
        "!Sub",
        "!Sub sequence",
      },
    },
  },
  elixirls = {
    cmd = { "/opt/homebrew/bin/elixir-ls" },
  },
  eslint = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        disable = {
          -- https://github.com/LuaLS/lua-language-server/wiki/Diagnostics
          "lowercase-global",
          "undefined-global",
        },
        globals = {
          "vim",
          "use",
          "require",
          "include",
          "norns",
          "screen",
          "clock",
        },
      },
    },
  },

  -- run `gem install solargraph solargraph-rails rubocop rubocop-rspec`
  -- check :LspLog
  solargraph = {
    settings = {
      solargraph = {
        -- https://github.com/castwide/vscode-solargraph/blob/master/README.md#extension-settings
        commandPath = os.getenv("HOME") .. "/.asdf/shims/solargraph",
        completion = true,
        diagnostics = true,
        hover = true,
        folding = true,
        references = true,
        rename = true,
        symbols = true,
        definitions = true,
        formatting = false,
        autoformat = false,
      },
    },
  },
}

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    })
  end,
  jsonls = function()
    require("lspconfig").jsonls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      init_options = {
        provideFormatter = false,
      },
    })
  end,
  rust_analyzer = function()
    require("rust-tools").setup({
      server = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              disabled = {
                -- FIXME: temporarily disable clippy::needless_return, fix for #tokio::main macro
                "needless_return",
              },
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    })
  end,
  volar = function()
    -- HACK: lol
    local dir = vim.fn.getcwd()
    local kaibosh = os.getenv("HOME") .. "/dev/dwtong/kaibosh"

    if dir == kaibosh then
      require("lspconfig").volar.setup({
        filetypes = {
          "typescript",
          "javascript",
          "javascriptreact",
          "typescriptreact",
          "vue",
          "json",
        },
        on_attach = function()
          for _, server in ipairs(vim.lsp.get_active_clients()) do
            if server.name == "tsserver" then
              print("stopped tsserver - volar takeover mode")
              vim.lsp.get_client_by_id(server.id).stop()
            end
          end
        end,
      })
    end
  end,
})

require("fidget").setup({
  fmt = { stack_upwards = false },
})
