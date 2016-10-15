# this script installs / updates the vim config

FLAGFILE=~/.vim/.jdvc-installed
if [ ! -f $FLAGFILE ]; then

  # this is the first time install
  if [ -f ~/.vimrc ]; then
    echo "you already have an .vimrc file. will not install new one."
    echo "installation aborted"
    exit 1
  fi

  ln -s ~/.vim/vimrc ~/.vimrc
  cd ~/.vim
  git submodule update --init
  touch $FLAGFILE

else 
  cd ~/.vim
  git submodule foreach --recursive git pull origin master
fi

