Config = {}
Config.Framework = "new-qb" -- new-qb, old-qb, esx
Config.DisableAttackToPlayer = "job" -- / job or all // If you make it "all", the player will never be able to shoot another player with the Config.WeaponHash weapon.
Config.NewESX = true -- if you are using esx legacy set this to true
Config.WeaponAsItem = true -- if you want to use weapon as item set this to true (for default esx inventory set this to false)
Config.Inventory = 'ox_inventory' -- qb , esx , ox_inventory, codem-inventory (if you are using a different inventory you can write your default framework e.g QBCore qs-inventory 'qb' or ESX qs-inventory 'esx')
Config.UseCharacterName = true
Config.PedProtection = false -- If true, players cannot harm each other with Config.WeaponHash, but the client resmon value is increased when players have weapons in their hands
Config.ServerImage = "https://cdn.discordapp.com/attachments/1116058928044843028/1135970581053968485/mrp.png"
Config.CarSpawnCoord = vector4(-771.86, 5578.4, 33.49, 85.42)
Config.WeaponHash = "weapon_sniperrifle"
Config.PedWeaponDeleted = true -- true or false erases the gun in your hand
Config.CheckHoldingWeapon = false -- true or false checks if the player is holding the weapon for claiming items
Config.VehicleHash = "kamacho"
Config.MySQL = "oxmysql" -- oxmysql, mysql-async , ghmattimysql
Config.PedCoords = vector4(-773.34, 5598.67, 33.61 -0.98, 170.53)
Config.RandomXPForKillAnimal = {min = 5, max = 20}
Config.PedSpawnCount = 80   -- max 100
Config.MoneyType = "bank" -- bank or cash or black_money
Config.AmmoItem = {
    name = "snp_ammo", -- codem-inv == snp_ammo 
    count = 2
}

Config.Action = {
    actiontype = 'drawtext', -- or "drawtext"
    target = 'ox_target' -- "qb-target" or "ox_target" 
}

Config.Ped = "cs_hunter"
Config.HuntingBlip = {
    sprite = 141,
    color = 3,
    name = "Hunting",
    scale = 0.7,
}
Config.Blip = {
    sprite = 141,
    color = 3,
    name = "Your Hunt Area",
    scale = 0.7,
    
}

Config.RequiredXP = { -- do not touch
    [1] = 1000,
    [2] = 1500,
    [3] = 2000,
    [4] = 2500,
    [5] = 3000,
    [6] = 3500,
    [7] = 4000,
    [8] = 4500,
    [9] = 5000,
    [10] = 5500,
    [11] = 6000,
    [12] = 6500,
    [13] = 7000,
    [14] = 7500,
    [15] = 8000,
    [16] = 8500,
    [17] = 9000,
    [18] = 9500,
    [19] = 10000,
    [20] = 10500,
    [21] = 11000,
    [22] = 11500,
    [23] = 12000,
    [24] = 12500,
    [25] = 13000,
    [26] = 13500,
    [27] = 14000,
    [28] = 14500,
    [29] = 15000,
    [30] = 15500,
    [31] = 16000,
    [32] = 16500,
    [33] = 17000,
    [34] = 17500,
    [35] = 18000,
    [36] = 18500,
    [37] = 19000,
    [38] = 19500,
    [39] = 20000,
    [40] = 20500,
    [41] = 21000,
    [42] = 21500,
    [43] = 22000,
    [44] = 22500,
    [45] = 23000,
    [46] = 23500,
    [47] = 24000,
    [48] = 24500,
    [49] = 25000,
    [50] = 25800,
    [51] = 25500,
    [52] = 26000,
    [53] = 26500,
    [54] = 27000,
    [55] = 27500,
    [56] = 28000,
    [57] = 28500,
    [58] = 29000,
    [59] = 29500,
    [60] = 30000,
    [61] = 30500,
    [62] = 31000,
    [63] = 31500,
    [64] = 32000,
    [65] = 32500,
    [66] = 33000,
    [67] = 33500,
    [68] = 34000,
    [69] = 34500,
    [70] = 35000,
    [71] = 35500,
    [72] = 36000,
    [73] = 36500,
    [74] = 37000,
    [75] = 37500,
    [76] = 38000,
}

