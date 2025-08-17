return {
    { "neovim/nvim-lspconfig",
       config = function()
           local capabilities = require("blink.cmp").get_lsp_capabilities()
           require("lspconfig").clangd.setup({
               capabilities = capabilities,
               cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
               init_options = {
                   fallbackFlags = { '-std=c++23' },
               },
           })
           require("lspconfig").lua_ls.setup {
             on_init = function (client)
               if client.workspace_folders then
                 local path = client.workspace_folders[1].name
                 if
                   path ~= vim.fn.stdpath('config')
                   and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                 then
                   return
                 end
             end

             client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
               runtime = {
                 version = 'LuaJIT',
                 path = {
                   'lua/?.lua',
                   'lua/?/init.lua',
                 },
               },
              workspace = {
               checkThirdParty = false,
               library = {
                 vim.env.VIMRUNTIME
               }
             }
           })
          end,
          settings = {
            Lua = {}
          }
        }

       vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)
       end,
   }
}
