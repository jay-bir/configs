return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {"nvim-telescope/telescope-fzf-native.nvim", build= "make"}
        },
        config = function()
            require("telescope").setup {
                defaults = {
                    theme = require("telescope.themes").get_ivy()
                },
                extensions = {
                    fzf = {}
                }
            }

            require("telescope").load_extension("fzf")

            TB = require("telescope.builtin")
            vim.keymap.set("n", "<space>fd", function()
                local opts = require("telescope.themes").get_ivy()
                TB.find_files(opts)end)
            vim.keymap.set("n", "<space>fg", TB.live_grep)
            vim.keymap.set("n", "<space><space>", TB.oldfiles)
            -- lsp keymaps
            vim.keymap.set("n", "<space>gr", TB.lsp_references)
            vim.keymap.set("n", "<space>gd", TB.lsp_definitions)
            vim.keymap.set("n", "<space>gi", TB.lsp_implementations)
            vim.keymap.set("n", "<space>gt", TB.lsp_type_definitions)
            vim.keymap.set("n", "<space>gn", vim.lsp.buf.rename)

        end
    }
}
