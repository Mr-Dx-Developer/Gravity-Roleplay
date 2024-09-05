local QBCore = exports['qb-core']:GetCoreObject()

local Cooldown = false
RegisterCommand('gangphone', function(src)
    local ply = QBCore.Functions.GetPlayer(src)
    local gang = ply.PlayerData.gang.name
    if gang ~= 'none' then
        
		TriggerClientEvent("am_groupsystemystem:DisplayHud", src)
    else
	
       TriggerClientEvent("QBCore:Notify", src, "No eres miembro de Banda", "error")

	end
end)

QBCore.Functions.CreateUseableItem('iphone', function(source)
	local ply = QBCore.Functions.GetPlayer(source)
	local gang = ply.PlayerData.gang.name
    if gang ~= 'none' then
        
		TriggerClientEvent("am_groupsystemystem:DisplayHud", source)
    else
	
       TriggerClientEvent("QBCore:Notify", source, "No eres miembro de Banda", "error")

	end
end)


---------------------------------------------------------------------
-------------------------------------------------------------------
---------------------------------------------------------------------




RegisterServerEvent('gangRespect:jobCompleted')
AddEventHandler('gangRespect:jobCompleted', function()
    jobCompleted(source)
end)

RegisterServerEvent('gangRespect:addGangRespect')
AddEventHandler('gangRespect:addGangRespect', function(gang)
    addGangRespect(gang)
end)


function jobCompleted(player)

    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local gang = Player.PlayerData.gang.name
    if gang ~= 'none' then
        addGangRespect(gang)
    end
end


function addGangRespect(gang)
    MySQL.Async.fetchAll('SELECT respect FROM gang_respect WHERE gang_id = @gang_id', {
        ['@gang_id'] = gang
    }, function(result)
        if result[1] ~= nil then

            local newRespect = result[1].respect + 1
            MySQL.Async.execute('UPDATE gang_respect SET respect = @respect WHERE gang_id = @gang_id', {
                ['@gang_id'] = gang,
                ['@respect'] = newRespect
            })
        else

            MySQL.Async.execute('INSERT INTO gang_respect (gang_id, respect) VALUES (@gang_id, 1)', {
                ['@gang_id'] = gang
            })
        end
    end)
end


QBCore.Commands.Add("restarespeto", "Resta puntos de respeto a una banda", {{name="id", help="ID de la banda"}, {name="cantidad", help="Cantidad de puntos de respeto a restar"}}, true, function(source, args)
    local gang_id = tostring(args[1])
    local respect_to_remove = tonumber(args[2])
    

    if gang_id == nil or respect_to_remove == nil then
        TriggerClientEvent('QBCore:Notify', source, 'Por favor proporciona una ID de banda y la cantidad de respeto a restar.', 'error')
        return
    end


    MySQL.Async.fetchAll('SELECT respect FROM gang_respect WHERE gang_id = @gang_id', {
        ['@gang_id'] = gang_id
    }, function(result)
        if result[1] ~= nil then

            local newRespect = math.max(result[1].respect - respect_to_remove, 0) 
            MySQL.Async.execute('UPDATE gang_respect SET respect = @respect WHERE gang_id = @gang_id', {
                ['@gang_id'] = gang_id,
                ['@respect'] = newRespect
            }, function(rowsChanged)
                if rowsChanged > 0 then
                    TriggerClientEvent('QBCore:Notify', source, 'Has restado ' .. respect_to_remove .. ' puntos de respeto a la banda ' .. gang_id .. '.', 'success')
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Hubo un problema al restar el respeto a la banda.', 'error')
                end
            end)
        else

            TriggerClientEvent('QBCore:Notify', source, 'No se encontró la banda con el ID ' .. gang_id .. '.', 'error')
        end
    end)
end, "police")


QBCore.Commands.Add("darrespeto", "Añade puntos de respeto a una banda (Admin Solamente)", {{name="id", help="ID de la banda"}, {name="cantidad", help="Cantidad de puntos de respeto a añadir"}}, true, function(source, args)
    local gang_id = tostring(args[1])
    local respect_to_add = tonumber(args[2])
    

    if gang_id == nil or respect_to_add == nil then
        TriggerClientEvent('QBCore:Notify', source, 'Por favor proporciona una ID de banda y la cantidad de respeto a añadir.', 'error')
        return
    end


    MySQL.Async.fetchAll('SELECT respect FROM gang_respect WHERE gang_id = @gang_id', {
        ['@gang_id'] = gang_id
    }, function(result)
        if result[1] ~= nil then
            local newRespect = result[1].respect + respect_to_add
            MySQL.Async.execute('UPDATE gang_respect SET respect = @respect WHERE gang_id = @gang_id', {
                ['@gang_id'] = gang_id,
                ['@respect'] = newRespect
            }, function(rowsChanged)
                if rowsChanged > 0 then
                    TriggerClientEvent('QBCore:Notify', source, 'Has añadido ' .. respect_to_add .. ' puntos de respeto a la banda ' .. gang_id .. '.', 'success')
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Hubo un problema al añadir el respeto a la banda.', 'error')
                end
            end)
        else

            TriggerClientEvent('QBCore:Notify', source, 'No se encontró la banda con el ID ' .. gang_id .. '.', 'error')
        end
    end)
end, "admin")


