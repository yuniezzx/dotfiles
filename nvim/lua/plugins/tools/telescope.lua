return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false, -- telescope did only one release, so use HEAD for now
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		{
			"nvim-telescope/telescope-project.nvim",
		},
	},

	config = function()
		local telescope = require('telescope')
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				-- open files in the first window that is an actual file.
				-- use the current window if no other window is available.
				get_selection_window = function()
					local wins = vim.api.nvim_list_wins()
					table.insert(wins, 1, vim.api.nvim_get_current_win())
					for _, win in ipairs(wins) do
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.bo[buf].buftype == "" then
							return win
						end
					end
					return 0
				end,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
					n = {
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,    -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", --  defaults case "smart_case" or "ignore_case" or "respect_case"
				},
				project = {
					hidden_files = true,
					theme = "dropdown",
					order_by = "asc",
				},
			}
		})

		telescope.load_extension('fzf') -- windows not working
		telescope.load_extension('project')
		telescope.load_extension('notify')
	end
}
