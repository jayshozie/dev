return {
  dir = "~/src/upstream/scratch.nvim",
  name = "scratch.nvim",
  lazy = true,
  keys = {
    { "<M-.>", "<cmd>ScratchToggle<cr>", desc = "Toggle Scratch Buffer" },
    { "<M-,>", "<cmd>ScratchIssues<cr>", desc = "Toggle Scratch Issues" },
    { "<M-o>", "<cmd>ScratchTask<cr>", desc = "New Scratch Task" },
  },
  cmd = {
    "ScratchToggle",
  },
  opts = {
    title = "Scratch",
    border = "rounded",
    width = 0.8,
    height = 0.8,
    local_notes = false,
    global_notes = true,
    close_on_leave = false, -- close the window when the focus leaves it
    win_opts = {
      wrap = true,
      linebreak = true,
      number = true,
      relativenumber = true,
    },
  },
}
