return {
  {
    -- Without an explicit formatter, LazyVim falls back to every LSP that can
    -- format, so vtsls re-formats after oxfmt and undoes its ternary indentation.
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "oxfmt" },
        typescriptreact = { "oxfmt" },
        javascript = { "oxfmt" },
        javascriptreact = { "oxfmt" },
      },
    },
  },
}
