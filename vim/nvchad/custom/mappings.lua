local M = {}


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
    ["<C-d>"] = { "<C-d>zz", "Navigate half down and center cursor", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "Navigate half up and center cursor", opts = { nowait = true } },
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
    ["<leader>dt"] = { ":TroubleToggle workspace_diagnostics<cr>", "Troubleshoot workspace", opts = { nowait = true } },
  },
}

M.find = {
  n = {
    ["<leader>ft"] = { ":TodoTelescope<cr>", "Find all comment tags", opts = { nowait = true } },
    ["<leader>fk"] = {
      ":TodoTelescope keywords=FIX,TODO,BUG<cr>",
      "Find keyword comment tags",
      opts = { nowait = true },
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files hidden=true no_ignore=true <CR>", "find files" },
  },
}

M.buffernav = {
  n = {
    ["f"] = { ":HopWord<cr>", "Hop word on the entire buffer", opts = { nowait = true } },
    [";"] = { ":HopChar1CurrentLine<cr>", "Hop 1 character on current line", opts = { nowait = true } },
  },
}

-- HACK: add custom mappings to fix nvchad issues
M.jatch = {
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
  }
}

return M
