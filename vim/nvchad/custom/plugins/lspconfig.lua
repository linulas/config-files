-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- NOTE: Available configuration servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "html",
  "cssls",
  -- "dotls",
  "svelte",
  -- "eslint", -- install lsp with 'npm i -g vscode-langservers-extracted'
  "jsonls", -- install lsp with 'npm i -g vscode-langservers-extracted'
  "tsserver",
  "rust_analyzer",
  "yamlls",
  "gopls",
  "graphql",
  "clangd",
  "marksman",
  "csharp_ls",
}

for _, lsp in ipairs(servers) do
  if lsp == "rust_analyzer" then
    lspconfig.rust_analyzer.setup {
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          imports = {
            granularity = {
              group = "module",
            },
            prefix = "self",
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
            features = { "models", "mongo" },
          },
          procMacro = {
            enable = true,
          },
        },
      },
    }
  -- elseif lsp == "omnisharp" then
  --   local pid = vim.fn.getpid()
  --   local omnisharp_bin = "/Users/linusbrannstrom/.local/share/nvim/mason/bin/omnisharp"
  --   lspconfig.omnisharp.setup {
  --     on_attach = on_attach,
  --     capabilities = capabilities,
  --     cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  --     filetypes = { "cs", "vb" },
  --   }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
