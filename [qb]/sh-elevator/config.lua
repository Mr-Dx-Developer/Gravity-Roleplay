return {
    texts = {
        open = '[~g~E~w~] - Elevator'
    },

    draw_dist = 3.0,
    interact_dist = 1.5,

    elevators = {
        ['Life Invader'] = {
            {
                number = 0, -- floor
                name = 'Ground Floor', -- or false
                code = nil, -- restrict floor by password
                pos = vector3(-1077.96, -254.81, 37.76),
            },
            {
                number = 1, -- floor
                name = 'Floor One', -- or false
                code = nil, -- restrict floor by password
                pos = vector3(-1078.06, -254.56, 44.02),
            },
            {
                number = 2, -- floor
                name = 'Roof', -- or false
                code = '1234', -- restrict floor by password
                pos = vector3(-1072.81, -246.69, 54.01),
            },
        },
        ['casino tower'] = {
            {
                number = 0, -- floor
                name = 'Ground Floor', -- or false
                code = nil, -- restrict floor by password
                pos = vector3(-149.566, -1073.914, 28.999),
            },
            {
                number = 1, -- floor
                name = 'Roof', -- or false
                code = nil, -- restrict floor by password
                pos = vector3(-175.034, -1062.406, 175.715),
            },
        },
        ['Hospital Lift'] = {
            {
                number = 0, -- floor
                name = 'Lift 0', -- or false
                code = '147', -- restrict floor by password
                pos = vector3(-419.006, -344.933, 24.231),
            },
            {
                number = 1, -- floor
                name = 'Lift 1', -- or false
                code = '147', -- restrict floor by password
                pos = vector3(-452.665, -288.458, 34.949),
            },
            {
                number = 2, -- floor
                name = 'Lift 2', -- or false
                code = '147', -- restrict floor by password
                pos = vector3(-493.527, -327.286, 42.307),
            },
            {
                number = 3, -- floor
                name = 'Lift 3', -- or false
                code = '147', -- restrict floor by password
                pos = vector3(-490.644, -327.488, 69.505),
            },
            {
                number = 4, -- floor
                name = 'Lift 4', -- or false
                code = '147', -- restrict floor by password
                pos = vector3(-444.056, -332.382, 78.168),
            },
        },
    },
}