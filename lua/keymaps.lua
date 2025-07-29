local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search buffers" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>", { desc = "Toggle Neo-Tree" })
