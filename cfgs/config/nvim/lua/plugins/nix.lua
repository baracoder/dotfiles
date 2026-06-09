return {

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nixd = {},
        nil_ls = { enabled = false },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        statix = {
          condition = function(ctx)
            return false
          end,
        },
      },
    },
  },
}
