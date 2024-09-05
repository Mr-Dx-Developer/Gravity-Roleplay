Made by Lionh34rt
Discord: https://discord.gg/AWyTUEnGeN
Tebex: https://lionh34rt.tebex.io/

# Dependencies
* [QBCore Framework](https://github.com/qbcore-framework)
* [mkalasers by mkafrin](https://github.com/mkafrin/mka-lasers)
* [Extended Pacific Bank by K4MB1 MAPS](https://k4mb1.tebex.io/package/4692112)
* [Memorygame by pushkart2](https://github.com/pushkart2/memorygame)
* [qb-powerplant by Lionh34rt](https://lionh34rt.tebex.io/)

# Installation
* **Add the items to your shared > items.lua**
* **Install all the dependencies**
* **Create nightvision in smallresources**
* **Remove all bankrobbery related doorlocks in your doorlock script**
* **You may have to change the clothing piece in the nightvision.lua**
* **If using Gabz fleeca banks: you have to remove the default trolly entitysets**

# Items for shared.lua
```lua
["usb_green"] 		 	 		 = {["name"] = "usb_green",           			["label"] = "USB Drive",	 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "usb_green.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A green USB flash drive"},
["usb_red"] 		 	 		 = {["name"] = "usb_red",           			["label"] = "USB Drive",	 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "usb_red.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A red USB flash drive"},
["usb_blue"] 		 	 		 = {["name"] = "usb_blue",           			["label"] = "USB Drive",	 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "usb_blue.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A blue USB flash drive"},
["usb_gold"] 		 	 		 = {["name"] = "usb_gold",           			["label"] = "USB Drive",	 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "usb_gold.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A gold USB flash drive"},
["usb_grey"] 		 	 		 = {["name"] = "usb_grey",           			["label"] = "USB Drive",	 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "usb_grey.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A grey USB flash drive"},
["laptop_green"] 		 	 	 = {["name"] = "laptop_green",           		["label"] = "Laptop",	 				["weight"] = 2500, 		["type"] = "item", 		["image"] = "laptop_green.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A laptop that you got from Ph03nix"},
["laptop_red"] 		 	 		 = {["name"] = "laptop_red",           			["label"] = "Laptop",	 				["weight"] = 2500, 		["type"] = "item", 		["image"] = "laptop_red.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A laptop that you got from Plague"},
["laptop_blue"] 		 	 	 = {["name"] = "laptop_blue",           		["label"] = "Laptop",	 				["weight"] = 2500, 		["type"] = "item", 		["image"] = "laptop_blue.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A laptop that you got from Ramsay"},
["laptop_gold"] 		 	 	 = {["name"] = "laptop_gold",        		   	["label"] = "Laptop",	 				["weight"] = 2500, 		["type"] = "item", 		["image"] = "laptop_gold.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A laptop that you got from Trinity"},
["explosive"] 					 = {["name"] = "explosive", 					["label"] = "Explosive", 				["weight"] = 5000, 		["type"] = "item", 		["image"] = "explosive.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "An improvised explosive of fireworks and thermite"},
["nightvision"] 			 	 = {["name"] = "nightvision", 					["label"] = "Night Vision Goggles", 	["weight"] = 6000, 		["type"] = "item", 		["image"] = "nightvision.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "These allow you to see in the dark"},
```

# Nightvision: add this to your qb-smallresources
```lua
-- Server side:
QBCore.Functions.CreateUseableItem("nightvision", function(source)
    TriggerClientEvent("nightvision:UseNightvision", source)
end)

-- Client Side: create nightvision.lua
local QBCore = exports['qb-core']:GetCoreObject()

local nightvision = false

RegisterNetEvent("nightvision:UseNightvision", function()
    nightvision = not nightvision
    QBCore.Functions.Progressbar("remove_gear", "Nightvision..", 250, false, true, {}, {}, {}, {}, function()
        if nightvision then
            SetNightvision(true)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "nv", 0.25)
            SetPedPropIndex(PlayerPedId(), 0, 117, 0, true)
        else
            SetNightvision(false)
            SetPedPropIndex(PlayerPedId(), 0, 116, 0, true)
        end
    end)
end)
```