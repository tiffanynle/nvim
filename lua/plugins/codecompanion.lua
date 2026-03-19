return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    adapters = {
      http = {
        -- local llama.cpp instance
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
              url = "http://localhost:8080",
              chat_url = "/v1/chat/completions",
              api_key = "LLAMA_API_KEY",
            },
            handlers = {
              parse_message_meta = function(self, data)
                local extra = data.extra
                if extra and extra.reasoning_content then
                  data.output.reasoning = { content = extra.reasoning_content }
                  if data.output.content == "" then
                    data.output.content = nil
                  end
                end
                return data
              end,
            },
          })
        end,
        -- ollama cloud instance
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            env = {
              url = "https://ollama.com",
              api_key = "OLLAMA_API_KEY",
            },
            headers = {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer ${api_key}",
            },
            parameters = {
              sync = true,
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
