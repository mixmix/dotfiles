return function()
  require("gitsigns").setup({
    current_line_blame = false,
    current_line_blame_opts = {
      --   virt_text = false,
      virt_text_pos = "right_align",
      delay = 10,
      ignore_whitespace = true,
    },

    on_attach = function()
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "gn", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "next hunk" })

      map("n", "ge", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "previous hunk" })

      -- Actions
      map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "stage hunk" })
      map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "reset hunk" })
      map("n", "<leader>gS", gs.stage_buffer, { desc = "stage buffer" })
      map("n", "<leader>gR", gs.reset_buffer, { desc = "reset buffer" })
      map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
      map("n", "<leader>gp", gs.preview_hunk, { desc = "preview hunk" })
      -- map("n", "<leader>gb", function() gs.blame_line { full = true } end, { desc = "blame line" })
      map("n", "<leader>gl", function()
        gs.blame_line({ full = true })
      end, { desc = "blame line" })
      map("n", "<leader>gd", gs.diffthis, { desc = "diff" })
      map("n", "<leader>gD", function()
        gs.diffthis("~")
      end, { desc = "diff" })
      map("n", "<leader>gt", gs.toggle_deleted, { desc = "toggle deleted" })

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select hunk" })
    end,
  })
end
