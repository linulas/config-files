vim.opt.relativenumber = true
-- vim.g.copilot_assume_mapped = true

-- disable diagnostics for env files
local group = vim.api.nvim_create_augroup("__env", {clear=true})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ".env",
  group = group,
  callback = function(args)
    vim.diagnostic.disable(args.buf)
  end
})

-- Widnows specific
-- vim.cmd [[
-- set shell=powershell.exe
-- set shellxquote=
-- let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
-- let &shellquote   = ''
-- let &shellpipe    = '| Out-File -Encoding UTF8 %s'
-- let &shellredir   = '| Out-File -Encoding UTF8 %s'
-- ]]

-- LSP Diagnostics Options Setup
-- local sign = function(opts)
--   vim.fn.sign_define(opts.name, {
--     texthl = opts.name,
--     text = opts.text,
--     numhl = "",
--   })
-- end
--
-- sign { name = "DiagnosticSignError", text = "" }
-- sign { name = "DiagnosticSignWarn", text = "" }
-- sign { name = "DiagnosticSignHint", text = "" }
-- sign { name = "DiagnosticSignInfo", text = "" }
--
-- vim.diagnostic.config {
--   virtual_text = false,
--   signs = true,
--   update_in_insert = true,
--   underline = true,
--   severity_sort = false,
--   float = {
--     border = "rounded",
--     source = "always",
--     header = "",
--     prefix = "",
--   },
-- }

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
-- vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
-- vim.opt.shortmess = vim.opt.shortmess + { c = true }
-- vim.api.nvim_set_option("updatetime", 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
-- vim.cmd [[
-- set signcolumn=yes
-- autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]]

-- Treesitter folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
