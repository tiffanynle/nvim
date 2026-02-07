return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    adapters = {
      http = {
        ["llama.cpp"] = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            name = "llama.cpp",
            formatted_name = "llama.cpp",
            schema = {
              model = {
                default = "gpt-oss-20b-mxfp4",
              },
            },
            env = {
              url = "http://localhost:8081",
              chat_url = "/v1/chat/completions",
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        adapter = "llama.cpp",
      },
      -- NOTE: The log_level is in `opts.opts`
      opts = {
        log_level = "DEBUG",
      },
    },
  },
}
