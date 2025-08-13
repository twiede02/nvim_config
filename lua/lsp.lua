local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Use LuaSnip to expand snippets
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),    -- trigger completion
    ["<C-e>"] = cmp.mapping.abort(),           -- cancel completion
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- confirm selection
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },  -- snippets
  }, {
    { name = "buffer" },
  }),
})

-- Optional: use cmp for cmdline completions
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


require("mason").setup()

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

-- C/C++ language server example: clangd
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index", "--clang-tidy" }, -- optional args
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
})