Config.DefaultPicture = 'https://www.gitbook.com/cdn-cgi/image/width=40,dpr=2,height=40,fit=contain,format=auto/https%3A%2F%2F3253843082-files.gitbook.io%2F~%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FMRUfpMzIuVWlJ1CkzDbb%252Ficon%252FD3wjQp0cCyS6MkqdCs1C%252Fimage_2022-09-06_182033969.png%3Falt%3Dmedia%26token%3D662e0ec6-bb96-40d2-87e0-3e74d4061566'
Config.Wiki = {
    [1] = {
      label = "Pigeons",
      description = "Flying Rats, also known as pigeons, are animals present in Grand Theft Auto= London 1969, Grand Theft Auto= London 1961, Grand Theft Auto IV (as a collectible), Grand Theft Auto V, and later introduced to Grand Theft Auto Online as part of the continuation of the The Diamond Casino & Resort update, as one of the possible controllable animals via peyote plants.Pigeons appear in the enhanced version of Grand Theft Auto V and Grand Theft Auto Online, though no longer as collectibles. Similar to other animals, the player can transform into a pigeon by consuming Peyote Plants in both games.Pigeons are the first animal species to physically appear in the Grand Theft Auto series.",
      image = "pigeon.png",
      scientificname = "Columba livia domestica",
      species = "Birds",
      habitat = "All over Los Santos",
      size = "Small",
      items = "Pigeon Meat,Pigeon Feather"
    },
    [2] = {
      label = "Crows",
      description = "Crows are American blackbirds that fly around desert areas, mainly in Sandy Shores, around Mount Chiliad, and to a lesser extent, Ludendorff, where they can be heard cawing. It is one of the animals that the player can control after consuming a peyote plant in the enhanced edition, and is one of the animals required for Franklin to photograph for the Wildlife Photography Challenge.Peyote Plants were also added to Grand Theft Auto Online as part of the continuation of the The Diamond Casino & Resort update, with a crow being one of the possible animals the player can transform into.",
      image = "crow.png",
      scientificname = "Corvus brachyrhynchos",
      species = "Birds",
      habitat = "All over Los Santos",
      size = "Small",
      items = "Crow Meat,Crow Feather"
    },
    [3] = {
      label = "Seagulls",
      description = "Seagulls are animals and a form of collectible in the episodes The Lost and Damned and The Ballad of Gay Tony DLCs for Grand Theft Auto IV. They are later found as controllable creatures in Grand Theft Auto V and Grand Theft Auto Online.Seagulls are similar to the main game's pigeons in which they are 'collected' by shooting them. They are much easier to locate because of their louder sounds, and all of them can be found in easier-to-reach places. There are fifty seagulls total in both games.",
      image = "seagul.png",
      scientificname = "Larus smithsonianus",
      species = "Birds",
      habitat = "Paleto Beach Side",
      size = "Small",
      items = "Seagull Meat, Seagull Feather"
    },
    [4] = {
      label = "Great Cormorants",
      description = "It is one of the animals that the player can control after consuming a peyote plant in the enhanced edition, and is one of the animals required for Franklin to photograph for the Wildlife Photography Challenge. They can be found in Los Santos and Blaine County. They can also be found flying overhead south of Martin Madrazo's Lock-up.",
      image = "greatcormorant.png",
      scientificname = "Larus smithsonianus",
      species = "Birds",
      habitat = "Paleto Beach Side",
      size = "Small",
      items = "Cormorant Meat, Cormorant Beak"
    },
    [5] = {
      label = "Deers",
      description = "Deer are animal species that are featured in Grand Theft Auto V and Grand Theft Auto Online.They can usually be found in the forested areas of Blaine County, but can also be spotted in all rural areas, with the exception being the Grand Senora Desert. Deer are one of the animal species that can be hunted by Trevor Philips.The particular deer/elk found in the game resemble White-tailed deer, a common deer species all across the USA and into much of Canada.In the game, both bucks (male deer) and does' (female deer) spawn. Male deer can be recognized by their large antlers on their head. Female deer are generally smaller in size. The player can hunt and kill both of them, although Cletus advises against killing does.",
      image = "deer.png",
      scientificname = "Odocoileus virginianus",
      species = "Mammals",
      habitat = "Paleto Forest",
      size = "Large",
      items = "Deer Meat, Deer Feather"
    },
    [6] = {
      label = "Rabbits",
      description = "Rabbits (often referred as bunnies by the protagonist) is a type of animal found in the Xbox One/PS4/PC versions of Grand Theft Auto V, as well as in Grand Theft Auto Online as part of the continuation of the The Diamond Casino & Resort update.Rabbits are small, non-threatening animals that will tend to flee from the player when approached. They can be found in any rural area of San Andreas. They can be killed with one bullet from most weapons. They are not as fast as real rabbits, as dogs and cats are much faster than rabbits in the game. Like most animals, when spooked by the player, they will run off to the nearest bush and disappear.Rabbits are one of the animals available to be controlled by the player when eating Peyote Plants in GTA V or in GTA Online, and are also a species required to be photographed in the Wildlife Photography Challenge.",
      image = "rabbit.png",
      scientificname = "Leporidae",
      species = "Wild rabbit",
      habitat = "Paleto Forest",
      size = "Small",
      items = "Rabbit Meat, Rabbit Skin"
    },
    [7] = {
      label = "Rats",
      description = "Rats are animals that appear in Grand Theft Auto V.Rats do not serve any purpose in the game and exist only to add an aspect of realism. They can be killed in one hit with any firearm in the game. They are mainly found near tramps under freeways and in abandoned places such as sewers. Rats can also be found scurrying around Sandy Shores and in Trevor's dirty trailer.",
      image = "rat.png",
      scientificname = "Rattus",
      species = "Black-rat",
      habitat = "Paleto Forest",
      size = "Tiny",
      items = "Rat Meat, Rat Skin"
    },
    [8] = {
      label = "Pigs",
      description = "Pigs are domestic animals featured in Grand Theft Auto V and Grand Theft Auto Online.The pigs featured in the game are average domesticated pigs. They can usually be found in small rural towns and farms.There are three different kinds of pigs that spawn. The first type has a pink body, the second type has a pink body with black spots, and the third type has a black body. Pigs are passive animals and will not attack the player or any NPC when provoked. They cannot be found in the wild, but can be seen in rural areas, usually confined to a small yard or lot. Pigs will flee if harmed by the player. They can commonly be heard making grunting and squealing noises, and if harmed or killed, they will utter a high-pitched squeal to signal that they are in distress.",
      image = "pig.png",
      scientificname = "Sus scrofa domesticus",
      species = "Domestic Pig",
      habitat = "Paleto Forest",
      size = "Medium",
      items = "Pig Meat, Pig Skin"
    },
    [9] = {
      label = "Coyotes",
      description = "Coyotes are an animal species featured in Grand Theft Auto V and Grand Theft Auto Online. Coyotes can be found and hunted in Blaine County. If the player approaches the coyote flees in the opposite direction. They can be run over along with shot and/or beaten to death. If the player shoots a coyote in the leg, it can limit its mobility; only being able to walk instead of run. Coyotes are one of the animal species that can be hunted by Trevor Philips.",
      image = "coyote.png",
      scientificname = "Canis latrans",
      species = "Canid",
      habitat = "Canid",
      size = "Medium",
      items = "Coyote Meat, Coyote Skin"
    },
    [10] = {
      label = "Coguars",
      description = "Cougars (also known as Mountain Lions) are wild animals that appears in Grand Theft Auto V and Grand Theft Auto Online.Cougars are large, wild cats that can be found in forested and hilly areas throughout San Andreas, from the Vinewood Hills to Mount Chiliad; the western area of the Cougar's range can get quite close to Los Santos, as these animals can be sighted as close to the city as the undeveloped areas around the Kortz Center and Banham Canyon. When a Cougar is nearby, the first giveaway will often be its loud growl. If the area is populated, pedestrians will usually be seen running away and screaming. When attacking, a cougar will relentlessly charge at its victim, pounce on them, and kill them instantly with a throat bite. Its fast speed means that killing one before it pounces requires quick thinking and reflexes.",
      image = "coguar.png",
      scientificname = "Puma concolor",
      species = "Felinae",
      habitat = "Canid",
      size = "Medium",
      items = "Coguars Meat, Coguars Skin"
    },
    [11] = {
      label = "Boars",
      description = "Boars are wild animals featured in Grand Theft Auto V and Grand Theft Auto Online.Boars are, in general, brown hogs that has a medium-large size and are recognizable by their pig-like appearances. However, contrary to the pigs, boars are clearly distinguished by the small tusks protruding from their mouths.",
      image = "boar.png",
      scientificname = "Sus scrofa",
      species = "Wild pig",
      habitat = "Canid",
      size = "Medium/Large",
      items = "Boar Meat, Boar Skin, Boar Horn"
    },
    [12] = {
      label = "Snakes",
      description = "Snakes are animals that appear in Grand Theft Auto V and Grand Theft Auto Online.Two snakes appear in the game in terrariums at the Vanilla Unicorn and Yellow Jack Inn. However, they do not move and exist only as static 'objects'. A live snake appears in a commercial for the Grand Senora Desert.It is possible that they existed in the beta version as active models like in Red Dead Redemption, but they were later cut in development for the final version. Snakes also appear in the film Capolavoro, along with Horses, suggesting that snakes were developed for the game (or to be precise, reused from RDR).The snake resembles the Boa constrictor, a species of boa.",
      image = "snake.png",
      scientificname = "Boa constrictor",
      species = "Reptile",
      habitat = "Paleto Forest",
      size = "Small",
      items = "Snake Meat, Snake Skin"
    },
    [13] = {
      label = "Hawks",
      description = "Hawks are animals that appear in Grand Theft Auto= San Andreas, Grand Theft Auto V and Grand Theft Auto Online.It is one of the animals that the player can control after consuming a peyote plant in the enhanced edition, and is one of the animals required for Franklin to photograph for the Wildlife Photography Challenge. They can be found in Blaine County and flying overhead at Martin's lockup.Peyote Plants were also added to Grand Theft Auto Online as part of the continuation of the The Diamond Casino & Resort update, with hawks being one of the possible animals the player can transform into.",
      image = "hawk.png",
      scientificname = "Buteo jamaicensis",
      species = "Birds",
      habitat = "Paleto Forest",
      size = "Small/Medium",
      items = "Hawl Meat, Hawk Skin, Hawk Beak"
    },
}

