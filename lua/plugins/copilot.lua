return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>",
          next = "<C-]>",
          prev = "<C-[>",
          dismiss = "<Esc>"
        }
      }
    })
  end,
}
