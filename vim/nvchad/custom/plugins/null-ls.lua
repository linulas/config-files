local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

-- NOTE: Null ls builtins: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local b = null_ls.builtins

local sources = {
  -- Rust
  b.formatting.rustfmt.with { extra_args = { "--edition", "2018" } },
  -- b.formatting.dprint,
  -- b.diagnostics.ltrs,

  -- Go
  -- b.diagnostics.golangci_lint,
  b.formatting.gofumpt,

  -- C++
  b.formatting.clang_format,

  -- FIX: prettierd formatting not working

  -- webdev stuff
  -- b.formatting.prettierd.with {
  --   filetypes = {
  --     "javascript",
  --     "javascriptreact",
  --     "typescript",
  --     "typescriptreact",
  --     "vue",
  --     "css",
  --     "scss",
  --     "less",
  --     "html",
  --     "json",
  --     "jsonc",
  --     "yaml",
  --     "markdown",
  --     "markdown.mdx",
  --     "graphql",
  --     "handlebars",
  --     "svelte",
  --   },
  -- },

  -- NOTE: temporary until above issue is fixed
  b.formatting.prettier.with {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "json",
      "jsonc",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
      "svelte",
    },
  },
  b.code_actions.eslint_d,
  -- b.diagnostics.eslint_d,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  b.code_actions.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
