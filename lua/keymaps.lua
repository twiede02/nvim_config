local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search buffers" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>", { desc = "Toggle Neo-Tree" })


vim.keymap.set("n", "<S-l>", "<Plug>(cokeline-focus-next)", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<Plug>(cokeline-focus-prev)", { desc = "Prev buffer" })
