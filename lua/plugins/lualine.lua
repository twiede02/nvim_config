return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional but recommended
    config = function()
        require("lualine").setup()
    end,
}

