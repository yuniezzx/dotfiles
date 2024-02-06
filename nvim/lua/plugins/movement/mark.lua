return {
	"chentoast/marks.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function ()
		local marks = require("marks")
		marks.setup{}
	end

}
