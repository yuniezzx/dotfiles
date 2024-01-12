return {
	"echasnovski/mini.indentscope",
	version = false,
	event = { "bufReadPost", "BufNewFile", },
	opts = {
		symbol = "│",
		options = {
			border = "both",
			indent_at_cursor = true,
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
