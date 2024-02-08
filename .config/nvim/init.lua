local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

--Line numbers
vim.wo.number = true

require("lazy").setup({
{
	"nobbmaestro/nvim-andromeda",
	dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" }
	}

})

require("andromeda").setup({
  preset = "andromeda",
  transparent_bg = true
})

vim.cmd[[set background=dark]]
vim.cmd[[set t_Co=256]]

