local OLLAMA = "http://10.10.10.157:11434"
local FIM_FAST = "qwen2.5-coder:3b"
local KEEP_ALIVE = "30m"
local WARM_INTERVAL_MS = 4 * 60 * 1000

local function warm(model)
  vim.system({
    "curl", "-s", "-m", "20", "-o", "/dev/null",
    OLLAMA .. "/api/generate",
    "-d", vim.json.encode({
      model = model,
      prompt = "",
      raw = true,
      stream = false,
      keep_alive = KEEP_ALIVE,
      options = { num_predict = 1 },
    }),
  }, { text = true })
end

return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "InsertEnter",
    config = function()
      require("minuet").setup({
        provider = "openai_fim_compatible",
        n_completions = 1,
        context_window = 2048,
        context_ratio = 0.75,
        request_timeout = 3,
        throttle = 600,
        debounce = 250,
        notify = "error",

        provider_options = {
          openai_fim_compatible = {
            name = "Ollama",
            end_point = OLLAMA .. "/v1/completions",
            model = FIM_FAST,
            api_key = function()
              return "ollama"
            end,
            stream = true,
            optional = {
              max_tokens = 96,
              temperature = 0.2,
              top_p = 0.9,
              stop = { "\n\n", "```", "<|fim_prefix|>", "<|fim_suffix|>", "<|endoftext|>" },
            },
          },
        },

        virtualtext = {
          auto_trigger_ft = { "*" },
          auto_trigger_ignore_ft = { "markdown", "text", "gitcommit", "TelescopePrompt", "dashboard" },
          show_on_completion_menu = false,
          keymap = {
            accept = "<A-y>",
            accept_line = "<A-l>",
            next = "<A-]>",
            prev = "<A-[>",
            dismiss = "<A-e>",
          },
        },
      })

      local ignore = require("minuet").config.virtualtext.auto_trigger_ignore_ft
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          local ft = vim.bo[buf].filetype
          if ft ~= "" and not vim.tbl_contains(ignore, ft) then
            vim.b[buf].minuet_virtual_text_auto_trigger = true
          end
        end
      end

      warm(FIM_FAST)
      local timer = vim.uv.new_timer()
      if timer then
        timer:start(WARM_INTERVAL_MS, WARM_INTERVAL_MS, vim.schedule_wrap(function()
          warm(FIM_FAST)
        end))
      end

    end,
  },
}
