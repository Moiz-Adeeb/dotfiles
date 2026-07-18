hl.on("hyprland.start", function()
    --Clipboard History
    hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")

    -- Brightness Control
    hl.exec_cmd("uwsm app -- wl-gammarelay-rs")

    -- Cursor Set
    -- hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
end)
