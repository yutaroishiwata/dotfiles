# dotfiles

## Install & Create Symbolic Link
```
$ git clone git@github.com:yutaroo/dotfiles.git ~/Documents/dotfiles
$ ln -s ~/Documents/dotfiles/.atom ~/.atom
$ ln -s ~/Documents/dotfiles/.vimrc ~/.vimrc
```

## Atom Packages Management
```
$ apm list --installed --bare > ~/.atom/my-packages.txt
$ apm install --packages-file ~/.atom/my-packages.txt
```

## dein VIM Setup
```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```

```
:call dein#install()
```
