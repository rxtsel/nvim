# Neovim Keymap Cheatsheet

## Notation

- `<leader>` and `<localleader>` are **Space**. For example, `<leader>yf` means Space, then `y`, then `f`.
- **N**: Normal mode. **I**: Insert mode. **V**: Visual mode.
- `<C-x>` means Ctrl + x; `<M-x>` means Alt + x; `<S-Tab>` means Shift + Tab.
- `<M-L>` means Alt + Shift + l. On macOS, configure the terminal to send Option as Alt.
- Key sequences are case-sensitive: `gD`, `gI`, and `<leader>gB` use uppercase letters.

This sheet covers configured shortcuts and the Blink Enter preset. Plugins may provide additional buffer-local mappings.

## Editing and Search

| Key | Mode | Action |
| --- | --- | --- |
| `x` | N, V | Delete characters without overwriting yank registers. |
| `<leader>d` | N, V | Delete into the black-hole register; supply a motion in Normal mode. |
| `<leader>c` | N, V | Change into the black-hole register; supply a motion in Normal mode. |
| `<leader>p` | N, V | Paste the last yank from register `0`. |
| `dw` | N | Delete backwards to a word boundary without copying. |
| `<Esc>` | N | Clear search highlighting. |
| `<` | V | Indent left and reselect. |
| `>` | V | Indent right and reselect. |
| `+` | N | Increment the number at or after the cursor. |
| `-` | N | Decrement the number at or after the cursor. |
| `<C-a>` | N | Select the entire buffer linewise. |
| `<leader>o` | N | Open a line below without continuing a comment. |
| `<leader>O` | N | Open a line above without continuing a comment. |
| `<C-s>` | N, I, V | Save the buffer. |
| `<leader>q` | N | Close the current window with `:quit`; unsaved changes are protected. |
| `<leader>bd` | N | Close unmodified, hidden, listed buffers; keep visible and modified buffers. |

Yanks and normal pastes use the system clipboard. `-` is part of a word, so names such as `foo-bar` are treated as one word.

## Windows, Tabs, and Jumps

| Key | Mode | Action |
| --- | --- | --- |
| `ss` | N | Split below. |
| `sv` | N | Split to the right. |
| `sh` | N | Move to the left window. |
| `sj` | N | Move to the lower window. |
| `sk` | N | Move to the upper window. |
| `sl` | N | Move to the right window. |
| `te` | N | Open a new tab. |
| `<Tab>` | N | Next tab. |
| `<S-Tab>` | N | Previous tab. |
| `<C-m>` | N | Jump forward in the jump list. |

`<C-m>` is also Enter in many terminals. `<C-i>` normally jumps forward, but terminals commonly send it as Tab, which this setup uses for tab switching.

## Pickers

| Key | Mode | Action |
| --- | --- | --- |
| `;f` | N | Find files, including hidden files. |
| `;r` | N | Live grep, including hidden files. |
| `;;` | N | Resume the last picker. |
| `\\` | N | List open buffers; reuse a window already showing the selected buffer. |
| `;e` | N | List diagnostics. |
| `;n` | N | Browse notification history. |
| `;h` | N | List Git hunks. |

The buffer shortcut is **two backslashes**. Hidden files are included in file search and grep, but ignore rules still apply.

## File Explorer

| Key | Context | Action |
| --- | --- | --- |
| `<leader>e` | Normal mode | Open Oil in a centered float with live preview. |
| `h` | Oil buffer | Open the parent directory. |
| `q` | Oil buffer | Close Oil. |
| `:w` | Oil buffer | Apply filesystem edits, including renames, moves, and deletions. |

Oil shows hidden files, icons, permissions, sizes, and modification times. Its float is at most 200 columns wide. The old `sf` shortcut is not mapped.

## Language Servers and Diagnostics

| Key | Mode | Action |
| --- | --- | --- |
| `gd` | N | Find definitions through the picker. |
| `gD` | N | Find declarations through the picker. |
| `gy` | N | Find type definitions through the picker. |
| `gr` | N | Find references through the picker. |
| `gI` | N | With vtsls, jump to the source definition instead of a declaration file; otherwise, pick an implementation. |
| `;c` | N | List incoming calls. |
| `K` | N | Show hover documentation. |
| `gK` | N | Show signature help. |
| `<C-k>` | I | Show native LSP signature help. |
| `<C-j>` | N | Jump to the next diagnostic and show its float. |
| `]]` | N | Jump to the next highlighted reference. |
| `[[` | N | Jump to the previous highlighted reference. |
| `<leader>ca` | N, V | Show code actions. |
| `<leader>cr` | N | Rename the symbol. |
| `<leader>cR` | N | Rename the file with supported LSP import updates. |
| `<leader>cl` | N | Open LSP information with `:checkhealth vim.lsp`. |

