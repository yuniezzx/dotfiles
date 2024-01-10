local capabilities = require("plugins.lsp.settings.lspconfig").capabilities
local on_attach = require("plugins.lsp.settings.lspconfig").on_attach
local lspconfig = require("lspconfig")

local servers = {
	["lua_ls"] = function()
		return {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							vim.env.VIMRUNTIME,
							vim.fn.stdpath("config") .. "/lua",
							vim.api.nvim_get_runtime_file("", true),
						},
					},
					hint = { enable = true },
				},
			},
		}
	end,

	["rust_analyzer"] = function()
		return {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					diagnostics = {
						enable = true,
					},
				},
			},
		}
	end,

	["html"] = function()
		return {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,

	["tsserver"] = function()
		return {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
	["pyright"] = function()
		return {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,

	["cssls"] = function()
		return {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,

}


for server, setup in pairs(servers) do
	lspconfig[server].setup(setup())
end