Config.Translate = {
    ['welcome'] = "WELCOME TO HUNTING CLUB",
    ['welcomedesc'] = "Responsible hunters prioritize the welfare of animals and strive to minimize suffering. Using appropriate equipment, such as rifles with accurate and humane ammunition, ensures a swift and humane kill. Ethical hunters undergo proper training to enhance their marksmanship skills, increasing the likelihood of making a clean and efficient kill.Trophy hunting, when conducted ethically and responsibly, can provide funding for conservation efforts and support local communities. Responsible trophy hunting involves careful selection of mature animals, and the proceeds generated contribute to conservation initiatives, anti-poaching efforts, and local livelihoods. This approach emphasizes the conservation and sustainable management of wildlife populations.Ethical hunting with a rifle embodies a deep respect for nature, wildlife, and the environment. By adhering to legal regulations, practicing selective harvesting, utilizing humane hunting techniques, and supporting responsible trophy hunting, hunters can enjoy their pursuits while contributing to the preservation of ecosystems and biodiversity. It is essential to remember that hunting should always be conducted within the bounds of the law to avoid any legal consequences.",
    ['huntcheck'] = "I understand the things up there.",
    ['letshunt'] = "Lets Hunt",
    ['nopersonelgun'] = "NO PERSONAL GUNS ALLOWED",
    ['gunddesc'] = "To get hunting you need to turn over your weapons to Hunting Club’s Lockers.You can take your weapons back after hunts.",
    ['noguntext'] = "NO PERSONAL GUNS",
    ["dropweapons"] = "Turn Over Your Weapons",
    ["takebadge"] = "TAKE YOUR BADGE",
    ["takebadgedesc"] = "Also to get identified as a hunter from hunting club you need to carry hunting club badge with you. This badge will identify that you are on a hunt and emergency services will know about that.",
    ["takebadgelower"] = "Take Badge",
    ["mainhunt"] = "Hunt",
    ["maincoop"] = "Coop",
    ["mainwiki"] = "Wiki",
    ["mainleaderboard"] = "Leaderboard",
    ["mainstats"] = "Stats",
    ["mainmarket"] = "Market",
    ["mainexit"] = "Exit",
    ["category"] = "SELECT A HUNTING CATEGORY",
    ["birds"] = "BIRDS",
    ["animals"] = "ANIMALS",
    ["predators"] = "PREDATORS",
    ["birdsdesc"] = "You can hunt Pigeon, Hawk,Crow, Seagull and Great Cormorant.",
    ["animalsdesc"] = "You can hunt Deers,  Pigs, Rabbits and Rats.",
    ["predatorsdesc"] = "You can hunt Boars,  Cougars, Coyotes, Panthers and Snakes.",
    ["required"] = "Required",
    ["select"] = "SELECT",
    ["goback"] = "Go Back",
    ["getvehicle"] = "Get Vehicle",
    ["kamacho"] = "Canis Kamacho",
    ["descriptionvehicle"] = "This vehicle will be given to Hunting Club members for free, but when you turn your badge over, club will take the vehicle. If you have your own vehicle you can skip this option.",
    ["vehiclestitle"] = "NEED A RIDE ?",
    ["mainmenu"] = "Main Menu",
    ["skip"] = "Skip",
    ["getgeartitle"] = "GET YOUR GEAR",
    ["rifleandknife"] = "Hunting Rifle and Knife",
    ["gearsdescription"] = "This items will be given to Hunting Club members for free, but when you turn your badge over, club will take the gears as well.",
    ["getgears"] = "Get Gears",
    ["areatitlebird"] = "SELECT AN ANIMAL AREA",
    ["neighbourhoodbirds"] = "NEIGHBOURHOOD BIRDS",
    ["neighbirdsdesc"] = "You can hunt Pigeon and Crows in this area. Location will be automaticly set to your navigation.",
    ["beachsidebird"] = "BEACH SIDE BIRDS",
    ["beachsidebirddesc"] = "You can hunt Seagulls and Great Cormorants in this area. Location will be automaticly set to your navigation.",
    ["contracts"] = "CONTRACTS",
    ["catchpigeons"] = "CATCH PIGEONS",
    ["pigeonsdesc"] = "Catch 10 Pigeons and deliver them back to Hunting Club.",
    ["catchcrows"] = "CATCH CROWS",
    ["crowsdesc"] = "Catch 10 Crows and deliver them back to Hunting Club.",
    ["catchpigeonf"] = "PIGEON FEATHERS",
    ["pigeonfdesc"] = "Hunt 30 Pigeon on a single hunt and sell their feathers on the market.",
    ["catchcrowfeathers"] = "CROW FEATHERS",
    ["crowfeathersdesc"] = "Hunt 30 Crows on a single hunt and sell their featherson the market.",
    ["takecontracts"] = "Take Contracts",
    ["contractsdescription"] = "Complete Hunting Club’s contracts to earn extra experience points to level up faster and make more money.",
    ["letshunt"] = "ALL SET, LETS HUNT",
    ["hunt"] = "HUNT",
    ["selectedtext"] = "selected, hunting rifle and knife given to player, player took the vehicle keys as well.",
    ["contracttaken"] = "One contract taken. Let's Go!",
    ["nocontract"] = "No Contract",
    ["animalspaleto"] = "PALETO BAY FOREST",
    ["animalscarddesc"] = "You can hunt Deer, Pig, Rabbit and Rat in this area. Location will be automaticly set to your navigation.",
    ["huntdeers"] = "HUNT DEERS",
    ["huntdeersdescription"] = "Hunt 10 Deers and sell their meat, skin and horns to Hunting Club’s Market.",
    ["huntpigs"] = "HUNT PIGS",
    ["huntpigsdescription"] = "Hunt 10 Pigs and sell their meat, skin  and lard to Hunting Club’s Market.",
    ["huntrabbits"] = "HUNT RABBITS",
    ["huntrabbitsdescription"] = "Hunt 10 Rabbits and sell their meat and skin to Hunting Club’s Market.",
    ["huntrats"] = "HUNT RATS",
    ["huntratsdescription"] = "Hunt 10 Rats and sell their meat and skin to Hunting Club’s Market.",
    ["areatitlepredator"] = "SELECT A PREDATOR AREA",
    ["sandypredators"] = "SANDY SHORES PREDATORS",
    ["sandypredatorsdesc"] = "You can hunt Coyotes, Coguars and Boars in this area. Location will be automaticly set to your navigation.",
    ["militarypredators"] = "MILITARY SWAMP PREDATORS",
    ["militarypredatorsdesc"] = "You can hunt Snakes and Hawks in this area. Location will be automaticly set to your navigation.",
    ["huntcoyotes"] = "HUNT COYOTES",
    ["huntcoyotesdesc"] = "Hunt 10 Coyotes and selltheir meat and skin to Hunting Club’s Market.",
    ["huntcougars"] = "HUNT COUGARS",
    ["huntcougarsdesc"] = "Hunt 10 Cougars and sell their meat and skin to Hunting Club’s Market.",
    ["huntboars"] = "HUNT BOARS",
    ["huntboarsdesc"] = "Hunt 10 Boars and sell their meat and skin to Hunting Club’s Market.",
    ["huntpredators"] = "HUNT PREDATORS",
    ["huntpredatorsdesc"] = "Hunt 10 Coyotes, Cougars, Boars and sell their meat and skin to Hunting Club’s Market.",
    ["wiki"] = "WIKI",
    ["scientificname"] = "Scientific name",
    ["species"] = "Species",
    ["habitat"] = "Habitat",
    ["items"] = "Drop Items",
    ["size"] = "Size",
    ["level"] =  "Level",
    ["leaderboardtitle"] = "LEADERBOARD",
    ["stats"] = "STATISTICS",
    ["recenthunts"] = "Recent Hunts",
    ["huntedanimals"] = "Hunted Animals",
    ["market"] = "MARKET",
    ["sell"] = "SELL",
    ["itemsyouhave"] = "Items You Have",
    ["card"] = "Card",
    ["coop"] = "HUNT WITH FELLAS",
    ["joincoop"] = "Join Co-op Lobbies",
    ["joincoopdesc"] = 'You can hunt with your friends, select and display all co-op lobbies. There are currently %s hunters on the hunt right now.',
    ["createlobby"] = "Create Your Lobby",
    ["createlobbydesc"] = "Create your lobby so your mates or new friends can join you with the hunt.",
    ["cooplobbies"] = "CO-OP LOBBIES",
    ["searchlobby"] = "Search lobbies...",
    ["huntersonline"] = "Hunters Are Online",
    ["lobby"] = "Lobby",
    ["lobbys"] = "Lobby's",
    ["join"] = "JOIN",
    ["party"] = "Party",
    ["host"] = "Host",
    ["hunter"] = "Hunter",
    ["huntdetails"] = "Hunt Details",
    ["location"] = "Location",
    ["vehicle"] = "Vehicle",
    ["contractstaken"] ="Contracts Taken",
    ["lobbytype"] = "Lobby Type",
    ["unk"] = "Unknown",
    ["private"] = "Private",
    ["public"] = "Public",
    ["hunttype"] = "Hunt Type",
    ["lobbydetails"] = "Lobby Details",
    ["lobbysize"] = "Lobby Size",
    ["yes"] = "Yes",
    ["no"] = "No",
    ["getcamachovehicle"] = "Get Camacho Vehicle",
    ["password"] = "Password",
    ["set"] = "Set",
    ["typepassword"] = "Type the password...",
    ["createlobby"] = "CREATE LOBBY",
    ["contractsfor"] = "Contracts For",
    ["leavelobby"] = "Leave Lobby",
    ["xp"] = "EXP",
    ["action"] = "Open Hunt Page",
    ["finish"] = "You finished your job!",
    ["huntingstarted"] = "Your hunt job has been started , location set to your map!",
    ["claimitems"] = "Press [~g~E~s~] to claim",
    ["itemsclaiming"] = "Items claiming...",
    ["finishedcontract"] = "You completed the contract very well!",
    ["notenoughitem"] = "Player does not have enough Items: ",
    ["emptyInv"] = "Your inventory is empty.",
    ['holdingweapon'] = "You cannot claim items while holding a weapon.",
}

