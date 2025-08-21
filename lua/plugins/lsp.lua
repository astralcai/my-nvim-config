return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "pyright",
      "clangd",
      "jdtls",
      "lua_ls",
    },
    automatic_enable = false,
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
    { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = {} },
  },
  config = function()
    -- Configure Keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspAttach", { clear = true }),
      callback = function(event)
        local fzf = require("fzf-lua")
        vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
        vim.keymap.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, { desc = "[G]oto Code [A]ction" })
        vim.keymap.set("n", "grr", fzf.lsp_references, { desc = "[G]oto [R]eferences" })
        vim.keymap.set("n", "gri", fzf.lsp_implementations, { desc = "[G]oto [I]mplementation" })
        vim.keymap.set("n", "grt", fzf.lsp_typedefs, { desc = "[G]oto [T]ype Definition" })
        vim.keymap.set("n", "grd", fzf.lsp_definitions, { desc = "[G]oto [D]efinition" })
        vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
        vim.keymap.set("n", "<leader>so", fzf.lsp_document_symbols, { desc = "[S]earch Document Symbols" })
        vim.keymap.set("n", "<leader>sw", fzf.lsp_live_workspace_symbols, { desc = "[S]earch [W]orkspace Symbols" })

        -- Diagnostic Config
        vim.diagnostic.config({
          severity_sort = true,
          float = { border = "rounded", source = "if_many" },
          underline = { severity = vim.diagnostic.severity.ERROR },
          signs = vim.g.have_nerd_font and {
            text = {
              [vim.diagnostic.severity.ERROR] = "󰅚 ",
              [vim.diagnostic.severity.WARN] = "󰀪 ",
              [vim.diagnostic.severity.INFO] = "󰋽 ",
              [vim.diagnostic.severity.HINT] = "󰌶 ",
            },
          } or {},
          virtual_text = {
            source = "if_many",
            spacing = 2,
          },
        })
      end,
    })

    local servers = {
      pyright = {
        settings = {
          python = {
            analysis = {
              exclude = { "build", "venv" },
            },
          },
        },
      },
      clangd = {},
      jdtls = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    }
    for server, config in pairs(servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end

    -- Ensure the servers and tools above are installed
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, { "stylua" })
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
  end,
}
