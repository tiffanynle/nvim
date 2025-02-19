-- lua/plugins/luasnip.lua
return {
  "L3MON4D3/LuaSnip",
  opts = function()
    local ls = require("luasnip")
    ls.add_snippets("python", {
      ls.parser.parse_snippet(
        "main",
        [[
def main():
    $1
if __name__ == "__main__":
    main()
          ]]
      ),
      ls.parser.parse_snippet(
        "fun",
        [[
def fun($1) -> $2:
    $3
          ]]
      ),
    })
  end,
}