Config.ItemPrices = {
      ["pigeonmeat"] = {type = "bird", price = 150}, --- 
      ["pigeonfeather"] = {type = "bird", price = 150},
      ["crowmeat"] = {type = "bird", price = 150},
      ["crowfeather"] = {type = "bird", price = 150},
      ["seagullmeat"] = {type = "bird", price = 150},
      ["seagullfeather"] = {type = "bird", price = 150},
      ["cormorantmeat"] = {type = "bird", price = 150},
      ["cormorantbeak"] = {type = "bird", price = 150},
      ["deermeat"] = {type = "animal", price = 150},
      ["deerhorn"] = {type = "animal", price = 150},
      ["rabbitmeat"] = {type = "animal", price = 150},
      ["rabbitskin"] = {type = "animal", price = 150},
      ["ratmeat"] = {type = "animal", price = 150},
      ["pigmeat"] = {type = "animal", price = 150},
      ["pigskin"] = {type = "animal", price = 150},
      ["coyotemeat"] = {type = "predator", price = 150},
      ["coyoteskin"] = {type = "predator", price = 150},
      ["coguarmeat"] = {type = "predator", price = 150},
      ["coguarskin"] = {type = "predator", price = 150},
      ["boarmeat"] = {type = "predator", price = 150},
      ["boarskin"] = {type = "predator", price = 150},
      ["boarhorn"] = {type = "predator", price = 150},
      ["snakemeat"] = {type = "predator", price = 150},
      ["snakeskin"] = {type = "predator", price = 150},
      ["hawkmeat"] = {type = "predator", price = 150},
      ["hawkskin"] = {type = "predator", price = 150},
      ["hawkpeak"] = {type = "predator", price = 150},
}


