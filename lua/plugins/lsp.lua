return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- Configure Keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspAttach", { clear = true }),
      callback = function(event)
        -- Configure Keymaps
        local fzf = require("fzf-lua")
        local map = function(key, fn, desc, mode)
          mode = mode or "n"
          vim.keymap.set("n", key, fn, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "v" })
        map("grr", fzf.lsp_references, "[G]oto [R]eferences")
        map("gri", fzf.lsp_implementations, "[G]oto [I]mplementation")
        map("grt", fzf.lsp_typedefs, "[G]oto [T]ype Definition")
        map("grd", fzf.lsp_definitions, "[G]oto [D]efinition")
        map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("<leader>so", fzf.lsp_document_symbols, "[S]earch Document Symbols")
        map("<leader>sw", fzf.lsp_live_workspace_symbols, "[S]earch [W]orkspace Symbols")

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
          virtual_text = { source = "if_many", spacing = 2 },
        })
      end,
    })

    -- LSP specific configurations
    local servers = {
      -- Python
      pyright = {
        settings = {
          python = {
            analysis = {
              exclude = { "venv", ".venv" },
            },
          },
        },
        on_attach = function(client, bufrn)
          local capabilities = client.server_capabilities
          capabilities.referencesProvider = false
          capabilities.documentSymbolProvider = false
          capabilities.workspaceSymbolProvider = false
          -- capabilities.renameProvider = false
        end,
      },
      ty = {
        on_attach = function(client, bufrn)
          local capabilities = client.server_capabilities
          capabilities.declarationProvider = false
          capabilities.definitionProvider = false
          capabilities.typeDefinitionProvider = false
          capabilities.implementationProvider = false
          capabilities.documentHighlightProvider = false
          capabilities.colorProvider = false
          capabilities.diagnosticProvider = false
          capabilities.semanticTokensProvider = false
        end,
      },
      -- C/C++
      clangd = {},
      -- Lua
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      -- Java
      jdtls = {},
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, { "ruff", "stylua", "tombi" })
    for server, config in pairs(servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
  end,
}
