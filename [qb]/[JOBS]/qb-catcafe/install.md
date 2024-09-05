Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://Discord.gg/sgx

Update v.1.3.1:
	- Fixed crafting calling on a nil value
	- Fixed Cash Register not working
	- Fixed watermelon from beanmachine being required

Update v1.3:
	- Changed to new versions of systems
		- Uses crafting recipes
		- Uses Icons in qb-menu now
		- Fixes any issues with making food and drinks
		- Install Checks to see if any items are missing.
	- Added image support for qb-payments cash register

Update v1.2:
	- Payment systems removed/changed in favour of support for my free payment script qb-payments: https://github.com/qb-athy/qb-payments#
		- Add this script to your server and payment systems will work as normal with extra features
		- This change removes events from client.lua and server.lua
	- Fixed typo in a hand washing qb-target location
	- Several QoL fixes I've lost track of
	- Removed doubled up cat from ledge near staff door
	- Rearranged qb-menu layout
	- Added item checkmarks to qb-menu's to show if you have the required items or not
		- This adds changes to client.lua
	- Changed seat variable name in chairs.lua to reduce conflicts with my other scripts
	- After many arguements, people prefer to PET the cat not PAT the cat.
	- Fixed item requirements/removal. Messed up mochi ingredients all using mint
	- Added missing item, the orange.
	- Consumable info now stored in the shared's item info
	
UPDATE v1.1:
  - Cat Fixes/Updates
	- Added 6 cats that wander (they are dumb/blind and sometimes get stuck in corners)
	- Cats have no collision so you can walk through them (this is to stop people pushing them into corners and such)
	- ONLY sleeping cats can be petted to relieve stress (for now)
	
  - Added now food preparation location, the Hob's next to the ovens
	- These are for noodles and soups
	
  - New Food Items:
	- Bowl of Ramen
	- Bowl of Noodles
	- Paw Cakes (Pancakes)
	- Kitty Pizza (Pizza)
	- Cat Cake Pop (Cake Lolly Pops)
	- Purrito (Burrito)
  - New Drink Item:
	- Mocha Meow (Mocha Drink)
  - New Ingredient:
	- Instant Noodles

  - Complete rewrite of the payment system, now using qb-menu and qb-phone
	- Tickets are still obtainable through this change
  - Added a minimum amount to get receipts, to stop possible $1 exploits
	- If someone tries to make a payment less than this amount, no one will get a receipt. If its over this amount it will work as usual
	- This is based on the amount set in config.lua with Config.MinAmountforTicket
	- This should, in theory be set to the cheapest product you are selling.
	
  - Couple of QoL fixes
	
-------------------------------------------------------------------------------------------------

THESE GO IN YOUR SHARED.LUA IN nchub:

Under the QBShared.Items = {
	--CATCAFE
	["bmochi"] 						= {["name"] = "bmochi",  	     			["label"] = "Blue Mochi",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "mochiblue.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["pmochi"] 						= {["name"] = "pmochi",  	     			["label"] = "Pink Mochi",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "mochipink.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["gmochi"] 						= {["name"] = "gmochi",  	     			["label"] = "Green Mochi",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "mochigreen.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["omochi"] 						= {["name"] = "omochi",  	     			["label"] = "Orange Mochi",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "mochiorange.png",		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },

	--Drinks
	["bobatea"] 					= {["name"] = "bobatea",  	     			["label"] = "Boba Tea",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "bubbletea.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["bbobatea"] 					= {["name"] = "bbobatea",  	     			["label"] = "Blue Boba Tea",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "bubbleteablue.png",	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["gbobatea"] 					= {["name"] = "gbobatea",  	     			["label"] = "Green Boba Tea",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "bubbleteagreen.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["pbobatea"] 					= {["name"] = "pbobatea",  	     			["label"] = "Pink Boba Tea",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "bubbleteapink.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["obobatea"] 					= {["name"] = "obobatea",  	     			["label"] = "Orange Boba Tea",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "bubbleteaorange.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },

	["nekolatte"] 					= {["name"] = "nekolatte",  	     		["label"] = "Neko Latte",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "latte.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },

	["sake"] 						= {["name"] = "sake",  	     				["label"] = "Sake",	 					["weight"] = 100, 		["type"] = "item", 		["image"] = "sake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	
	["miso"] 						= {["name"] = "miso",  	    	 			["label"] = "Miso Soup",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "miso.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["cake"] 						= {["name"] = "cake",  	     				["label"] = "Strawberry Cake",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "cake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["bento"] 						= {["name"] = "bento",  	     			["label"] = "Bento Box",		 		["weight"] = 500, 		["type"] = "item", 		["image"] = "bento.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },

	["riceball"] 					= {["name"] = "riceball",  	     			["label"] = "Neko Onigiri",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "catrice.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	
	["nekocookie"] 					= {["name"] = "nekocookie",  	     		["label"] = "Neko Cookie",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "catcookie.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["donut"] 					= {["name"] = "donut",  	     		["label"] = "Neko Donut",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "catdonut.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	
	--Ingredients
	["boba"] 						= {["name"] = "boba",  			     		["label"] = "Boba",	 					["weight"] = 100, 		["type"] = "item", 		["image"] = "boba.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["flour"] 						= {["name"] = "flour",  			     	["label"] = "Flour",					["weight"] = 100, 		["type"] = "item", 		["image"] = "flour.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["rice"] 						= {["name"] = "rice",  			     		["label"] = "Bowl of Rice",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "rice.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["sugar"] 						= {["name"] = "sugar",  			     	["label"] = "Sugar",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "sugar.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["nori"] 						= {["name"] = "nori",  			    	 	["label"] = "Nori",		 				["weight"] = 100, 		["type"] = "item", 		["image"] = "nori.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "" },
	["blueberry"] 					= {["name"] = "blueberry",  			    ["label"] = "Blueberry",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "blueberry.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["strawberry"] 					= {["name"] = "strawberry",  			    ["label"] = "Strawberry",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "strawberry.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["orange"] 				 		= {["name"] = "orange",  	     			["label"] = "Orange",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "orange.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "An Orange." },
	["mint"] 						= {["name"] = "mint",  			    	 	["label"] = "Matcha",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "matcha.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "" },
	["tofu"] 						= {["name"] = "tofu",  			    	 	["label"] = "Tofu",		 				["weight"] = 100, 		["type"] = "item", 		["image"] = "tofu.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },

	["mocha"] 						= {["name"] = "mocha",  	     			["label"] = "Mocha Meow",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "mochameow.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },

	["cakepop"] 					= {["name"] = "cakepop",  	    	 		["label"] = "Cat Cake-Pop",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "cakepop.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["pancake"] 					= {["name"] = "pancake",  	     			["label"] = "PawCake",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "pawcakes.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["pizza"] 						= {["name"] = "pizza",  	     			["label"] = "Kitty Pizza",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "catpizza.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["purrito"] 					= {["name"] = "purrito",  	     			["label"] = "Purrito",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "purrito.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	
	["noodlebowl"] 					= {["name"] = "noodlebowl",  	     		["label"] = "Bowl of Noodles",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "noodlebowl.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["noodles"] 					= {["name"] = "noodles",  	     			["label"] = "Instant Noodles",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "noodles.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "" },
	["ramen"]						= {["name"] = "ramen",  	     			["label"] = "Bowl of Ramen",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ramen.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },

    ["milk"]                        = {["name"] = "milk",                       ["label"] = "Milk",                     ["weight"] = 300,       ["type"] = "item",      ["image"] = "burger-milk.png",  ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,     ["combinable"] = nil,    ["description"] = "Carton of Milk", ['thirst'] = math.random(35, 54) },
    ["onion"]                       = {["name"] = "onion",                      ["label"] = "Onion",                    ["weight"] = 500,       ["type"] = "item",      ["image"] = "burger-onion.png", ["unique"] = false,     ["useable"] = false,    ["shouldClose"] = false,    ["combinable"] = nil,    ["description"] = "An onion"},

Under the QBShared.Jobs = {

	['catcafe'] = {
		label = 'Cat Cafe',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},

	
--------------------------------------------------------------------------------------------------


Within the config.lua of qb-bossmenu

ADD ONLY ONE, the bossmenu allows only ONE location per job. Adding multiple of the same job name simply uses the one at the bottom of the list.

This adds the boss menu location in the downstairs office:

	['catcafe'] = vector3(-596.26, -1053.52, 21.85),

This adds it to the furthest upstairs office:

	['catcafe'] = vector3(-578.23, -1067.65, 26.12),
	
This adds it to the closest upstairs office:

	['catcafe'] = vector3(-579.1, -1061.28, 26.11),