Config.Categories  = {
    ["birds"] = {
        requiredLevel = 0,
        [1] = {
            requiredLevel = 0,
            type = "birds", -- do not change
            name = "Neighbourhood Birds",
            image = "neighbourhoodbirds.png",
            location = "Paleto Bay",
            locationcoord = vector3(-647.91, 5927.96, 16.2),
            description = Config.Translate['neighbirdsdesc'],
            hash = {
                ['a_c_pigeon'] = {
                    ['pigeonmeat'] = {chance = 100, amount = {min = 1, max = 3}},
                    ['pigeonfeather'] = {chance = 100, amount = {min = 1, max = 3}}
                },
                ['a_c_crow'] = {
                    ['crowmeat'] = {chance = 100, amount = {min = 1, max = 3}},
                    ['crowfeather'] = {chance = 100, amount = {min = 1, max = 3}}
                },
            },
            index = 1,
        },
        [2] = {
            requiredLevel = 60,
            type = "birds", -- do not change
            name = "Beach Side Birds",
            image = "beachsidebirds.png",
            location = "Paleto Bay",
            locationcoord = vector3(92.23, 6975.69, 9.89),
            description = Config.Translate['beachsidebirddesc'],
            hash = {
                ['a_c_cormorant'] = {
                    ['cormorantmeat'] = {chance = 100, amount = {min = 1, max = 3}},
                    ['cormorantbeak'] = {chance = 100, amount = {min = 1, max = 3}}
                },
                ['a_c_seagull'] = {
                    ['seagullmeat'] = {chance = 100, amount = {min = 1, max = 3}},
                    ['seagullfeather'] = {chance = 100, amount = {min = 1, max = 3}}
                },
            },
            index = 2,
        },
    },



    ["animals"] = {
        requiredLevel = 20,
        [1] = {
            requiredLevel = 20,
            type = "animals", -- do not change
            name = "Paleto Bay Forest",
            image = "bg-animals.png",
            location = "Paleto Bay",
            locationcoord = vector3(-753.09, 5117.6, 158.34),
            description = Config.Translate['animalscarddesc'],
            hash = {
                ['a_c_deer'] = {
                    ['deermeat'] = {chance = 100, amount = {min = 1, max = 3}},
                    ['deerhorn'] = {chance = 100, amount = {min = 1, max = 3}}
                },
                ['a_c_pig'] = {
                    ["pigmeat"] = {chance = 100, amount = {min = 1, max = 3}},
                    ["pigskin"] = {chance = 100, amount = {min = 1, max = 3}}
                },
                ['a_c_rabbit_01'] = {
                    ["rabbitmeat"] = {chance = 100, amount = {min = 1, max = 3}},
                    ["rabbitskin"] = {chance = 100, amount = {min = 1, max = 3}},
                },
                ['a_c_rat'] = {
                    ["ratmeat"] = {chance = 100, amount = {min = 1, max = 3}},
                },
            },
            index = 1,
        },
    },
    ["predators"] = {
        requiredLevel = 40,
        [1] = {
            requiredLevel = 40,
            type = "predators", -- do not change
            name = "Sandy Shores Predators",
            image = "sandy-shores-predators.png",
            location = "Paleto Bay",
            locationcoord = vector3(2472.14, 3374.18, 50.6),
            description = Config.Translate['sandypredatorsdesc'],
            hash = {
                ["a_c_coyote"] = {
                    ["coyotemeat"] = {chance = 100, amount = {min = 1, max = 3}},
                    ["coyoteskin"] = {chance = 100, amount = {min = 1, max = 3}},
                },
                ["a_c_mtlion"] = {
                    ["coguarmeat"] = {chance = 100, amount = {min = 1, max = 2}},
                    ["coguarskin"] = {chance = 100, amount = {min = 1, max = 2}},
                },
                ["a_c_boar"] = {
                    ["boarmeat"] = {chance = 100, amount = {min = 1, max = 4}},
                    ["boarskin"] = {chance = 100, amount = {min = 1, max = 4}},
                    ["boarhorn"] = {chance = 100, amount = {min = 1, max = 4}},
                }
            },
            index = 1,
        },
        [2] = {
            requiredLevel = 50,
            type = "predators", -- do not change
            name = "Military Swamp Predators",
            image = "military-swamp-predators.png",
            location = "Paleto Bay",
            locationcoord = vector3(-1981.92, 2572.65, 2.67),
            description = Config.Translate['militarypredatorsdesc'],
            hash = {
                ["a_c_chickenhawk"] = {
                    ["hawkmeat"] = {chance = 100, amount = {min = 1, max = 4}},
                    ["hawkskin"] = {chance = 100, amount = {min = 1, max = 4}},
                    ["hawkpeak"] = {chance = 100, amount = {min = 1, max = 4}},
                },
            },
            index = 2,
        },
    },
}




