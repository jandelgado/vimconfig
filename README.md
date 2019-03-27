# my vim configuration

This is my personal vim configuration, with plugins managed by the vim-plug
plugin manager.

See

* [Cheat-Sheet](CheatSheet.md)
* https://github.com/junegunn/vim-plug

for details.

## Plugins

* Plug 'fatih/vim-go',
* Plug 'janko/vim-test',
* Plug 'scrooloose/nerdcommenter',
* Plug 'w0rp/ale',
* Plug 'tpope/vim-fugitive',
* Plug 'tpope/vim-abolish',
* Plug 'tpope/vim-surround',
* Plug 'plasticboy/vim-markdown',
* Plug 'mzlogin/vim-markdown-toc',
* Plug 'godlygeek/tabular',
* Plug 'itchyny/lightline.vim',
* Plug 'junegunn/fzf.vim',
* Plug 'Chiel92/vim-autoformat',
* Plug 'morhetz/gruvbox',
* Plug 'majutsushi/tagbar',

## Installation

```
git clone https://github.com/jandelgado/vimconfig.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc
```

## Plugin maintenance

Plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug).

### Add new plugins from github.com

Add `Plug` section to vimrc and run `:PlugInstall`

### Update plugins

Run `:PlugStatus` to check, `:PlugUpdate` to update.

### Remove a plugin

Remove `Plug` section from vimrc and run `:PlugClean`

