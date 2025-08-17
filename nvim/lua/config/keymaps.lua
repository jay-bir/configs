vim.keymap.set("i", "jk", "<Esc>")

vim.opt.shiftwidth = 0
vim.opt.backspace = '2'
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.showcmd = true
vim.opt.tabstop = 2
vim.opt.laststatus = 2
vim.opt.list = true

vim.wo.number = true

vim.diagnostic.config({
    virtual_text=true
})
