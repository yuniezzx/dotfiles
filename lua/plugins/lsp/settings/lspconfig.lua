local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

---- config lsp completion ----

-- protected call to get the cmp
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
    return
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)



---- set up keymaps ----
local function lsp_keymaps(bufnr)
    local keymap = vim.keymap

    keymap.set("n", "gr", "<Cmd>Telescope lsp_references<CR>",
        { desc = "Show Lsp references", noremap = true, silent = true, buffer = bufnr })

    keymap.set("n", "gD", "vim.lsp.buf.declaration",
        { desc = "Go to declaration", noremap = true, silent = true, buffer = bufnr })

    keymap.set("n", "gd", "<Cmd>Telescope lsp_definitions<CR>",
        { desc = "Show Lsp definition", noremap = true, silent = true, buffer = bufnr })
end


M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
end


M.setup = function()
    require("plugins.lsp.settings.servers")
    require("plugins.lsp.settings.diagnostics")
end


return M
