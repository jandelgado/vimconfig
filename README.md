# my vim configuration

This is my personal vim configuration, with plugins included as git submodules and
the pathogen plugin manager.

![screenshot](screenshot.png)

See

* [Cheat-Sheet](CheatSheet.md)
* http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
* https://github.com/tpope/vim-pathogen

for details.

## Plugins

* [vim airline](https://github.com/vim-airline/vim-airline)
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized.git)
* [vim-go](https://github.com/fatih/vim-go)
* [ale](https://github.com/w0rp/ale)
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [vim-markdown](https://github.com/plasticboy/vim-markdown)
* [vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [tabular](https://github.com/godlygeek/tabular)

## Installation

Just run the setup script:
```
  git clone https://github.com/jandelgado/vimconfig.git ~/.vim &&\
  cd ~/.vim && sh setup.sh
```

or, manually:
```
  git clone --recursive https://github.com/jandelgado/vimconfig.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc
```

## Plugin maintenance

Plugins are installed as git submodules.

### Update plugins

```
  git submodule update --remote --merge
  git commit 
```

### Ad new plugins from github.com

```
  git submodule add https://github.com/module.git ~/.vim/bundle/module
  git checkout <tag>  # if you want to stick to specific version
  git add .
  git commit
```

### Remove a plugin

```
  git submodule deinit bundle/vim-airline
  git rm bundle/vim-airline
  rm -Rf .git/modules/vim/bundle/vim-airline
  git commit
```

