return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                'asm',
                'c',
                'cmake',
                'cpp',
                'gitcommit',
                'hyprlang',
                'latex',
                'lua',
                'make',
                'markdown',
                'python',
                'query',
                'vim',
                'vimdoc',
                'markdown_inline',
                -- 'x86asm',
            },
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