-----------------------------------------------------------------
-----------------------------------------------------------------
    ----- PUNTOS DE RESPETOS POR ROBOS  -----
-----------------------------------------------------------------
-----------------------------------------------------------------

RegisterServerEvent('am_gangsystem:RespectAddLV1')
AddEventHandler('am_gangsystem:RespectAddLV1', function()
    local respect_to_add = Config.RespectAddLV1
    local Player = QBCore.Functions.GetPlayer(source)
    local gang = Player.PlayerData.gang.name

    if gang == Config.Gang1 or Config.Gang2 or Config.Gang3 or Config.Gang4 or Config.Gang5 then
        TriggerClientEvent('QBCore:Notify', source, 'Se te Otorgaran puntos por ser banda', 'error')

    MySQL.Async.fetchAll('SELECT respect FROM gang_respect WHERE gang_id = @gang_id', {
        ['@gang_id'] = gang
    }, function(result)
        if result[1] ~= nil then
            local newRespect = result[1].respect + respect_to_add
            MySQL.Async.execute('UPDATE gang_respect SET respect = @respect WHERE gang_id = @gang_id', {
                ['@gang_id'] = gang,
                ['@respect'] = newRespect
            }, function(rowsChanged)
                if rowsChanged > 0 then

                end
            end)
        else
            TriggerClientEvent('QBCore:Notify', source, 'No se encontró la banda a la que perteneces.', 'error')
        end
    end)
	else
    print("NO ERES BANDA")
	end
end)


RegisterServerEvent('am_gangsystem:RespectAddLV2')
AddEventHandler('am_gangsystem:RespectAddLV2', function()
    local respect_to_add = Config.RespectAddLV2
    local Player = QBCore.Functions.GetPlayer(source)
    local gang = Player.PlayerData.gang.name

    if gang == Config.Gang1 or Config.Gang2 or Config.Gang3 or Config.Gang4 or Config.Gang5 then
        TriggerClientEvent('QBCore:Notify', source, 'Se te Otorgaran puntos por ser banda', 'error')

    MySQL.Async.fetchAll('SELECT respect FROM gang_respect WHERE gang_id = @gang_id', {
        ['@gang_id'] = gang
    }, function(result)
        if result[1] ~= nil then
            local newRespect = result[1].respect + respect_to_add
            MySQL.Async.execute('UPDATE gang_respect SET respect = @respect WHERE gang_id = @gang_id', {
                ['@gang_id'] = gang,
                ['@respect'] = newRespect
            }, function(rowsChanged)
                if rowsChanged > 0 then

                end
            end)
        else
            TriggerClientEvent('QBCore:Notify', source, 'No se encontró la banda a la que perteneces.', 'error')
        end
    end)
	else
    print("NO ERES BANDA")
	end
end)


RegisterServerEvent('am_gangsystem:RespectAddLV3')
AddEventHandler('am_gangsystem:RespectAddLV3', function()
    local respect_to_add = Config.RespectAddLV3
    local Player = QBCore.Functions.GetPlayer(source)
    local gang = Player.PlayerData.gang.name

    if gang == Config.Gang1 or Config.Gang2 or Config.Gang3 or Config.Gang4 or Config.Gang5 then
        TriggerClientEvent('QBCore:Notify', source, 'Se te Otorgaran puntos por ser banda', 'error')

    MySQL.Async.fetchAll('SELECT respect FROM gang_respect WHERE gang_id = @gang_id', {
        ['@gang_id'] = gang
    }, function(result)
        if result[1] ~= nil then
            local newRespect = result[1].respect + respect_to_add
            MySQL.Async.execute('UPDATE gang_respect SET respect = @respect WHERE gang_id = @gang_id', {
                ['@gang_id'] = gang,
                ['@respect'] = newRespect
            }, function(rowsChanged)
                if rowsChanged > 0 then

                end
            end)
        else
            TriggerClientEvent('QBCore:Notify', source, 'No se encontró la banda a la que perteneces.', 'error')
        end
    end)
	else
    print("NO ERES BANDA")
	end
end)

-----------------------------------------------------------------
-----------------------------------------------------------------





-----------------------------------------------------------------
-----------------------------------------------------------------
    ----- PUNTUACION DE ROBOS  -----
-----------------------------------------------------------------
-----------------------------------------------------------------






