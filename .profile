export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
#export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_STYLE_OVERRIDE="gtk2"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR="nvim"
export XKB_DEFAULT_LAYOUT="fr"
# Android building
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache

# Mounting Google Drive
if [ -x "$(command -v rclone)" ]; then
    rclone mount GoogleDrive: $HOME/Documents/GoogleDrive &
fi

# Starting Handshake daemon
if [ -x "$(command -v hnsd)" ]; then
    hnsd --daemon --ns-host 127.0.0.1:5369 --rs-host 127.0.0.1:53
fi