Config.Contracts = {
    ["birds"] = {
        [1] = {
            money = 500,
            xp = 1500,
            text = "Catch 10 Pigeons and deliver them back to Hunting Club.",
            title = "CATCH PIGEONS",
            hash = {
                ['a_c_pigeon'] = 10,
            },
        },
        [2] = {
            money = 500,
            xp = 1500,
            text = "Catch 10 Crows and deliver them back to Hunting Club.",
            title = "CATCH CROWS",
            hash = {
                ['a_c_crow'] = 10,
            }
        },
        [3] = {
            money = 500,
            xp = 2500,
            text = "Hunt 30 Pigeon on a single hunt and sell their feathers on the market.",
            title = "PIGEON FEATHERS",
            hash = {
                ['a_c_pigeon'] = 30
            },
        },
        [4] = {
            money = 500,
            xp = 2500,
            text = "Hunt 30 Crows on a single hunt and sell their featherson the market.",
            title = "CROW FEATHERS",
            hash = {
                ['a_c_crow'] = 30,
            }
        },
    },
    ["animals"] = {
        [1] = {
            money = 500,
            xp = 2750,
            text = "Hunt 10 Deers and sell their meat, skin and horns to Hunting Club’s Market.",
            title = "HUNT DEERS",
            hash = {
                ['a_c_deer'] = 10,
            },
        },
        [2] = {
            money = 1500,
            xp = 2750,
            text = "Hunt 10 Pigs and sell their meat, skin  and lard to Hunting Club’s Market.",
            title = "HUNT PIGS",
            hash = {
                ['a_c_pig'] = 10,
            },
        },
        [3] = {
            money = 1500,
            xp = 2750,
            text = "Hunt 10 Rabbits and sell their meat and skin to Hunting Club’s Market.",
            title = "HUNT RABBITS",
            hash = {
                ['a_c_rabbit_01'] = 10,
            },
        },
        [4] = {
            money = 1500,
            xp = 2750,
            text = "Hunt 10 Rats and sell their meat and skin to Hunting Club’s Market.",
            title = "HUNT RATS",
            hash = {
                ['a_c_rat'] = 10,
            }
        },
    },
    ["predators"] = {
        [1] = {
            money = 1500,
            xp = 2500,
            text = "Hunt 10 Coyotes and sell their meat and skin to Hunting Club’s Market.",
            title = "HUNT COYOTES",
            hash = {
                ['a_c_coyote'] = 10,
            },
        },
        [2] = {
            money = 1500,
            xp = 3500,
            text = "Hunt 10 Cougars and sell their meat and skin to Hunting Club’s Market.",
            title = "HUNT COUGARS",
            hash = {
                ['a_c_mtlion'] = 10,
            }
        },
        [3] = {
            money = 500,
            xp = 2750,
            text = "Hunt 10 Boars and sell their meat and skin to Hunting Club’s Market.",
            title = "HUNT BOARS",
            hash = {
                ['a_c_boar'] = 10,
            }
        },
        [4] = {
            money = 3500,
            xp = 4500,
            text = "Hunt 10 Coyotes, Cougars, Boars and sell their meat and skin to Hunting Club’s Market.",
            title = "HUNT PREDATORS",
            hash = {
                ['a_c_boar'] = 10, 
                ['a_c_coyote'] = 10
            }
        },
    },
}


