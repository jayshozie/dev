return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate'
}
-- return {
--     -- PLUGIN 1: Treesitter (The Engine)
--     {
--         "nvim-treesitter/nvim-treesitter",
--         build = ":TSUpdate",
--         lazy = false, -- CHANGE THIS: Force load immediately to fix the path issue
--         -- event = { "BufReadPre", "BufNewFile" }, -- Comment this out for now
--         opts = {
--             ensure_installed = {
--                 "c", "lua", "vim", "vimdoc", "query", "cpp", "cmake", "make",
--                 "python", "markdown", "latex", "asm", "bash",
--             },
--             sync_install = false,
--             auto_install = true,
--             highlight = {
--                 enable = true,
--                 additional_vim_regex_highlighting = false,
--             },
--         },
--         config = function(_, opts)
--             require("nvim-treesitter.configs").setup(opts)
-- 
--             vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--                 pattern = { "*.service" },
--                 callback = function()
--                     vim.cmd("set filetype=ini")
--                 end,
--             })
--         end,
--     },
-- 
--     -- PLUGIN 2: Context
--     {
--         "nvim-treesitter/nvim-treesitter-context",
--         dependencies = { "nvim-treesitter/nvim-treesitter" },
--         lazy = false, -- Force load this too
--         config = true,
--     },
-- }
