# dotfiles

## Install
```
$ git clone git@github.com:yutaroishiwata/dotfiles.git ~/Developments/dotfiles
```

## Create Symbolic Link
```
$ ln -s ~/Documents/dotfiles/.vimrc ~/
$ ln -s ~/Documents/dotfiles/.gvimrc ~/
$ ln -s ~/Documents/dotfiles/.tmux.conf ~/
$ ln -s ~/Documents/dotfiles/.bashrc ~/
$ ln -s ~/Documents/dotfiles/.zshrc ~/
$ ln -s ~/Documents/dotfiles/.gitconfig ~/
$ ln -s ~/Documents/dotfiles/.gitignore ~/
```

## vim-plug Setup
Using [vim-plug](https://github.com/junegunn/vim-plug) to manage VIM plugins.
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Install plugins
```
:PlugInstall
```

## Install The Silver Searcher
Using [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) to code searching tool.

Install using brew
```
brew install ag
```
