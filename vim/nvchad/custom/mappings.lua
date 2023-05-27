local M = {}

M.ai = {
  n = {
    ["<leader>oc"] = { ":ChatGPT<CR>", "Open ChatGPT", opts = { nowait = true } },
    ["<leader>oa"] = { ":ChatGPTActAs<CR>", "Open ChatGPT act as prompts", opts = { nowait = true } },
    ["<leader>oe"] = {
      "<cmd>ChatGPTEditWithInstructions<CR>",
      "Open ChatGPT edit with instructions",
      opts = { nowait = true },
    },
    ["<leader>cp"] = { ":Copilot<CR>", "Use copilot", opts = { nowait = true } },
  },
  v = {
    ["<leader>e"] = {
      "<ESC><cmd>ChatGPTEditWithInstructions<CR>",
      "🔂 Open ChatGPT edit with instructions",
      opts = { nowait = true },
    },
  },
}

M.ergo = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    ["kj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    ["<C-d>"] = { "<C-d>zz", "Navigate half down and center cursor", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "Navigate half up and center cursor", opts = { nowait = true } },
  },
  n = {
    ["s"] = { "<cmd> w <CR>", "save file", opts = { nowait = true } },
    ["S"] = { "<cmd> wa <CR>", "save all unsaved buffers", opts = { nowait = true } },
    ["q"] = { "<cmd> q <CR>", "quit", opts = { nowait = true } },
    ["Q"] = { "<cmd> q! <CR>", "force quit", opts = { nowait = true } },
    ["<ENTER>"] = { "o<ESC>", "New line", opts = { nowait = true } },
    ["<C-d>"] = { "<C-d>zz", "Navigate half down and center cursor", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "Navigate half up and center cursor", opts = { nowait = true } },
    ["!"] = { ":! ", "Command", opts = { nowait = true } },
    [")"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
    ["("] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto next buffer",
    },
  },
}

M.notes = {
  n = {
    ["<leader>n"] = { ":Flote<CR>", "📝 Project notes", opts = { nowait = true } },
    ["<leader>mp"] = { ":MarkdownPreview<CR>", "📑 Start markdown preview", opts = { nowait = true } },
    ["<leader>ms"] = { ":MarkdownPreviewStop<CR>", "🙅‍♂️ Stop markdown preview", opts = { nowait = true } },
    ["<leader>mg"] = { ":Flote global<CR>", "🌏 Global notes", opts = { nowait = true } },
    ["<leader>mn"] = { ":Flote manage<CR>", "⚙️  Manage notes", opts = { nowait = true } },
  },
}

M.lsp = {
  n = {
    ["<leader>q"] = {
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      "Troubleshoot workspace",
      opts = { nowait = true },
    },
  },
}

M.cpp = {
  n = {
    ["cmg"] = { "<cmd>CMakeGenerate<cr>", "Cmake generate", opts = { nowait = true } },
    ["cmb"] = { "<cmd>CMakeBuild<cr>", "Cmake build", opts = { nowait = true } },
    ["cmo"] = { "<cmd>CMakeOpen<cr>", "Cmake open", opts = { nowait = true } },
    ["cmc"] = { "<cmd>CMakeClose<cr>", "Cmake close", opts = { nowait = true } },
    ["cmt"] = { "<cmd>CMakeTest<cr>", "Cmake test", opts = { nowait = true } },
    ["cmi"] = { "<cmd>CMakeInstall<cr>", "Cmake install", opts = { nowait = true } },
  },
}

