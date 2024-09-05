----<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- ☾ AMERICAN SCRIPT ☾ --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>--
Config = {}
---------------
---------  CONFIGS GANGS
-----

-- Pounts Amount
Config.RespectAddLV1 = math.random(10,30)

Config.RespectAddLV2 = math.random(50,120)

Config.RespectAddLV3 = math.random(150,220)

-- Gangs
Config.Gang1 = "ballas"

Config.Gang2 = "families"

Config.Gang3 = "No Asignado"

Config.Gang4 = "No Asignado"

Config.Gang5 = "No Asignado"


-----
--------
-------------

------------------------------------------------------------------------------

---------------
---------  CONFIGS COCAINE MISIONS SELL 
-----

Config.itemquitar_misioncocaina = "cokebrick" -- Items
Config.Cantidaditemquitar_misioncocaina = 15  -- Amount Item Eliminated

Config.FormaRecompensa_MisionCocaina = "cash" -- "bank" -- "Crypto"
Config.CantidadRecompensa_MisionCocaina = math.random(4111, 12321) -- Reward Amount

Config['gangsystem'] = {
    ['cocaine-mision'] = { -- Coords Start Cutscene.
        buyerPos1 = vector3(-3176.13, 1103.54, 20.05)
    },
}

-----
--------
-------------




    -- TriggerServerEvent("am_gangsystem:RespectAddLV1")
	
	-- TriggerServerEvent("am_gangsystem:conteo")