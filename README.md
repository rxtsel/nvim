# My neovim setup

Requires Neovim (>= v0.8.3)

requiriments:

```bash
# Npm packages
npm i -g tree-sitter-cli typescript tree-sitter fd fd-find

# System packages
ripgrep xsel unzip curl gcc zip unzip gzip g++
```

## Basic commands

##### Basics:

- i : enter insert mode
- Esc : exit any mode and enter normal mode
- v : enter visual mode
- ctrl { : go to normal mode
- : : enter command mode
- o : insert a line below
- O : insert a line above
- zz : focus on the center current line
- :3 : go to line 3

##### Move:

- h : move cursor left
- j : move cursor bottom
- k : move cursor top
- l : move cursor right
- 0 : go to the beginning of the line
- $ : go to the end of the line
- % : search for the character or label pair
- ctrl e : scroll down
- ctrl y : scroll up
- gg: go to the beginning of the whole document
- G : go to the end of the document
- ctrl u : scroll up several lines
- ctrl d : scroll down several lines

##### Convergency:

- veU : change lower case to UPPER CASE
- veu : change UPPER CASE to lower case

##### Operators:

- 4j: go 4 lines down
- 6k: go 4 lines up

##### Text selection:

- viw : select the current word
- vec : change the current word
- yiw : copy the current word
- diw : delete the current word
- vi' : select all within '....'
- ci' : change all within '....'
- va' : select all within '...' including ''
- ca' : change all within '...' including ''

##### Copy and paste:

- yy : copy all the current line
- vy : copy current letter
- p: paste
- P: paste on a top line

##### Search and replace:

- / : search the entire document
- fh : find the first occurrence of the letter h after the cursor
- Fh : find the first occurrence of the letter h before the cursor
- n : next ocurrence
- N : previous ocurrence
- \# : search current word
- \* : search current word
- :%s/aaa/bbb/g : search for aaa in the whole document and replace it with bbb
