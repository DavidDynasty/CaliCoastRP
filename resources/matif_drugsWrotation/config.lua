Config = {}

Config.RollTime = 5 * 60000

Config.Locations = {
    ['amphetamine'] = {
        [1] = { x = -372.23, y = 194.22, z = 52.91},     -- Done
        [2] = { x = 147.85, y = -1702.39, z = 52.91},    -- Done
        [3] = { x = 967.58, y = -204.99, z = 52.91},     -- Done
        [4] = { x = 244.75, y = 374.64, z = 52.91},      -- Done
    },
    ['methamphetamine'] = {
        [1] = { x = -263.29, y = 202.87, z = 52.91},     -- Done
        [2] = { x = 227.99, y = -1767.07, z = 52.91},    -- Done
        [3] = { x = 447.53, y = -1897.06, z = 52.91},    -- Done
        [4] = { x = -1359.48, y = 120.5, z = 52.91},     -- Done
    },
    ['rat_poison'] = {
        [1] = { x = -1275.44, y = -1139.69, z = 52.91},  -- Done
        [2] = { x = 68.01, y = -1622.98, z = 52.91},     -- Done
        [3] = { x = -1463.13, y = -381.49, z = 52.91},   -- Done
        [4] = { x = 903.83, y = -974.26, z = 52.91},     -- Done
    },
    ['pill_bottle'] = {
        [1] = { x = -502.9, y = 33, z = 52.91},          -- Done
        [2] = { x = 98.32, y = -225.77, z = 52.91},      -- Done
        [3] = { x = 114.47, y = -4.77, z = 52.91},       -- Done
        [4] = { x = 206.72, y = -1851.51, z = 52.91},    -- Done
    },
    ['bromosafrole'] = {
        [1] = { x = 50.48, y = -108.42, z = 52.91},      -- Done
        [2] = { x = 1021.97, y = -2119.02, z = 52.91},   -- Done
        [3] = { x = 947.47, y = -205.76, z = 52.91},     -- Done
        [4] = { x = -1724.67, y = 234.22, z = 52.91},    -- Done
    },
}

Config.Prices = {
    ['amphetamine'] = 200,
    ['methamphetamine'] = 500,
    ['rat_poison'] = 100,
    ['pill_bottle'] = 50,
    ['bromosafrole'] = 150,
}

Config.Mixer = {
    coords = {x = -1078.62, y = -1679.73, z = 4.58},
    craft = {
        [1] = {name = 'methamphetamine', quantity = 1},
        [2] = {name = 'amphetamine', quantity = 2},
        [3] = {name = 'rat_poison', quantity = 2},
        [4] = {name = 'pill_bottle', quantity = 1},
    },
    crafttime = 1 * 60000,
    craftResult = {item = 'ecstasy', quantity = 12},
} 

Config.AluminumFoil = {
    craft = {
        [1] = {name = 'methamphetamine', quantity = 1},
        [2] = {name = 'amphetamine', quantity = 2},
        [3] = {name = 'rat_poison', quantity = 2},
        [4] = {name = 'bromosafrole', quantity = 1},
        [5] = {name = 'pill_bottle', quantity = 1},
    },
    crafttime = 1 * 60000,
    craftResult = {item = 'ecstasy', quantity = 12},
} 