These actions depend on the attached server's capabilities. Reference jumps accept a count, such as `3]]`.

## Completion and Formatting

Blink uses the **Enter** preset in Insert mode:

| Key | Action |
| --- | --- |
| `<CR>` | Accept the selected completion, or fall back to normal Enter behavior. |
| `<C-Space>` | Show completion or show/hide its documentation. |
| `<C-e>` | Cancel completion. |
| `<C-n>` / `<Down>` | Select the next completion. |
| `<C-p>` / `<Up>` | Select the previous completion. |
| `<Tab>` / `<S-Tab>` | Jump forward/backward through snippet placeholders. |
| `<C-b>` / `<C-f>` | Scroll completion documentation up/down. |

`<C-k>` is reserved for native signature help, not Blink's signature handler. In the command line, the completion menu opens automatically for `:` commands only, with no preselected item. Pairs are enabled in Insert and command-line modes.

| Key or command | Context | Action |
| --- | --- | --- |
| `<leader>f` | Normal mode | Format now with Conform, falling back to the LSP. |
| `:ToggleFormatter` | Current buffer | Toggle format-on-save and notify the new state. |
| `:ConformInfo` | Command line | Inspect available formatters and formatting status. |

Format-on-save uses a 1000 ms timeout. Toggling it off does not disable manual formatting. Web files prefer oxfmt only when an oxfmt or Vite+ configuration is found, then fall back to prettierd or prettier.

## Git

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>gb` | N | Show blame for the current line. |
| `<leader>gB` | N | Show blame for the buffer. |
| `<leader>go` | N | Open the file at the commit that last changed the current line, in a new tab. |
| `<leader>gs` | N | Stage the buffer; if no unstaged hunks remain, unstage the buffer instead. |
| `<leader>gh` | N | Stage or unstage the hunk under the cursor. |
| `<leader>gd` | N | Toggle the mini.diff overlay. |
| `]c` | N | Jump to the next diff hunk. |
| `[c` | N | Jump to the previous diff hunk. |
| `<leader>dv` | N | Toggle the CodeDiff view. |
| `<leader>dh` | N | Show the current file's history in CodeDiff. |
| `<leader>dH` | N | Show repository history in CodeDiff. |
| `;g` | N | Open Lazygit in a float and remember the launch window. |

CodeDiff uses a 50-column tree explorer and compact side-by-side diffs with eight context lines. Hunk navigation with `]c` and `[c` accepts a count.

| Command | Action |
| --- | --- |
| `:GitLink` | Copy a permalink for the current line. |
| `:'<,'>GitLink` | Copy a permalink for the selected line range. |

Use the full `:GitLink` name: `:Git` is ambiguous with `:Gitsigns`.

### Inside Lazygit

| Key | Context | Action |
| --- | --- | --- |
| `e` | Selected file | Quit Lazygit and open the file in the Neovim window it was launched from. |
| `C` | Files panel | Run `git cz` interactively. |

These two actions require the external configuration in `~/.config/lazygit/config.yml`. In this setup, Home Manager manages that file. Outside Neovim, editing runs `nvim <file>` instead of connecting to a Neovim server.

## Copilot

All shortcuts below work in **Insert mode**:

| Key | Action |
| --- | --- |
| `<C-l>` | Accept the suggestion. |
| `<M-l>` | Accept one word. |
| `<M-L>` | Accept one line. |
| `<M-]>` | Next suggestion. |
| `<M-[>` | Previous suggestion. |
| `<C-]>` | Dismiss the suggestion. |

Run `:Copilot auth` once to authenticate. Auto-trigger is enabled, including in Markdown and help buffers. Blink's ghost text is disabled to avoid competing inline suggestions.

## Agent Context Helpers

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>yf` | N | Copy the file path relative to cwd with `#L<line>`, and notify the copied text. |
| `<leader>yp` | N | Copy the absolute file path with `#L<line>`, and notify the copied text. |
| `<leader>cc` | V | Copy the selection as a Markdown code block and show a notification. |
| `<leader>j` | N | Open the nearest project `package.json` in a centered float, 80% wide and tall. |
| `q` / `<Esc>` | package.json float | Close the float. |

Path example: `lua/rxtsel/config/options.lua#L12`.

The selection helper uses short language names (`tsx`, `jsx`, `ts`, `js`) and includes the relative filename and first selected line:

````markdown
```tsx filename="src/components/Button.tsx" line=12
const Button = () => <button>Save</button>;
```
````

## Source Files

- [Core keymaps](../lua/rxtsel/config/keymaps.lua)
- [Plugin keymaps](../lua/rxtsel/plugins/keymaps.lua)
- [Completion configuration](../lua/rxtsel/plugins/completion.lua)
- [Editor helpers](../lua/rxtsel/utils/editor.lua)
- [Custom commands](../lua/rxtsel/config/commands.lua)
