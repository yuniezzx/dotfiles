return {
	"nvim-treesitter/nvim-treesitter",
	build = { "TSInstall", "TSUpdate" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	event = { "LazyFile", "VeryLazy" },
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			event = "LazyFile",
			enabled = true,
			opts = { mode = "cursor", max_lines = 3 },
		},
		{
			"JoosepAlviste/nvim-ts-context-commentstring", -- use gcc for comments
			lazy = true,
			opts = {
				enable_autocmd = false,
			},
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			event = { "BufRead", "BufNewFile" },
		},
		{
			"windwp/nvim-ts-autotag",
			event = "LazyFile",
			opts = {},
		},
	},

	opts = {
		ensure_installed = {
			"astro",
			"bash",
			"bibtex",
			"c",
			"cpp",
			"css",
			"gitcommit",
			"gitignore",
			"go",
			"html",
			"java",
			"javascript",
			"json",
			-- "latex",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"php",
			"python",
			"query",
			"regex",
			"rust",
			"sql",
			"ssh_config",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
}
