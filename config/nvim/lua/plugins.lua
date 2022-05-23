local packer = require 'packer'

return packer.startup(function()
    local use = packer.use

    use 'wbthomason/packer.nvim'

    use {
        'feline-nvim/feline.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        config = require 'configs.feline',
    }

    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v2.x",
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        config = require 'configs.neo-tree',
    }

    use {
        'akinsho/toggleterm.nvim',
        tag = 'v1.*',
        config = require 'configs.toggleterm',
    }

    use 'ggandor/lightspeed.nvim'
end)
