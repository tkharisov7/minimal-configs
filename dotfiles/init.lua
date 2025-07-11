vim.o.undofile      = true
vim.o.clipboard     = "unnamedplus"
vim.o.laststatus    = 0
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = -1
vim.cmd("syntax off | highlight Normal guifg=#ffaf00 guibg=#000000")
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.fn.expand('%:e') == 'tex' then
            vim.treesitter.start()
        else
            vim.treesitter.stop()
        end
    end
})
vim.keymap.set('n', '<space>y', function() vim.fn.setreg('+', vim.fn.expand('%:p')) end)
vim.keymap.set("n", "<space>c", function() vim.cmd("noswapfile enew | setlocal buftype=nofile bufhidden=wipe | call feedkeys(':r !', 'n')") end)
vim.keymap.set('i', '<DEL>', '<C-w>')
