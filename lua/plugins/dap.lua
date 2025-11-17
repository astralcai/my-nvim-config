return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "mfussenegger/nvim-dap-python",
    "mason-org/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "debugloop/layers.nvim",
  },
  config = function()
    -- Setup
    require("dapui").setup()
    require("nvim-dap-virtual-text").setup({ virt_text_pos = "eol" })
    require("dap-python").setup("debugpy-adapter")
    require("mason").setup()
    require("mason-nvim-dap").setup({ ensure_installed = { "python" }, automatic_installation = true })

    local dap = require("dap")
    local dapui = require("dapui")

    -- Configure dapui
    dap.listeners.before.attach.dapui_config = dapui.open
    dap.listeners.before.launch.dapui_config = dapui.open
    dap.listeners.before.event_terminated.dapui_config = dapui.close
    dap.listeners.before.event_exited.dapui_config = dapui.close

    -- Configure Python
    require("dap-python").test_runner = "pytest"

    -- Add a configuration that steps into not just my own code
    table.insert(dap.configurations.python, {
      type = "python",
      request = "launch",
      name = "file:allcode",
      program = "${file}",
      justMyCode = false,
    })

    -- Configure Keymaps
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle [B]reakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Condition: "))
    end, { desc = "Conditional [B]reakooint" })
    vim.keymap.set("n", "<leader>dl", dap.continue, { desc = "[D]ebug [L]aunch" })

    -- Change breakpoint icons
    vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
    vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })
    local breakpoint_icons = {
      Breakpoint = "",
      BreakpointCondition = "",
      BreakpointRejected = "",
      LogPoint = "",
      Stopped = "",
    }
    for type, icon in pairs(breakpoint_icons) do
      local tp = "Dap" .. type
      local hl = (type == "Stopped") and "DapStop" or "DapBreak"
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end

    -- Configure temporary keymaps
    local layers = require("layers")
    DEBUG_MODE = layers.mode.new()
    dap.listeners.after.event_initialized["debug_mode"] = function()
      DEBUG_MODE:activate()
    end
    dap.listeners.before.event_exited["debug_mode"] = function()
      DEBUG_MODE:deactivate()
    end
    DEBUG_MODE:keymaps({
      n = {
        {
          "<Down>",
          dap.step_over,
          { desc = "Debug: Step Over" },
        },
        {
          "<Right>",
          dap.step_into,
          { desc = "Debug: Step Into" },
        },
        {
          "<Left>",
          dap.step_out,
          { desc = "Debug: Step Out" },
        },
        {
          "T",
          dap.terminate,
          { desc = "Debug: Terminate" },
        },
        {
          "c",
          dap.continue,
          { desc = "Debug: Continue" },
        },
      },
    })
  end,
}
