return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					-- default mode : "v"
					keymaps = {
						["af"] = { query = "@function.outer", desc = "Around the function" },
						["if"] = { query = "@function.iuter", desc = "Inside the function" },

						["aa"] = { query = "@paramerer.outer", desc = "Around the paramerer" },
						["ia"] = { query = "@parameter.iuter", desc = "Inside the paramerer" },

						["a:"] = { query = "@property.outer", desc = "Around the property" },
						["i:"] = { query = "@property.iuter", desc = "Inside the property" },

						["ac"] = { query = "@class.outer", desc = "Around the class" },
						["ic"] = { query = "@class.inner", desc = "Inside the class" },

						["ai"] = { query = "@conditional.outer", desc = "Around the conditional" },
						["ii"] = { query = "@conditional.inner", desc = "Inside the conditional" },

						["al"] = { query = "@loop.outer", desc = "Around the loop" },
						["il"] = { query = "@loop.iuter", desc = "Inside the loop" },

						["aC"] = { query = "@comment.outer", desc = "Around the comment" },
						["iC"] = { query = "@comment.inner", desc = "Inside the comment" },

					},
				},

				swap = {
					-- swap between prev, next, cur selected in V-Line Mode
					enable = true,
					swap_next = {
						["<leader>na"] = "@paramerer.inner", -- swap paramerer with next
						["<leader>n:"] = "@property.inner", -- swap property with next
						["<leader>nf"] = "@function.inner", -- swap function with next
					},
					swap_previous = {
						["<leader>pa"] = "@paramerer.inner", -- swap paramerer with prev
						["<leader>p:"] = "@property.inner", -- swap property with prev
						["<leader>pf"] = "@function.inner", -- swap function with prev
					}


				},

				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
						["]c"] = { query = "@class.outer", desc = "Next class start" },
						["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
						["]l"] = { query = "@loop.outer", desc = "Next loop start" },

						-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
						-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
						["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
						["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
					},
					goto_next_end = {
						["]F"] = { query = "@function.outer", desc = "Next method/function def end" },
						["]C"] = { query = "@class.outer", desc = "Next class end" },
						["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
						["]L"] = { query = "@loop.outer", desc = "Next loop end" },
					},
					goto_previous_start = {
						["[f"] = { query = "@function.outer", desc = "Prev method/function def start" },
						["[c"] = { query = "@class.outer", desc = "Prev class start" },
						["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
						["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
					},
					goto_previous_end = {
						["[F"] = { query = "@function.outer", desc = "Prev method/function def end" },
						["[C"] = { query = "@class.outer", desc = "Prev class end" },
						["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
						["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
					},
				},
			}
		})

		-- make movement repeatable
		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		-- vim way: ; goes to the direction you were moving.
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

		-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
	end

}
