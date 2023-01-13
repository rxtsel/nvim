# Commands basics for Neovim

### Basics:

- i : enter mode insert
- Esc : exit all modes and enter mode normal
- v : enter visual mode
- ctrl { : go to normal mode
- : : enter a command mode
- o : insert a new line in bottom
- O : insert a new line in top
- zz : focus in center current line
- :3 : go to line 3

### Move:

- h : move cursor to left
- j : move cursor to bottom
- k : move cursor to top
- l : move cursor to right
- 0 : go to init line
- $ : go to finish line
- % : search pared bracket
- ctrl e : scroll to bottom
- ctrl y : scroll to top
- gg: go to init document
- G : go to finish document
- ctrl u : move cursor all lines to to
- ctrl d : move cursor all lines to bottom

### Convergency:

- veU : change lowercase word to UPPERCASE
- veu : change UPPERCASE word to lowercase

### Operators:

- 4j: go to 4 lines to bottom
- 6k: go to 6lines to top

### Text selection:

- viw : Select a word
- vec : change word
- yiw : copy letter
- diw : delete word
- vi' : select all beetwen in '....'
- ci' : change all beetwen in '....'
- va' : select all '....'
- ca' : change all '....'

### Copy and paste:

- yy : copy all current line
- vy : copy selection
- p: paste
- P: paste in a new line to top

### Search and replace:

- / : search in all document
- fh : search first ocurrence for h in the next cursor
- Fh : search first ocurrence for h in the back cursor
- \# : search current word
- \* : search current word
- n : next ocurrence
- N : back ocurrence
- :%s/aaa/bbb/g : search aaa in all document and replace for bbb
