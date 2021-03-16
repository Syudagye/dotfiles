# dotfiles

## install

```
git clone --bare git@gitlab.com:Syudagye/dotfiles.git $HOME/dotfiles
alias config="git --git-dir=$HOME/dotfiles --work-tree=$HOME"
config checkout
config submodule update --init
```

rofi-power-menu:
```
cp ~/.config/rofi/rofi-power-menu/rofi-power-menu ~/.local/bin/
```
