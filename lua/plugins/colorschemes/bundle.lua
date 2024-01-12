return {
	{
		"folke/tokyonight.nvim",
  		lazy = false,
  		priority = 1000,
  		opts = {
			style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			styles = {
     			comments = { italic = true },
    			keywords = { italic = true },
    			functions = {},
    			variables = {},
       			sidebars = "dark", -- style for sidebars, see below
    			floats = "dark", -- style for floating windows
  			},
		},
	},
	{
		"catppuccin/nvim", 
		name = "catppuccin", 
		priority = 1000,
		opts = {
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			background = { light = "latte", dark = "mocha" },
			transparent_background = true,
        	integrations = {
          		cmp = true,
          		gitsigns = true,
          		harpoon = true,
          		lsp_trouble = true,
          		leap = true,
          		mason = true,
          		mini = true,
          		noice = true,
          		notify = true,
          		-- nvimtree = true,
          		rainbow_delimiters = true,
          		telescope = true,
          		treesitter_context = true,
          		treesitter = true,
          		which_key = true,
        },
		},
	},
}




