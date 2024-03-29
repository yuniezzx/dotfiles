return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- source for lsp
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path",   -- source for file system paths
		"hrsh7th/cmp-cmdline", -- source for cmdline
		"saadparwaiz1/cmp_luasnip", -- for autocompletion

		"onsails/lspkind.nvim", -- add vscode-like pictograms
	},
	opts = function()
		--   פּ ﯟ   some other good icons
		local kind_icons = {
			Text = "󰊄",
			Method = "m",
			Function = "󰊕",
			Constructor = "",
			Field = "",
			Variable = "󰫧",
			Class = "",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "󰌆",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "󰉺",
		}

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		local check_backspace = function()
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
		end

		-- Use cmdline source for ":"
		cmp.setup.cmdline(':', {
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{
					name = 'cmdline',
				}
			}),
		})

		return {
			completion = {
				completeopt = "menu,menuone,preview,noinsert", -- check more info input :h completeopt
			},

			-- snippet configure how nvim-cmp interacts with snippet engine
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestion
				["<C-e>"] = cmp.mapping.abort(),       -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

				-- Use Tab to quick move down
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expandable() then
						luasnip.expand()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif check_backspace() then
						fallback()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				-- Use Shift Tab to quick move up
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			}),

			-- Sources and sorting for completion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- lsp
				{ name = "luasnip" }, -- snippets
				{ name = "path" }, -- text within current buffer
				{ name = 'buffer' }, -- file system paths,
			}),

			formatting = {
				format = function(entry, vim_item)
					local lspkind_ok, lspkind = pcall(require, "lspkind")
					if not lspkind_ok then
						-- From kind_icons array
						vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
						-- Source
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[LaTeX]",
						})[entry.source.name]
						return vim_item
					else
						-- From lspkind
						return lspkind.cmp_format()(entry, vim_item)
					end
				end
			},

			window = {
				completion = cmp.config.window.bordered(

				),
				documentation = cmp.config.window.bordered(),
			},
		}
	end

}
