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
	},
	config = function()
		local servers = {
			pyright = {
				settings = {
					python = {
						analysis = {
							exclude = { "build" },
						},
					},
				},
			},
			clangd = {},
			jdtls = {},
			lua_ls = {},
		}
		for server, config in pairs(servers) do
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end,
}
