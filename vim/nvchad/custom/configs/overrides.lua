local M = {}

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "codeium" },
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "cache",
      "build",
      ".next",
      "target",
      ".git",
      ".svelte-kit",
      "Debug",
      "main.dSYM",
    },
  },
}
M.treesitter = {
  ensure_installed = {
    "lua",
    "html",
    "css",
    "typescript",
    "javascript",
    "rust",
    "go",
    "toml",
    "graphql",
    "yaml",
    "svelte",
  },
  auto_install = true,
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "emmet-ls",
    "json-lsp",
    "svelte-language-server",
    "json-lsp",
    "prettierd",
    "eslint_d",

    -- graphql
    "graphql-language-service-cli",

    -- yaml
    "yaml-language-server",

    -- shell
    "shfmt",
    "shellcheck",

    -- rust
    "rust-analyzer",
    "codelldb",
    "rustfmt",

    -- go
    "gopls",
    "golangci-lint",
    -- "go-debug-adapter",
    "gofumpt",

    -- dotnet
    "csharp-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
    custom = { "^.git$" },
  },
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.nvterm = {
  terminals = {
    list = {},
    type_opts = {
      float = {
        relative = "editor",
        row = 0.1,
        col = 0.05,
        width = 0.9,
        height = 0.72,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = 0.5 },
      vertical = { location = "rightbelow", split_ratio = 0.3 },
    },
  },
}

return M
