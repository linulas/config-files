local M = {}

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

M.alpha = {
  buttons = {
    val = {
      button("SPC f f", "  Find File  ", ":Telescope find_files hidden=true no_ignore=true <CR>"),
      button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
      button("SPC f w", "  Find Word  ", ":Telescope live_grep hidden=true no_ignore=true <CR>"),
      button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
      button("SPC t h", "  Themes  ", ":Telescope themes<CR>"),
      button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
    },
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = { "node_modules", "cache", "build", ".next", "target", ".git", ".svelte-kit" },
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
    "go-debug-adapter",
    "gofumpt",
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
    },
  },
}

M.cmp = {
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  -- Installed sources:
  sources = {
    { name = "luasnip" },
    { name = "path" }, -- file paths
    { name = "nvim_lsp", keyword_length = 3 }, -- from language server
    { name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
    { name = "nvim_lua", keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
    { name = "buffer", keyword_length = 2 }, -- source current buffer
    { name = "vsnip", keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
    { name = "calc" }, -- source for math calculation
    { name = "nvim_lsp" },
  },
  formatting = {
    fields = { "menu", "abbr", "kind" },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "λ",
        vsnip = "⋗",
        buffer = "Ω",
        path = "🖫",
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
}

return M
