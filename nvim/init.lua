if vim.g.vscode then
  print("Neovim is running inside VSCode")
  USER_PROFILE = "vscode"
else
  USER_PROFILE = "dead-line"
end

-- import .vimrc
vim.cmd("source ~/.vimrc")

-- Map leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- import settings
require(USER_PROFILE .. ".lazy")
require(USER_PROFILE .. ".mappings")
