local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
    { import = "plugins.colorschemes" },
    { import = "plugins.completion" },
    { import = "plugins.dependencies" },
    { import = "plugins.lsp" },
    { import = "plugins.movement" },
    { import = "plugins.tools" },
    { import = "plugins.treesitter" },
    { import = "plugins.ui" },
  },
	defaults = {
		lazy = false,
		version = false,
	},
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "netrw",
        "netrwPlugin",
        -- "matchit",
        -- "matchparen",
        -- "tutor",
        "zipPlugin",
      },
    },
  },
})
