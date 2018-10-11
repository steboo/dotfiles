#!/usr/bin/env bash

while getopts ":i" opt; do
  case $opt in
    i)
      useinternet=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG. Use -i to download things from the Internet." >&2
      exit 1
      ;;
  esac
done

mkdir -p ~/.vim
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/indent
mkdir -p -m 700 ~/.vim/swap
mkdir -p -m 700 ~/.vim/undo

cp .vim/vimrc ~/.vim/vimrc
cp .vim/gvimrc ~/.vim/gvimrc
cp .vim/indent/*.vim ~/.vim/indent/

if [ -w ~/.vimrc ]; then
  mv ~/.vimrc ~/.vim/vimrc-old
fi

if [ -w ~/.gvimrc ]; then
  mv ~/.vimrc ~/.vim/vimrc-old
fi

echo "Copied files to ~/.vim"

if [ $useinternet ]; then
  echo "Downloading vim plugins from the Internet..."
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  pushd ~/.vim/bundle
  git clone git://github.com/tpope/vim-dispatch.git
  git clone git://github.com/jpo/vim-railscasts-theme.git
  popd
fi

