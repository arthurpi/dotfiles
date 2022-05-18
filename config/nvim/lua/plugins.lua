local packer = require('packer')
return packer.startup(function()
    local use = packer.use

    use 'wbthomason/packer.nvim'

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
    }
end)