Config.SendMessage = function(message, isError, part, source)
    if part == nil then part = "client" end
    if part == "client" then
        if Config.Framework == "new-qb" or  Config.Framework == "old-qb" then
            local p = nil
            if isError then p = "error" else p = "success" end
            TriggerEvent("QBCore:Notify",message, p)
        else
            TriggerEvent("esx:showNotification", message)
        end
    elseif part == "server" then
        if Config.Framework == "new-qb" or  Config.Framework == "old-qb" then
            local p = nil
            if isError then p = "error" else p = "success" end
            TriggerClientEvent('QBCore:Notify', source, message, p)
        else
            TriggerClientEvent("esx:showNotification",source, message)
        end
    end
end

Config.Vehiclekey = true -- Do NOT Touch if you have any car lock system
Config.VehicleKeySystem = "qb-vehiclekeys" -- cd_garage / qs-vehiclekeys / wasabi-carlock / qb-vehiclekeys

Config.GiveVehicleKey = function(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    if Config.Vehiclekey then
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
        if Config.VehicleSystem == 'cd_garage' then
            TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
        elseif Config.VehicleSystem == 'qs-vehiclekeys' then
            exports['qs-vehiclekeys']:GiveKeys(plate)
        elseif Config.VehicleSystem == 'wasabi-carlock' then
            exports.wasabi_carlock:GiveKey(plate)
        elseif Config.VehicleSystem == 'qb-vehiclekeys' then
            TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate) 
        end
    end
