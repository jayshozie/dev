return {
  "vyfor/cord.nvim",
  ---@type CordConfig
  opts = {
    editor = {
      client = "neovim",
      tooltip = "The Superior Text Editor",
    },
    display = {
      theme = "catppuccin",
      flavor = "dark",
    },
    idle = {
      enabled = true,
      timeout = 30000,
    },
    text = {
      editing = function(opts)
        return string.format(
          "Editing %s (%d:%d)",
          opts.filename,
          opts.cursor_line,
          opts.cursor_char
        )
      end,
    },
  },
}
