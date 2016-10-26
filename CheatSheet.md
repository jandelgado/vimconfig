# Vim cheat sheet
My personal Vim cheat sheet

## Cursor movement
| Command         | Description              |
| ------------------------------------------- |
| M-E, M-Y        |move screen up/down one line|
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
| M-6             |switch buffers in active pane|
| `num`M-W             |switch buffers in active pane|
| :ball           |open all buffers           |


## Undo and redo
| Command         | Description              |
| -------------------------------------------|
| u               | undo                     |
| M-R             | redo                     |

## Panes and windows
| Command         | Description             |
| ------------------------------------------- |
| :sp             |horizontally split window |
| :vsp            |vertically split window   |
| M-W W, M-W M-W  |Jump to next pane

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
| M-V             |Enter visual mode (Columns)|
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
| M-] or `mouse-left-doubleclick` |jump to topic under cursor. M-T or M-O, g`mouse-right` to go back. `set mouse=a` must be set for mouse support. |

