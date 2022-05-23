local gitsigns = require 'gitsigns'

gitsigns.setup{
    signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '▎' },
        topdelete = { text = '契' },
        changedelete = { text = '▎' },
    },
}

vim.keymap.set('n', '<leader>gj', function()
    gitsigns.next_hunk()
end, { desc = 'Next git hunk' })

vim.keymap.set('n', '<leader>gk', function()
    gitsigns.prev_hunk()
end, { desc = 'Previous git hunk' })
