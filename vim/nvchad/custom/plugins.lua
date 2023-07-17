local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  -- Install a plugin
  {
    "jackMort/ChatGPT.nvim",
    cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions" },
    config = function()
      require("chatgpt").setup {}
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "mfussenegger/nvim-dap",
    event = "BufReadPre",
    module = { "dap" },
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim",
      { "leoluz/nvim-dap-go", module = "dap-go" },
    },
    config = function()
      require("custom.configs.dap").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  },
  {
    "phaazon/hop.nvim",
    cmd = { "HopWord", "HopChar1CurrentLine" },
    branch = "v2", -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    -- cmd = { "TodoTelescope", "TodoTelescope" },
    dependencies = "nvim-lua/plenary.nvim",
    opts = require "custom.configs.todo_comments",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "custom.configs.null-ls"
    end,
  },
  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "JellyApple102/flote.nvim",
    cmd = "Flote",
    config = require "custom.configs.flote",
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    event = "BufRead",
    ft = { "markdown" },
  },
  { "MunifTanjim/nui.nvim" },
  { "kdheepak/lazygit.nvim", cmd = "LazyGit" },
  {
    "cdelledonne/vim-cmake",
    cmd = { "CMakeGenerate", "CMakeBuild", "CMakeOpen", "CMakeClose", "CMakeTest", "CMakeInstall" },
  },
  {
    "Exafunction/codeium.vim",
    lazy = false,
    config = require "custom.configs.codeium",
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },
  { "folke/zen-mode.nvim", cmd = "ZenMode" },
  -- {
  --   "folke/edgy.nvim",
  --   event = "VeryLazy",
  --   init = function()
  --     vim.opt.laststatus = 3
  --     vim.opt.splitkeep = "screen"
  --   end,
  --   opts = {
  --     bottom = {
  --       "Trouble",
  --       {
  --         ft = "help",
  --         size = { height = 20 },
  --         -- only show help buffers
  --         filter = function(buf)
  --           return vim.bo[buf].buftype == "help"
  --         end,
  --       },
  --     },
  --     left = {
  --       {
  --         ft = "terminal",
  --         size = { height = 0.5 },
  --       },
  --     },
  --   },
  -- },
}

return plugins
