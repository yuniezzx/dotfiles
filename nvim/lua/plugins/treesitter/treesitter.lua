return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		
		treesitter.setup({
			-- enable syntax highlighting
			highlight = {
				enable = true,
			},

			-- enable indentation
			indent = { enable = true },

			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"bash",
				"lua",
				"vim",
				"gitignore",
				"rust",
				"toml",
				"query",
			},

			-- incremental selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-spcae>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<BS>",
				},
			},
		})
	end,
}
