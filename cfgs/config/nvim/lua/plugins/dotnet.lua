return {
  {
    "seblyng/roslyn.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = { enabled = false },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "roslyn-language-server" } },
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    enabled = false,
  },
}
