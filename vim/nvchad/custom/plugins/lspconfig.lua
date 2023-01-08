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
          },
          procMacro = {
            enable = true,
          },
        },
      },
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
