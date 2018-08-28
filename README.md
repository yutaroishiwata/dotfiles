# dotfiles

## Install
```
$ git clone git@github.com:yutaroo/dotfiles.git ~/Documents/dotfiles
```

## Create Symbolic Link for UNIX
```
$ ln -s ~/Documents/dotfiles/.atom ~/.atom
$ ln -s ~/Documents/dotfiles/.vimrc ~/.vimrc
```
## Create Hard Link for Windows
```
$ mklink /H C:\Users\username\.atom\my-packages.txt C:\Users\username\Documents\dotfiles\.atom\my-packages.txt
$ mklink /H C:\Users\username\.vimrc C:\Users\username\Documents\dotfiles\.vimrc
```


## Atom Packages Management
```
$ apm list --installed --bare > ~/.atom/my-packages.txt
$ apm install --packages-file ~/.atom/my-packages.txt
```

## dein VIM Setup
```
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.cache/dein
```

```
:call dein#install()
```
