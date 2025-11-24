return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.ai").setup({})
    require("mini.move").setup({})
    require("mini.comment").setup({})
    local animate = require("mini.animate")
    animate.setup({
      cursor = { enable = false },
      scroll = {
        timing = animate.gen_timing.cubic({ easing = "out", duration = 50, unit = "total" }),
        subscroll = animate.gen_subscroll.equal({
          predicate = function(total_scroll)
            return math.abs(total_scroll) > 5
          end,
        }),
      },
      resize = { enable = false },
      open = { enable = false },
      close = { enable = false },
    })
  end,
}
