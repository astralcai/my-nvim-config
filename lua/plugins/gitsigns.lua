return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end)

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end)

      -- Actions
      map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[G]it [S]tage" })
      map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[G]it [R]eset" })
      map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "[G]it [P]review Hunk" })

      map("v", "<leader>gs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "[G]it [S]tage" })

      map("v", "<leader>gr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "[G]it [R]eset" })

      map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "[G]it [S]tage Buffer" })
      map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "[G]it [R]eset Buffer" })

      -- Git Blames
      map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "[G]it [B]lame Line" })
      map("n", "<leader>gB", gitsigns.blame, { desc = "[G]it [B]lame" })

      -- Text object
      map({ "o", "x" }, "ih", gitsigns.select_hunk)
    end,
  },
}
