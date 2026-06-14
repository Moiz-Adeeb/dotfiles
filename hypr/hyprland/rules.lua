-- hl.workspace_rule({
--     workspace = "w[tv1]",
--     gaps_out = 0,
--     gaps_in = 0
-- })
--
-- hl.workspace_rule({
--     workspace = "f[1]",
--     gaps_out = 0,
--     gaps_in = 0
-- })

hl.window_rule({
    name = "no-gaps-wtv1",
    match = {
        float = false,
        workspace = "w[tv1]"
    },
    border_size = 0,
    -- rounding = 0,
    -- rounding_power = 2,
})

hl.window_rule({
    name = "no-gaps-f1",
    match = {
        float = false,
        workspace = "f[1]"
    },
    border_size = 0,
    -- rounding = 0,
    -- rounding_power = 2,
})

hl.window_rule({
    match = { class = "^(float_large)$" },
    float = true,
    center = true,
    size = "1600 900",
})

hl.window_rule({
    match = { class = "^(float_big)$" },
    float = true,
    center = true,
    size = "1280 720",
})

hl.window_rule({
    match = { class = "^(float_small)$" },
    float = true,
    center = true,
    size = "960 600",
})

hl.window_rule({
    match = { class = "^(float_extra_small)$" },
    float = true,
    center = true,
    size = "360 420",
    border_size = 0,
    rounding = 20,
})

hl.window_rule({
    match = { class = "^(thunar)$" },
    float = true,
    center = true,
    size = "1600 900",
})
