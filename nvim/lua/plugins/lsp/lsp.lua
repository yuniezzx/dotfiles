return {
    {
        "williamboman/mason-lspconfig.nvim", --  bridges for mason.nvim and lspconfig
        opts = {
            ensure_installed = {
                "tsserver",
                "lua_ls",
                "pyright",
                "cssls",
                "rust_analyzer",
            },
            automatic_installation = true,
        }
    },
    {
        "neovim/nvim-lspconfig",

        -- 'BufReadPre': When starting to edit a new buffer, before reading the file into the buffer.
        -- 'BufNewFile': When starting to edit a file that doesn't exist.
        event = { 'BufReadPre', 'BufNewFile' },

        main = "plugins.lsp.settings.lspconfig",
        config = true

    },
    {
        "williamboman/mason.nvim", -- mason use to manage external editor toolings such as LSP servers, DAP servers, linters, and formatters
        cmd = "Mason",
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "◍",
                    package_pending = "◍",
                    package_uninstalled = "◍",
                },
            },
        }

    }
}
