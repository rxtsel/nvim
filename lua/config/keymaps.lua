local wk = require("which-key")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Increment/decrement
keymap.set("n", "+", "<C-A>")
keymap.set("n", "-", "<C-X>")

-- Delete a word backwardsk
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", "<cmd>tabedit<Return>", opts)
keymap.set("n", "<tab>", "<cmd>tabnext<Return>", opts)
keymap.set("n", "<s-tab>", "<cmd>tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", "<cmd>split<Return>", opts)
keymap.set("n", "sv", "<cmd>vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Comma to end
keymap.set("n", "<leader>;;", "$a;<Esc>", { desc = "Insert ; to end line" })
keymap.set("n", "<leader>,,", "$a,<Esc>", { desc = "Insert , to end line" })

-- Fzf
keymap.set("n", ";f", require("fzf-lua").files, { desc = "Fzf files" })
keymap.set("n", ";r", require("fzf-lua").live_grep, { desc = "Fzf Grep" })
keymap.set("n", ";m", require("fzf-lua").marks, { desc = "Fzf marks" })
keymap.set(
  "n",
  ";s",
  ":lua require'fzf-lua'.spell_suggest({ winopts = { relative='cursor', row=1.01, col=0, height=0.2, width=0.2 } })<cr>",
  { desc = "Fzf Spelling Sugestion" }
)

-- Silicon
wk.add({
  mode = { "v" },
  { "<leader>s", group = "Silicon" },
  {
    "<leader>sc",
    function()
      require("nvim-silicon").clip()
    end,
    desc = "Copy code screenshot to clipboard",
  },
  {
    "<leader>sf",
    function()
      require("nvim-silicon").file()
    end,
    desc = "Save code screenshot as file",
  },
  {
    "<leader>ss",
    function()
      require("nvim-silicon").shoot()
    end,
    desc = "Create code screenshot",
  },
})

-- Beauty comments
wk.add({
  mode = { "n", "v" },
  {
    "gcbl",
    "<Cmd>CBllbox<CR>",
    desc = "Beauty box comment. Text align left",
  },
  {
    "gcbc",
    "<Cmd>CBccbox<CR>",
    desc = "Beauty box comment. Text align center",
  },
  {
    "gcll",
    "<Cmd>CBllline<CR>",
    desc = "Beauty line comment. Text align left",
  },
  {
    "gclc",
    "<Cmd>CBccline<CR>",
    desc = "Beauty line comment. Text align center",
  },
  {
    "gcd",
    "<Cmd>CBd<CR>",
    desc = "Delete beauty comment",
  },
})

-- Avante
wk.add({
  mode = { "n", "v" },
  { "<leader>a", group = "+ai", icon = { icon = "ﮧ", hl = "false" } },
  { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "ask", icon = { icon = "", hl = "false" } },
  { "<leader>ar", "<cmd>AvanteRefresh<cr>", desc = "refresh", icon = { icon = "", hl = "false" } },
})
