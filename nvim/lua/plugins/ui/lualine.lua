return {
	'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = "VeryLazy",
	opts = {
		options = {
			icons_enabled = true,
			theme = 'tokyonight',
			component_separators = { left = '', right = ''},
    		section_separators = { left = '', right = ''},    	
		},
	
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'filetype'},
		lualine_y = {
			{ "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
		},
		lualine_z = {
			 function()
            	return " " .. os.date("%R")
             end,
		},
	},
},
}

