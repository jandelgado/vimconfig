# Vim cheat sheet
My personal Vim cheat sheet.

General notes:
  * `M` - Meta-Key = Ctrl
  * \<leader\> - Leader key, re-mapped to `,` in my .vimrc
Commands/mappings marked with `custom` are specific to my .vimrc file.

## Cursor movement
| Command         | Description              |
| ------------------------------------------- |
| `M`-E, `M`-Y        |move screen up/down one line|
| zz, zb, zt      |move line with cursor to middle/bottom/top of screen|


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

## Search and replace
tbd http://vimregex.com/

## Command history
| Command         | Description             |
| ----------------------------------------- |
| q:              |open command history window (editable)  |
| :history        |view command history     |

## Misc
| Command         | Description             |
| ----------------------------------------- |
| g~iw            |change case of word under cursor |

## Help
| Command         | Description             |
| ----------------------------------------- |
| :help             |open help              |
| `M`-] or `mouse-left-doubleclick` |jump to topic under cursor. `M`-T or `M`-O, g`mouse-right` to go back. `set mouse=a` must be set for mouse support. |

# Plugins
## vi`M`-go
| Command         | Description             |
| ----------------------------------------- |
| :GoInstallBinaries | install additional tools |
| :GoDef, `M`-]     | Jump to definition, `M`-O or `M`-T to go back.|
| :GoRun          |                         |
| :GoBuild        |                         |
| :GoTest         |                         |
| :GoLint, :GoVet, :GoMetaLinter |                         |
|  `M`-N, `M`-M      | `custom` next, previous element in quicklist |
| \<leader\>a            | `custom` close quicklist |
| :GoDecls, :GoDeclsDir | Show function declarations using Ctlr-P plugin |
| ]], [[          | Jump to next,previous function declaration |
| :GoDoc, K       | Open go doc for element under cursor |
| :GoInfo         | Show function signature for element under cursor|
| :GoRename name  | Rename element under cursor |
