return function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  luasnip.config.setup()

  cmp.setup({
    preselect = "None",
    completion = {
      -- completeopt = "menu,menuone,noinsert",
      completeopt = "menu,menuone,noinsert,noselect",
      keyword_length = 1,
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      -- ["<C-Space>"] = cmp.mapping.complete {},
      ["<CR>"] = cmp.mapping(function(fallback)
        if cmp.visible() and cmp.get_selected_entry() then
          cmp.confirm({ select = false })
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-Space>"] = cmp.mapping(function(fallback)
        -- if cmp.visible() then
        --   cmp.select_next_item()
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      -- ["<C-,>"] = cmp.mapping(function(fallback)
      -- if cmp.visible() then
      --   cmp.select_prev_item()
      -- if luasnip.jumpable(-1) then
      -- luasnip.jump(-1)
      -- else
      -- fallback()
      -- end
      -- end, { "i", "s" }),
    }),
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      -- { name = "buffer" },
    },
  })

  -- cmp.setup.cmdline("/", {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = {
  --     { name = "buffer" },
  --   },
  -- })

  -- cmp.setup.cmdline(":", {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = cmp.config.sources({
  --     { name = "path" },
  --   }, {
  --     {
  --       name = "cmdline",
  --       option = {
  --         ignore_cmds = { "Man", "!", "w", "e" },
  --       },
  --     },
  --   }),
  -- })
end