end

Config.VehicleRemovekey = true -- Do NOT Touch if you have any car lock system
Config.VehicleRemoveKeySystem = "qb-vehiclekeys" -- cd_garage / qs-vehiclekeys / qb-vehiclekeys

Config.RemoveVehicleKey = function(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    if Config.VehicleRemovekey then
        if Config.VehicleRemoveKeySystem == 'cd_garage' then
            TriggerServerEvent('cd_garage:RemovePersistentVehicles', exports['cd_garage']:GetPlate(vehicle))
        elseif Config.VehicleRemoveKeySystem == 'qs-vehiclekeys' then
            exports['qs-vehiclekeys']:RemoveKeys(plate)
        elseif Config.VehicleRemoveKeySystem == 'qb-vehiclekeys' then
            TriggerServerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
        end
    end
end

Config.EnableFuel = true -- Do NOT Touch if you have any fuel system
Config.FuelSystem = false -- LegacyFuel / ox-fuel / nd-fuel / frfuel / cdn-fuel / hyon_gas_station
Config.SetVehicleFuel = function(vehicle,fuel_level) -- you can change LegacyFuel export if you use another fuel system 
    if fuel_level == nil then fuel_level = 90 end
    if Config.EnableFuel then
        if Config.FuelSystem == 'LegacyFuel' then
            return exports["LegacyFuel"]:SetFuel(vehicle, fuel_level)
        elseif Config.FuelSystem == 'ox-fuel' then
            return GetVehicleFuelLevel(vehicle, fuel_level)
        elseif Config.FuelSystem == 'nd-fuel' then
            return exports["nd-fuel"]:SetFuel(vehicle, fuel_level)
        elseif Config.FuelSystem == 'frfuel' then
            return exports.frfuel:setFuel(vehicle, fuel_level)
        elseif Config.FuelSystem == 'cdn-fuel' then
            return exports['cdn-fuel']:SetFuel(vehicle, fuel_level)
        elseif Config.FuelSystem == 'hyon_gas_station' then
            return exports["hyon_gas_station"]:SetFuel(vehicle, fuel_level)
        end
    else     
        return SetVehicleFuelLevel(vehicle, fuel_level + 0.0)
    end
end