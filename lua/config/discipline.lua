local M = {}

function M.cowboy()
  ---@type table?
  local id
  local ok = true
  local keys = { "h", "j", "k", "l", "+", "-" }
  local arrow_keys = { "<left>", "<down>", "<up>", "<right>" }

  for _, key in ipairs(arrow_keys) do
    table.insert(keys, key)
  end

  for _, key in ipairs(keys) do
    local count = 0
    local timer = assert(vim.loop.new_timer())
    local map = key

    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then
        count = 0
      end

      if key == "<left>" or key == "<down>" or key == "<up>" or key == "<right>" then
        ok, id = pcall(vim.notify, "Use hjkl to move", vim.log.levels.WARN, {
          icon = "🦜",
          replace = id,
        })
        if not ok then
          id = nil
        end

        return ""
      end

      if count >= 10 then
        ok, id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
          icon = "🤠",
          replace = id,
          keep = function()
            return count >= 10
          end,
        })
        if not ok then
          id = nil
          return map
        end
      else
        count = count + 1
        timer:start(2000, 0, function()
          count = 0
        end)
        return map
      end
    end, { expr = true, silent = true })
  end
end

return M
