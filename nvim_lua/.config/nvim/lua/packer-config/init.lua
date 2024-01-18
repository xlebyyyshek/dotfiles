return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

--    use 'morhetz/gruvbox'
    use { "ellisonleao/gruvbox.nvim" }

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'nvim-treesitter/nvim-treesitter'

    use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
end)
