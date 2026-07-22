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
    -- LazyVim's csharpier formatter omits --stdin-path when csharpier isn't a
    -- local dotnet tool at nvim's cwd, so csharpier can't locate .csharpierrc.json
    -- and falls back to printWidth 80 instead of the repo's 160. Pass --stdin-path
    -- so it resolves config from the file's path. Uses the global csharpier, which
    -- currently formats identically to the repo's pinned 1.3.0.
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        csharpier = {
          command = "csharpier",
          args = { "format", "--stdin-path", "$FILENAME" },
        },
      },
    },
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    enabled = false,
  },
}
