return {
	"L3MON4D3/LuaSnip", -- snippet engine
	dependencies = {
    	"rafamadriz/friendly-snippets",  -- a bundle of snippets
    	config = function()
      		require("luasnip.loaders.from_vscode").lazy_load()
    	end,
  },
}
