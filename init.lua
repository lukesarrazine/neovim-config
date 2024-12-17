-- Autocommand to reload Neovim and sync plugins when saving init.lua
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost init.lua source <afile> | PackerSync
    augroup end
]])

-- Plugin management
require('plugins.packer')

-- Plugin configurations
require('configs.treesitter')
