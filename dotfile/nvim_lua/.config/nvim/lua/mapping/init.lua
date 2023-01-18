local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- leader key

--> nvim tree mappings <--
map("n", "t", ":NvimTreeToggle<CR>", opts)
--map("n", "mm", ":!go run .<CR>", opts)
map("n", "mm", ":!python main.py .<CR>", opts)
--map("n", "mm", ":!cargo r .<CR>", opts)
