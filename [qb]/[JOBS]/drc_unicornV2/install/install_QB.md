QBCORE INSTALL QUIDE

1. Download all dependencies!
    Dependencies:
    ox_lib | https://github.com/overextended/ox_lib/releases/latest
    es_extended / qb-core
    qtarget / qb-target
    ox_inventory / qb-inventory
    Vanilla MLO


2. Add Images to your inventory
    qb-inventory > html > images
    Paste images from folder images to qb-inventory > html > images 

3. Add Items to your inventory and jobs
    qb-core > shared.lua
    ['unicorn'] = {
        label = 'unicorn Mamas',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Novice',
                payment = 75
            },
            ['2'] = {
                name = 'Experienced',
                payment = 100
            },
            ['3'] = {
                name = 'Advanced',
                payment = 125
            },
            ['4'] = {
                name = 'Manager',
                payment = 150
            },
            ['5'] = {
                name = 'Boss',
                isboss = true,
                payment = 150
            },
        },
    },
    qb-core > shared.lua
    ["pina_colada"] 		 	 	 	 = {["name"] = "pina_colada",           			["label"] = "Pina colada",	 		["weight"] = 175, 		["type"] = "item", 		["image"] = "pina_colada.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["blue_lagoon"] 		 	 	 	 = {["name"] = "blue_lagoon",           			["label"] = "Blue Lagoon",	 		["weight"] = 175, 		["type"] = "item", 		["image"] = "blue_lagoon.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["caipirinha"] 		 	 	 	 = {["name"] = "caipirinha",           			["label"] = "Caipirinha",	 		["weight"] = 175, 		["type"] = "item", 		["image"] = "caipirinha.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},    
    ["mint"] 		 	 	 	 = {["name"] = "mint",           			["label"] = "Mint",	 		["weight"] = 10, 		["type"] = "item", 		["image"] = "mint.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["mai_tai"] 		 	 	 	 = {["name"] = "mai_tai",           			["label"] = "Mai Tai",	 		["weight"] = 175, 		["type"] = "item", 		["image"] = "mai_tai.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["san_francisco"] 		 	 	 	 = {["name"] = "san_francisco",           			["label"] = "San Francisco",	 		["weight"] = 175, 		["type"] = "item", 		["image"] = "san_francisco.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["mojito"] 		 	 	 	 = {["name"] = "mojito",           			["label"] = "Mojito",	 		["weight"] = 175, 		["type"] = "item", 		["image"] = "mojito.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["bar_beans"] 		 	 	 	 = {["name"] = "bar_beans",           			["label"] = "Beans in bowl",	 		["weight"] = 175, 		["type"] = "item", 		["image"] = "bar_beans.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["bar_nuts"] 		 	 	 	 = {["name"] = "bar_nuts",           			["label"] = "Nuts in bowl",	 		["weight"] = 175, 		["type"] = "item", 		["image"] = "bar_nuts.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["bar_bowl"] 		 	 	 	 = {["name"] = "bar_bowl",           			["label"] = "Bowl",	 		["weight"] = 10, 		["type"] = "item", 		["image"] = "bar_bowl.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["bar_bowl_dirty"] 		 	 	 	 = {["name"] = "bar_bowl_dirty",           			["label"] = "Dirty bowl",	 		["weight"] = 10, 		["type"] = "item", 		["image"] = "bar_bowl_dirty.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["beans"] 		 	 	 	 = {["name"] = "beans",           			["label"] = "Beans",	 		["weight"] = 10, 		["type"] = "item", 		["image"] = "beans.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["nuts"] 		 	 	 	 = {["name"] = "nuts",           			["label"] = "Nuts",	 		["weight"] = 10, 		["type"] = "item", 		["image"] = "nuts.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""}, 
    ["ice"] 		 	 	 	 = {["name"] = "ice",           			["label"] = "Ice",	 		["weight"] = 10, 		["type"] = "item", 		["image"] = "ice.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""}, 
    ["coco_milk"] 		 	 	 	 = {["name"] = "coco_milk",           			["label"] = "Coco Milk",	 		["weight"] = 10, 		["type"] = "item", 		["image"] = "coco_milk.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["lemon"] 		 	 	 	 = {["name"] = "lemon",           			["label"] = "Lemon",	 		["weight"] = 10, 		["type"] = "item", 		["image"] = "lemon.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["lime"] 		 	 	 	 = {["name"] = "lime",           			["label"] = "Lime",	 		["weight"] = 10, 		["type"] = "item", 		["image"] = "lime.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""}, 
    ["glass_tall"] 		 	 	 	 = {["name"] = "glass_tall",           			["label"] = "Tall Glass",	 		["weight"] = 50, 		["type"] = "item", 		["image"] = "glass_tall.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["glass_tall_dirty"] 		 	 	 	 = {["name"] = "glass_tall_dirty",           			["label"] = "Dirty Glass Tall",	 		["weight"] = 50, 		["type"] = "item", 		["image"] = "glass_tall_dirty.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["rhum"] 		 	 	 	 = {["name"] = "rhum",           			["label"] = "Rhum",	 		["weight"] = 500, 		["type"] = "item", 		["image"] = "rhum.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["vodka"] 		 	 	 	 = {["name"] = "vodka",           			["label"] = "Vodka",	 		["weight"] = 500, 		["type"] = "item", 		["image"] = "vodka.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["sugar"] 		 	 	 	 = {["name"] = "sugar",           			["label"] = "Sugar",	 		["weight"] = 5, 		["type"] = "item", 		["image"] = "sugar.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
    ["juice"] 		 	 	 	 = {["name"] = "juice",           			["label"] = "Juice",	 		["weight"] = 50, 		["type"] = "item", 		["image"] = "juice.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""}, 


4. add ensure drc_unicorn into your server.cfg (make sure to start it after ox_lib and your target system!)

5. Enjoy your new unicorn script from DRC SCRIPTS!