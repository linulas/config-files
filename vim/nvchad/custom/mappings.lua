local M = {}
local hop = require('hop')

M.ergo = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true }},
    ["kj"] = { "<ESC>", "escape insert mode", opts = { nowait = true }},
  }
}

M.debug = {
  n = {
    ["<leader>d1"] = { ":lua require('dap').step_over()<cr>", "Step over", opts = { nowait = true }},
    ["<leader>d2"] = { ":lua require('dap').step_into()<cr>", "Step into", opts = { nowait = true }},
    ["<leader>d3"] = { ":lua require('dap').step_out()<cr>", "Step out", opts = { nowait = true }},
    ["<leader>d4"] = { ":lua require('dap').continue()<cr>", "Continue", opts = { nowait = true }},
    ["<leader>d5"] = { ":lua require('dap').continue()<cr>", "Start debugging", opts = { nowait = true }},
    ["<leader>db"] = { ":lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint", opts = { nowait = true }},
    ["<leader>dq"] = { ":lua require('dap').close()<cr>", "Quit debugging", opts = { nowait = true }},
    ["<leader>de"] = { ":lua require('dapui').eval()<cr>", "Evaluate", opts = { nowait = true }},
    ["<leader>du"] = { ":lua require('dapui').toggle()<cr>", "Toggle UI", opts = { nowait = true }},
    ["<leader>dt"] = { ":TroubleToggle workspace_diagnostics<cr>", "Troubleshoot workspace", opts = { nowait = true }},
  }
}

M.find = {
  n = {
    ["<leader>ft"] = { ":TodoTelescope<cr>", "Find all comment tags", opts = { nowait = true }},
    ["<leader>fk"] = { ":TodoTelescope keywords=FIX,TODO,BUG<cr>", "Find keyword comment tags", opts = { nowait = true }},
  }
}

-- M.format = {
--   n = {
--     -- ["<leader>;p"] = { "<Plug>(prettier-format)", "Format document with prettier", opts = { nowait = true }},
--   }
-- }

M.buffernav = {
  n = {
    ["f"] = { ":HopWord<cr>", "Hop word on the entire buffer", opts = { nowait = true }},
    [";"] = { ":HopChar1CurrentLine<cr>", "Hop 1 character on current line", opts = { nowait = true }},
  }
}

-- fix for toggling terminals in warp
M.patch = {
  n = {
    [","] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
    ["<Enter>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    ["<BS>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
  },
}

return M
