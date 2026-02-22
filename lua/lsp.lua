local cmp = require("cmp")
local luasnip = require("luasnip")

local on_attach = function(_, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }

  -- Show hover documentation (like Kickstart had)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  -- Show diagnostics for the current line
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
end

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

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable("lua_ls")


-- CLANGD (C / C++ / CUDA)
vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    ".git",
  },
  on_attach = on_attach,
})

vim.lsp.enable("clangd")


