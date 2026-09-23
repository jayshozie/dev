-- Copyright (C)  2026  Emir Baha YILDIRIM
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
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",

  dependencies = { "rafamadriz/friendly-snippets" },

  config = function()
    local ls = require("luasnip")

    ls.setup({ enable_autosnippets = true })

    local function prepend_include()
      local header = "#include <stdio.h>"
      local lines = vim.api.nvim_buf_get_lines(0, 0, 50, false)

      for _, line in ipairs(lines) do
        if line:match(header) then
          return ""
        end
      end

      vim.api.nvim_buf_set_lines(0, 0, 0, false, { header, "" })
      return ""
    end

    -----------------
    -- Snippets --
    -----------------
    local debug_c_cpp = {
      ls.snippet({
        trig = ":dberr",
        regTrig = true,
        wordTrig = false,
        hidden = true,
        snippetType = "autosnippet",
      }, {
        ls.function_node(prepend_include, {}),
        ls.text_node('fprintf(stderr, "[DEBUG] '),
        ls.insert_node(1, ""),
        ls.text_node('\\n"'),

        ls.insert_node(2),
        ls.text_node(");"),
      }),
    }

    local emdash = {
      ls.snippet({
        trig = ":emdash",
        regTrig = true,
        wordTrig = false,
        hidden = true,
        snippetType = "autosnippet",
      }, {
        ls.text_node("—"),
      }),
    }

    local endash = {
      ls.snippet({
        trig = ":endash",
        regTrig = true,
        wordTrig = false,
        hidden = true,
        snippetType = "autosnippet",
      }, {
        ls.text_node("–"),
      }),
    }

    local today = {
      ls.snippet({
        trig = ":today",
        regTrig = true,
        wordTrig = false,
        hidden = true,
        snippetType = "autosnippet",
      }, {
        ls.text_node(os.date("%Y-%m-%d")),
      }),
    }

    local gpl3 = {
      ls.snippet({
        trig = ":gpl3",
        regTrig = true,
        wordTrig = false,
        hidden = true,
        snippetType = "autosnippet",
      }, {
        ls.text_node({
          "Copyright (C)  "
            .. os.date("%Y")
            .. "  Emir Baha Yıldırım <jayshozie@gmail.com>",
          "",
          "This program is free software: you can redistribute it and/or modify",
          "it under the terms of the GNU General Public License as published by",
          "the Free Software Foundation, either version 3 of the License, or",
          "(at your option) any later version.",
          "",
          "This program is distributed in the hope that it will be useful,",
          "but WITHOUT ANY WARRANTY; without even the implied warranty of",
          "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the",
          "GNU General Public License for more details.",
          "",
          "You should have received a copy of the GNU General Public License",
          "along with this program.  If not, see <https://www.gnu.org/licenses/>.",
        }),
      }),
    }

    local mit = {
      ls.snippet({
        trig = ":mit",
        regTrig = true,
        wordTrig = false,
        hidden = true,
        snippetType = "autosnippet",
      }, {
        ls.text_node({
          "Created",
          "Author: Emir Baha Yıldırım <jayshozie@gmail.com>",
          "Date: " .. os.date("%B %d, %Y"),
          "License: MIT",
        }),
      }),
    }

    local sl = {
      ls.snippet({
        trig = ":sl",
        regTrig = true,
        wordTrig = false,
        hidden = true,
        snippetType = "autosnippet",
      }, {
        ls.text_node({
          "Copyright (C)  "
            .. os.date("%Y")
            .. "  Emir Baha Yıldırım <jayshozie@gmail.com>",
        }),
      }),
    }

    local blog_more = {
      ls.snippet({
        trig = ":more",
        regTrig = true,
        wordTrig = false,
        hidden = true,
        snippetType = "autosnippet",
      }, {
        ls.text_node({ "<!-- more -->" }),
      }),
    }

    local turkey = {
      ls.snippet({
        trig = ":turkey",
        regTrig = true,
        wordTrig = false,
        hidden = true,
        snippetType = "autosnippet",
      }, {
        ls.text_node({ "Türkiye" }),
      }),
    }

    ls.add_snippets("c", debug_c_cpp)
    ls.add_snippets("cpp", debug_c_cpp)
    ls.add_snippets("markdown", emdash)
    ls.add_snippets("markdown", endash)
    ls.add_snippets("all", today)
    ls.add_snippets("all", gpl3)
    ls.add_snippets("all", mit)
    ls.add_snippets("all", sl)
    ls.add_snippets("markdown", blog_more)
    ls.add_snippets("markdown", turkey)

    -------------
    -- Keymaps --
    -------------
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })
  end,
}
