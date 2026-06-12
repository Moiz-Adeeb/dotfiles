hl.on("hyprland.start", function()
    --Clipboard History
    hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")

    -- Brightness Control
    hl.exec_cmd("uwsm app -- wl-gammarelay-rs")

    -- Cursor Set
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")

    -- Polkit Agent
    -- hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &")

    -- Notification Daemon
    -- hl.exec_cmd("dunst")

    -- For AFK Detection
    -- hl.exec_cmd("hypridle")

    -- Terminal Server
    -- hl.exec_cmd("foot --server")

    -- Wallpaper Daemon
    -- hl.exec_cmd("swaybg -i /home/moiz/.config/backgrounds/012.jpg -m fill")

    -- Managing Multiple Monitors Daemon
    -- hl.exec_cmd("kanshi")

    -- Status Bar
    -- hl.exec_cmd("uwsm app -- waybar")

    -- Turn off Bluetooth on Start-up
    -- hl.exec_cmd("bluetoothctl power off")
end)
