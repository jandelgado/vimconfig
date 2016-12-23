# Vim cheat sheet
My personal Vim cheat sheet.

General notes:
  * `M` - Meta-Key = Ctrl
  * `leader` - Leader key, re-mapped to `,` in my .vimrc.
  * Commands/mappings marked with `custom` are specific to my .vimrc file.
  * `%` in a command is a substituted with the current filename

## Cursor movement

| Command         | Description              |
| ------------------------------------------- |
| `M`-E, `M`-Y        | move screen up/down one line|
| zz, zb, zt      | move line with cursor to middle/bottom/top of screen|

## Buffers
A buffer is a file loaded to memory for editing.

| Command         | Description              |
| ------------------------------------------- |
| :e `filename`   |open new file for editing in a new buffer|
| :new, :vnew     | create new buffer, splitting pane horizontally or vertically|
| :ls, :buffers   |list buffers              |
| :b`num`         |switch to buffer `num`    |
| :bdelete `num`  |delete buffer `num`|
| `M`-6             |switch buffers in active pane|
| `num``M`-W             |switch buffers in active pane|
| :ball           |open all buffers           |


## Undo and redo
| Command         | Description              |
| -------------------------------------------|
| u               | undo                     |
| `M`-R             | redo                     |

## Panes and windows
| Command         | Description             |
| ------------------------------------------- |
| :sp             |horizontally split window |
| :vsp            |vertically split window   |
| `M`-W W, `M`-W `M`-W  |Jump to next pane
| `M`-W\_, `M`-&#124;, `M`-W=|Maximize current pane (\_ vertically, &#124; horizontally), or restore pane (=)|             

## Location- and quickfix list
The location list ist local to a window while the quickfix list is global (i.e. there can be only 1 quick fix list).

| Command         | Description             |
| ------------------------------------------- |
| :copen [height], :ccl |open quick fix window/close    |
| :lopen [height], :lcl |open location list for current window/close|
|  `M`-N, `M`-M      | `custom` next, previous element in quicklist |
| `leader`-a            | `custom` close quicklist |

## Registers
tbd

### Macros
Describes recorded sequences of commands to a register.

| Command         | Description             |
| ----------------------------------------- |
| q`register``commands`q |Record sequence of `commands` to given `register`.|
| @`register`           |exectue macro stored in register|

## Selecting text
| Command         | Description             |
| ----------------------------------------- |
| V or v          |Enter visual mode        |
| `M`-V             |Enter visual mode (Columns)|
| vip             | select current paragraph |

### While in visual mode
| Command         | Description             |
| ----------------------------------------- |
| o               |jump to other end of selection        |
| <, >            | shift left, shift right
| c, y, d, ~         | change, yank, delete, upper case |
| gq              | format lines to 'textwidth' length |
| !`shell-cmd`          |filter selection through `shell-command`, e.g. !sort or !fold -w 20 -s|
| :normal `register` | execute macro in register `register` on selection |

## Search

### Search and replace text
tbd http://vimregex.com/

### Search in files
| Command         | Description             |
| ----------------------------------------- |
| :vimgrep pattern files |built in grep. Results go to quickfix list. |

## Command history
| Command         | Description             |
| ----------------------------------------- |
| q:              |open command history window (editable)  |
| :history        |view command history     |

## ctags
| Command         | Description             |
| ----------------------------------------- |
| `M`+]            |Jump to definition       |
| `M`+T          | Jump back from definition |
| g]             |show all definitions       |
| `M`-] or `mouse-left-doubleclick` |jump to topic under cursor. `M`-T or `M`-O, g`mouse-right` to go back. `set mouse=a` must be set for mouse support. |

## diff
| Command         | Description             |
| ----------------------------------------- |
| :windo diffthis |diff open buffers (hsplit,vsplit) |
| :windo diffoff  |end diff mode            |
| \]c,  \[c         |navigate in changes      |


## Help
| Command         | Description             |
| ----------------------------------------- |
| :help             |open help              |
| `M`-] or `mouse-left-doubleclick` |jump to topic under cursor. `M`-T or `M`-O, g`mouse-right` to go back. `set mouse=a` must be set for mouse support. |


## Misc
| Command         | Description             |
| ----------------------------------------- |
| g~iw            |change case of word under cursor |


# Plugins
## CtrlP
| Command                | Description             |
| ------------------------------------------------ |
| :CtrlPTags, `leader`+. | `custom` open tag list  |
| `leader`+f             | cycle through modes  |
| `leader`+d             | switch to filename only search mode|
| ..                     | cd .. |

## Nerd Commenter
  * https://github.com/scrooloose/nerdcommenter
| Command                | Description             |
| ------------------------------------------------ |
| `leader`+cc  | comment out block  |
| `leader`+cn  | comment out block, force nesting  |
| `leader`+ci  | toggle comments  |


## vim-go
| Command         | Description             |
| ----------------------------------------- |
| :GoInstallBinaries | install additional tools |
| :GoDef, `M`-]     | Jump to definition, `M`-O or `M`-T to go back.|
| :GoRun          |                         |
| :GoBuild        |                         |
| :GoTest         |                         |
| :GoLint, :GoVet, :GoMetaLinter |                         |
| :GoDecls, :GoDeclsDir | Show function declarations using Ctlr-P plugin |
| ]], [[          | Jump to next,previous function declaration |
| :GoDoc, K       | Open go doc for element under cursor |
| :GoInfo         | Show function signature for element under cursor|
| :GoRename name  | Rename element under cursor |


