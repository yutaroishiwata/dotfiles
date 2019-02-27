# dotfiles

![dotfiles](https://user-images.githubusercontent.com/28632796/52785799-3d1f3e80-309c-11e9-9d6d-70a00025de5c.png)

## Install
```
$ git clone git@github.com:yutaroo/dotfiles.git ~/Documents/dotfiles
```

## Create Symbolic Link for Mac
```
$ ln -s ~/Documents/dotfiles/.atom/my-packages.txt ~/.atom/my-packages.txt
$ ln -s ~/Documents/dotfiles/.vimrc ~/.vimrc
$ ln -s ~/Documents/dotfiles/.gvimrc ~/.gvimrc
$ ln -s ~/Documents/dotfiles/.vim ~/.vim
```
## Create Symbolic Link for Windows
```
$ mklink C:\Users\username\.atom\my-packages.txt C:\Users\username\Documents\dotfiles\.atom\my-packages.txt
$ mklink C:\Users\username\.vimrc C:\Users\username\Documents\dotfiles\.vimrc
$ mklink C:\Users\username\.gvimrc C:\Users\username\Documents\dotfiles\.gvimrc
$ mklink /d C:\Users\username\.vim C:\Users\username\Documents\dotfiles\.vim
$ mklink /d C:\Users\username\.vimfiles C:\Users\username\Documents\dotfiles\.vimfiles
```


## Atom Packages Management
```
$ apm list --installed --bare > ~/Documents/dotfiles/.atom/my-packages.txt
$ apm install --packages-file ~/Documents/dotfiles/.atom/my-packages.txt
```

## dein VIM Setup
Using [dein.vim](https://github.com/Shougo/dein.vim) to manage VIM plugins.
```
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.cache/dein
```

```
:call dein#install()
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
