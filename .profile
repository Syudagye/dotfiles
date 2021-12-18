export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
export QT_QPA_PLATFORMTHEME="qt5ct"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR="nvim"

if [ -x "$(command -v rclone)" ]; then
    rclone mount GoogleDrive: $HOME/Documents/GoogleDrive &
fi
