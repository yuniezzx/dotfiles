return {
	"nvim-neo-tree/neo-tree.nvim",
	event = LazyVimStarted,
	branch = "v3.x",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
		window = {
			position = "left",
			width = 30,
		},
	}
}
