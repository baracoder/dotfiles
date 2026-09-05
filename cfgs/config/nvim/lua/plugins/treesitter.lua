-- Take tree-sitter parsers from nix instead of compiling them.
--
-- nvim-treesitter's `main` branch builds every parser from source, so plain
-- `:Lazy update` needs a C compiler and the tree-sitter CLI on PATH. The
-- `nvim-treesitter-parsers` package in ~/src/baracoder-nix ships every
-- upstream parser plus its queries at the path below; pointing `install_dir`
-- there makes nvim-treesitter consider them installed, so LazyVim's
-- install-on-startup pass and the `build` step both become no-ops.
--
-- The store is read-only, so :TSInstall / :TSUpdate no longer work -- they
-- are not needed either, since everything is already there. New parsers
-- arrive with a `nix flake update`. On a machine without the package this
-- file disables itself and the normal compile-on-install behaviour is back.
local install_dir = vim.env.NVIM_TREESITTER_DIR or "/run/current-system/sw/share/nvim/site"

if not vim.uv.fs_stat(install_dir .. "/parser") then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = false,
    opts = { install_dir = install_dir },
  },
}
