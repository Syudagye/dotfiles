# dotfiles

## install

```
echo "dotfiles" >> $HOME/.gitignore
git clone --bare git@gitlab.com:Syudagye/dotfiles.git $HOME/dotfiles
git --git-dir=$HOME/dotfiles --work-tree=$HOME checkout
```

rofi-power-menu:
```
cp ~/.config/rofi/rofi-power-menu/rofi-power-menu ~/.local/bin/
```
