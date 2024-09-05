Shared = {}

Shared.Plane = {
    model = "bombushka", -- plane model string name
    pilot = "s_m_m_pilot_01" -- pilot model string name
}

Shared.Guards = {
    model = `s_m_y_blackops_01`, -- guard model hash
    weapon = `WEAPON_COMBATPISTOL`, -- guard weapon on hand hash
    range = 50 -- guard spawn range
}

Shared.DropConfig = {
    duration = {"20", "30", "45", "60", "90", "120"},
    interval = {"5", "10", "15", "20", "30"},
    range = {"100", "200", "300", "400", "500"},
    guard = {"0", "5", "10", "15", "20"},
    bufferstart = {"0", "5", "10", "15", "20"},
    bufferstop = {"0", "5", "10", "15", "20"}
}

Shared.debug = true -- dubug mode to get info about mission
Shared.debugPoly = false -- debug mode for polyzone

Shared.Blip = {
    Enabled = true, -- enable red zone on map
    dropBlip = true, -- enable blip for drop crate
    Sprite = 306, -- crate blip sprite id
    Colour = 28, -- crate blip colour id
    Scale = 0.8, -- crate blip size
    ShortRange = true -- crate blip short range view only
}

Shared.Crate = {
    openTime = 10000, -- progressbar timer to open crate
    zOffset = 200, -- crate spawn height
    fallSpeed = 5, -- dont touch this
    crateModel = 'gr_prop_gr_rsply_crate04a', -- crate model string name
    parachuteModel = 'prop_v_parachute', -- parachute model string name
}

Shared.Reward = { -- defualt crate reward if no reward is set on ingame tablet
    maxDrop = 3, -- max drop per crate
    items= {
        {name = 'bandage', chance = 12, min = 1, max = 1, info = {}},
        {name = 'burger', chance = 12, min = 1, max = 1, info = {}},
        {name = 'lockpick', chance = 10, min = 30, max = 30, info = {}},
    },
}