M.debug = {
  n = {
    ["<leader>d1"] = { ":lua require('dap').step_over()<cr>", "Step over", opts = { nowait = true } },
    ["<leader>d2"] = { ":lua require('dap').step_into()<cr>", "Step into", opts = { nowait = true } },
    ["<leader>d3"] = { ":lua require('dap').step_out()<cr>", "Step out", opts = { nowait = true } },
    ["<leader>d4"] = { ":lua require('dap').continue()<cr>", "Continue", opts = { nowait = true } },
    ["<leader>d5"] = { ":lua require('dap').continue()<cr>", "Start debugging", opts = { nowait = true } },
    ["<leader>db"] = { ":lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint", opts = { nowait = true } },
    ["<leader>dq"] = { ":lua require('dap').close()<cr>", "Quit debugging", opts = { nowait = true } },
    ["<leader>de"] = { ":lua require('dapui').eval()<cr>", "Evaluate", opts = { nowait = true } },
    ["<leader>du"] = { ":lua require('dapui').toggle()<cr>", "Toggle UI", opts = { nowait = true } },
    ["<leader>df"] = { ":lua require('dapui').float_element()<cr>", "Float element", opts = { nowait = true } },
    ["<A-1>"] = { ":lua require('dap').step_over()<cr>", "Step over", opts = { nowait = true } },
    ["<A-2>"] = { ":lua require('dap').step_into()<cr>", "Step into", opts = { nowait = true } },
    ["<A-3>"] = { ":lua require('dap').step_out()<cr>", "Step out", opts = { nowait = true } },
    ["<A-4>"] = { ":lua require('dap').continue()<cr>", "Continue", opts = { nowait = true } },
    ["<A-5>"] = { ":lua require('dap').continue()<cr>", "Start debugging", opts = { nowait = true } },
    ["<A-6>"] = { ":lua require'dap'.repl.open()<cr>", "Inspect state", opts = { nowait = true } },
  },
}

M.find = {
  n = {
    ["<leader>ft"] = { ":TodoTelescope<cr>", "Find all comment tags", opts = { nowait = true } },
    ["<leader>fq"] = { ":TodoTrouble<cr>", "Open troble tags", opts = { nowait = true } },
    ["<leader>fk"] = {
      ":TodoTelescope keywords=FIX,TODO,BUG,FIX<cr>",
      "Find keyword comment tags",
      opts = { nowait = true },
    },
  },
}

M.telescope = {
  plugin = true,

  -- n = {
  --   -- find
  --   ["<leader>ff"] = { "<cmd> Telescope find_files hidden=true no_ignore=true <CR>", "find files" },
  -- },
}

M.git = {
  n = {
    ["<leader>gg"] = { ":LazyGit<cr>", "Open lazygit", opts = { nowait = true } },
    ["<leader>gh"] = { ":LazyGitFilterCurrentFile<cr>", "Open current buffer commits", opts = { nowait = true } },
    ["<leader>gc"] = { ":LazyGitConfig<CR>", "Open lazygit config", opts = { nowait = true } },
  },
}

M.bufferstuff = {
  n = {
    ["f"] = { ":HopWord<cr>", "Hop word on the entire buffer", opts = { nowait = true } },
    [";"] = { ":HopChar1CurrentLine<cr>", "Hop 1 character on current line", opts = { nowait = true } },
    ["<leader>cb"] = { ":%bd|e#|bd#<CR>", "Close all except active buffer", opts = { nowait = true } },
  },
}

M.bufferstuff = {
  n = {
    ["f"] = { ":HopWord<cr>", "Hop word on the entire buffer", opts = { nowait = true } },
    [";"] = { ":HopChar1CurrentLine<cr>", "Hop 1 character on current line", opts = { nowait = true } },
    ["<leader>cb"] = { ":%bd|e#|bd#<CR>", "Close all except active buffer", opts = { nowait = true } },
  },
}

-- NOTE: Project specific mappings
M.projects = {
  n = {
    ["<leader>;"] = {
      ":! dotnet build ./src/MedborgarappHost/MedborgarappHost.csproj<CR>:lua require('dap').continue()<CR>",
      "🐛 Build and debug Medborgarapp",
      opts = { nowait = true },
    },
  },
}

-- HACK: add custom mappings to fix issues
M.hack = {
  n = {
    -- fix for toggling terminals in warp
    ["<A-b>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    ["<A-;>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    -- fix formatting not working in rust
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = false }
      end,
      "lsp formatting",
    },
    -- alternate mapping for <C-u> in warp
    ["<S-u>"] = { "<C-u>zz", "Navigate half up and center cursor", opts = { nowait = true } },
  },
  t = {
    ["<M-b>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    ["<M-;>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
  },
}

return M
