return {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- Required
    "nvim-tree/nvim-web-devicons",   -- For icons
    "stevearc/resession.nvim",       -- Optional, for session persistence
  },
  config = function()
    local get_hex = require("cokeline.hlgroups").get_hl_attr
    local green = vim.g.terminal_color_2 or "#00ff00"
    local yellow = vim.g.terminal_color_3 or "#ffff00"

    require("cokeline").setup({
      default_hl = {
        fg = function(buffer)
          return buffer.is_focused
            and get_hex("Normal", "fg")
            or get_hex("Comment", "fg")
        end,
        bg = get_hex("ColorColumn", "bg"),
      },

      components = {
        {
          text = "｜",
          fg = function(buffer)
            return buffer.is_modified and yellow or green
          end,
        },
        {
          text = function(buffer)
            return buffer.devicon.icon .. " "
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
        },
        {
          text = function(buffer)
            return buffer.index .. ": "
          end,
        },
        {
          text = function(buffer)
            return buffer.unique_prefix
          end,
          fg = get_hex("Comment", "fg"),
          italic = true,
        },
        {
          text = function(buffer)
            return buffer.filename .. " "
          end,
          bold = function(buffer)
            return buffer.is_focused
          end,
        },
        {
          text = " ",
        },
      },
    })
  end,
}

