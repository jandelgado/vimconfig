# this script installs / updates the vim config

FLAGFILE=~/.vim/.jdvc-installed
if [ ! -f $FLAGFILE ]; then

  # this is the first time install
  if [ -f ~/.vimrc ]; then
    echo "you already have an .vimrc file. will not install new one."
    exit 0
  fi

  ln -s ~/.vim/vimrc ~/.vimrc
  cd ~/.vim
  git submodule update --init --recursive
  touch $FLAGFILE

else 
  cd ~/.vim
  git pull
  git submodule update --recursive --remote
fi