RegisterServerEvent('am_gangsystem:conteotienda')
AddEventHandler('am_gangsystem:conteotienda', function()
    local conteotienda = 1
    local Player = QBCore.Functions.GetPlayer(source)
    local gang = Player.PlayerData.gang.name

    if gang == "ballas" or "families" then
    MySQL.Async.fetchAll('SELECT tiendas FROM gang_respect WHERE gang_id = @gang_id', {
        ['@gang_id'] = gang
    }, function(result)
        if result[1] ~= nil then
            local newRespect = result[1].tiendas + conteotienda
            MySQL.Async.execute('UPDATE gang_respect SET tiendas = @tiendas WHERE gang_id = @gang_id', {
                ['@gang_id'] = gang,
                ['@tiendas'] = newRespect
            }, function(rowsChanged)
                if rowsChanged > 0 then

                end
            end)
        else
            TriggerClientEvent('QBCore:Notify', source, 'No se encontró la banda a la que perteneces.', 'error')
        end
    end)
	else
        print("NO ERES BANDA")
	end
end)







-----------------------------------------------------------------
-----------------------------------------------------------------


-----------------------------------------------------------------
-----------------------------------------------------------------
    ----- FUNCIONES DE DAT0S PARA ENVIAR A JS  -----
-----------------------------------------------------------------
-----------------------------------------------------------------



local function format_int(number)
    local formatted = tostring(number):reverse():gsub("(%d%d%d)", "%1.")
    return formatted:reverse():gsub("^,", "")
end


QBCore.Functions.CreateCallback('am_groupsystemystem:getBankingInformation', function(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local citizenid = xPlayer.PlayerData.citizenid
	    local gang = xPlayer.PlayerData.gang.name

    if not xPlayer then return cb(nil) end
	
    MySQL.Async.fetchAll('SELECT respect FROM gang_respect WHERE gang_id = @gang_id', {
        ['@gang_id'] = gang
    }, function(result)
        local respect = 0  -- Inicializa la variable respect con un valor predeterminado de 0

        if result[1] and result[1].respect then
            respect = result[1].respect  -- Si se encuentra un resultado en la base de datos, asigna ese valor a la variable respect
        end
		
    MySQL.Async.fetchAll('SELECT tiendas FROM gang_respect WHERE gang_id = @gang_id', {
        ['@gang_id'] = gang
    }, function(result)
        local tiendas = 0  -- Inicializa la variable respect con un valor predeterminado de 0

        if result[1] and result[1].tiendas then
            tiendas = result[1].tiendas  -- Si se encuentra un resultado en la base de datos, asigna ese valor a la variable respect
        end

    local banking = {
        ['name'] = xPlayer.PlayerData.gang.name .. ' ',
        ['respeto'] = respect .. ' ',
		['tienda'] = tiendas .. ''
    }



   cb(banking)
    end)
 end)
end)

-----------------------------------------------------------------
-----------------------------------------------------------------


-----------------------------------------------------------------
-----------------------------------------------------------------
    ----- FUNCIONES DE MISIONES DROGAS  -----
-----------------------------------------------------------------
-----------------------------------------------------------------




QBCore.Functions.CreateCallback('am_gangsystem:server:revisaritemscocaina', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("cokebrick")
    if Item ~= nil then
	    if Item.amount >= 15 then
        cb(true)
		elseif Item.amount <= 15 then
		TriggerClientEvent("QBCore:Notify", source, "You don't have at least 15 bricks of cocaine.", "error")
	    end
    else
        cb(false)
    end
end)


-- Cooldown
RegisterServerEvent('am_gangsystem:Server:CooldownMisionCocaine')
AddEventHandler('am_gangsystem:Server:CooldownMisionCocaine', function()
    CooldownMisionCocaine = true
    local timer = 1 * 60 -- Cambiado a 2 minutos en segundos
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            CooldownMisionCocaine = false
        end
    end
end)


QBCore.Functions.CreateCallback("am_gangsystem:CooldownMisionCocaine",function(source, cb)
    if CooldownMisionCocaine then
        cb(true)
    else
        cb(false)
        
    end
end)

RegisterServerEvent('am_gangsystem:server:eliminarladrillosdecoca', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)

	Player.Functions.RemoveItem(Config.itemquitar_misioncocaina, Config.Cantidaditemquitar_misioncocaina)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.itemquitar_misioncocaina], 'remove')

end)


RegisterServerEvent('am_gangsystem:server:darrecompensacocaina', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local randomcash = Config.CantidadRecompensa_MisionCocaina
	Player.Functions.AddItem(Config.FormaRecompensa_MisionCocaina, randomcash)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FormaRecompensa_MisionCocaina], 'add')

end)

-----------------------------------------------------------------
-----------------------------------------------------------------