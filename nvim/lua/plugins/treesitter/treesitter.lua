return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "windwp/nvim-ts-autotag" },
		{ "David-Kunz/markid" }

	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			-- enable syntax highlighting
			highlight = { enable = true },

			-- enable indentation
			indent = { enable = true },

			-- enable autotag
			autotag = { enable = true },

			-- enable markid
			markid = { enable = true },

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
			-- default mode "v"
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
