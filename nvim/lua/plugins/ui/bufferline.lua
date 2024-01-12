return {
	'akinsho/bufferline.nvim',
	version = "*",
	event = "VeryLazy",
	opts = {
		options = {
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "center",
					separator = true,
					padding = 1,
				},
			},
		}
	},
	config = function(_, opts)
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd("BufAdd", {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
