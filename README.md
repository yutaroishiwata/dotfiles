# dotfiles

![dotfiles](https://user-images.githubusercontent.com/28632796/52785799-3d1f3e80-309c-11e9-9d6d-70a00025de5c.png)

## Install
```
$ git clone git@github.com:yutaroishiwata/dotfiles.git ~/Documents/dotfiles
```

## Create Symbolic Link
```
$ ln -s ~/Developments/dotfiles/.vimrc ~/
$ ln -s ~/Developments/dotfiles/.gvimrc ~/
$ ln -s ~/Developments/dotfiles/.tmux.conf ~/
$ ln -s ~/Developments/dotfiles/.bashrc ~/
$ ln -s ~/Developments/dotfiles/.zshrc ~/
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

Mac (Install using brew)
```
brew install ag
```

Windows (Install using scoop)
```
scoop install ag
```
