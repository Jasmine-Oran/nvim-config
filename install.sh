#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo '请先安装 Homebrew：https://brew.sh/' >&2
  exit 1
fi

# Neovim and the external tools used by lazy.nvim, Mason, Treesitter and Snacks.
brew install neovim git ripgrep fd node python tree-sitter-cli imagemagick gnu-tar

if ! command -v cc >/dev/null 2>&1; then
  echo '缺少 C 编译器。请先运行 xcode-select --install，再重新执行此脚本。' >&2
  exit 1
fi

# lazy.nvim installs plugins; Mason installs the configured LSP servers and formatters.
nvim --headless \
  '+Lazy! sync' \
  "+lua require('nvim-treesitter').install({'python', 'lua', 'json', 'toml', 'yaml'}):wait(300000)" \
  "+lua require('mason-tool-installer').setup({ensure_installed = {'basedpyright', 'lua_ls', 'jsonls', 'taplo', 'yamlls', 'black', 'stylua'}, run_on_start = false})" \
  '+MasonToolsInstallSync' \
  '+qa'

echo 'Neovim 配置安装完成。'
