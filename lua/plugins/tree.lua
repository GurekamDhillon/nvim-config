local M = {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",  -- Optional, for file icons
    },
    config = function()
        require("nvim-tree").setup({
            -- Your configuration here
            view = {
                width = 30,
                side = 'left',
            },
            filters = {
                dotfiles = false,
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
        })
        vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
}

return M
