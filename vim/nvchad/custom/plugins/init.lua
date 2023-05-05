local overrides = require "custom.plugins.overrides"

return {
  -- custom plugins
  ["jackMort/ChatGPT.nvim"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "ChatGPT.nvim"
    end,
    config = function()
      require("chatgpt").setup {}
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  ["mfussenegger/nvim-dap"] = {
    opt = true,
    event = "BufReadPre",
    module = { "dap" },
    wants = { "nvim-dap-virtual-text", "nvim-dap-ui", "which-key.nvim" },
    requires = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim",
      { "leoluz/nvim-dap-go", module = "dap-go" },
    },
    config = function()
      require("custom.plugins.dap").setup()
    end,
  },
  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  },
  ["phaazon/hop.nvim"] = {
    branch = "v2", -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["kylechui/nvim-surround"] = {
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  ["JellyApple102/flote.nvim"] = {
    config = function()
      require("flote").setup {}
    end,
  },
  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  ["MunifTanjim/nui.nvim"] = {},
  ["kdheepak/lazygit.nvim"] = {},
  ["cdelledonne/vim-cmake"] = {},
  ["github/copilot.vim"] = {},

  -- override plugin configs
  ["goolord/alpha-nvim"] = {
    disable = false,
    override_options = overrides.alpha,
  },
  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },
  -- ["kyazdani42/nvim-tree.lua"] = {
  --   requires = {
  --     "nvim-tree/nvim-web-devicons", -- optional, for file icons
  --   },
  --   override_options = overrides.nvimtree,
  -- },
  ["NvChad/nvterm"] = {
    override_options = overrides.nvterm,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- fix plugin not loading
  ["folke/which-key.nvim"] = {
    disable = false,
  },
}
