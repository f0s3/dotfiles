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
vim.opt.showmode = false

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

--Line numbers
vim.wo.number = true

require("lazy").setup({
  { "nobbmaestro/nvim-andromeda", dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" } },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "lewis6991/gitsigns.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "bash", "c", "c_sharp", "cmake", "comment", "cpp", "css", "csv", "diff", "disassembly", "dockerfile", "git_config", "git_rebase", "gitcommit", "gitignore", "html", "http", "java", "javascript", "jsdoc", "json", "json5", "lua", "luadoc", "luap", "make", "markdown", "markdown_inline", "nasm", "objc", "objdump", "passwd", "pem", "php", "phpdoc", "pod", "printf", "pug", "regex", "requirements", "scss", "sql", "ssh_config", "tsx", "vim", "vimdoc", "vue", "xml", "yaml" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
  {
  "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_lspconfig.setup({
        ensure_installed = {
          "tsserver",
          "html",
          "cssls",
          "tailwindcss",
          "svelte",
          "lua_ls",
          "graphql",
          "emmet_ls",
          "prismals",
          "pyright",
        },
        automatic_installation = true,
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          "isort", -- python formatter
          "black", -- python formatter
          "pylint", -- python linter
          "eslint_d", -- js linter
        },
      })
    end,
  }
})

require("andromeda").setup({
  preset = "andromeda",
  transparent_bg = true
})

vim.cmd[[set background=dark]]
vim.cmd[[set t_Co=256]]

require("lualine").setup()
require("gitsigns").setup()
require("mason").setup()

