local highlight = {
	"CursorColumn",
	"Whitespace",
}

return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "bufReadPost", "BufNewFile", },
	main = "ibl",
	opts = {
		indent = {
			char = "",
			tab_char = "",
			highlight = highlight,
		},
		whitespace = {
			highlight = highlight,
			remove_blankline_trail = false,
		},
	},


}
