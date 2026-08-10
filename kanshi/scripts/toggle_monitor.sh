
#!/bin/bash

CONFIG_DIR="$HOME/.config/kanshi"
CURRENT_TARGET=$(readlink -f "$CONFIG_DIR/config")

# Toggle the symlink between default and alternate configurations
if [[ "$CURRENT_TARGET" == *"config.alt"* ]]; then
    ln -sf "$CONFIG_DIR/config.default" "$CONFIG_DIR/config"
else
    ln -sf "$CONFIG_DIR/config.alt" "$CONFIG_DIR/config"
fi

# Force Kanshi to reread the updated configuration layout
kanshictl reload
