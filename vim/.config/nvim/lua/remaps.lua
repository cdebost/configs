vim.g.mapleader = " "

-- Fast saving
vim.keymap.set("n", "<leader>w", ":w!<cr>")

-- Swap between buffers
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- Toggle numbers
vim.keymap.set("n", "<leader>nn", ":set number!<cr> :set relativenumber!<cr>")
