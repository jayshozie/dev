-- Copyright (C)  2026  Emir Baha Yıldırım <jayshozie@gmail.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

return {
  "ManuLinares/nvim-c3",
  ft = {
    "c3",
    "c3i",
    "c3t",
    "c3l",
  },
  build = function()
    require("c3").update()
  end,
  config = true,
  opts = {
    lsp = {
      enable = true,
      cmd = "c3_ls",
      version = "latest",
      compiler_path = nil, -- Custom path to c3c binary
      stdlib_path = nil, -- Custom path to C3 standard library
      format_on_save = false, -- Format buffer on save using LSP
      log_level = nil, -- "error" | "warn" | "info" | "debug" (default: "error")
      log_path = nil, -- Custom path to log file
    },
    highlighting = {
      enable_treesitter = true,
    },
  },
}
