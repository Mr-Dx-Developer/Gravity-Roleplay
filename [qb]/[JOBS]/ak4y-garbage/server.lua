if AK4Y.Framework == "qb" then
    if AK4Y.CustomFramework then 
		QBCore = exports[AK4Y.CustomExport]:GetCoreObject()
	else
        QBCore = exports['qb-core']:GetCoreObject()
	end
elseif AK4Y.Framework == "oldqb" then 
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
end
local levels = {}

QBCore.Functions.CreateCallback('ak4y-garbage:GetPlayerDetails', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenId = Player.PlayerData.citizenid
    local result = ExecuteSql("SELECT * FROM ak4y_garbage WHERE citizenid = '"..citizenId.."'")
    local identifier = GetPlayerIdentifiers(src)[1]
    local steamid = tonumber(identifier:gsub("steam:",""), 16)
    local data = {}
    if result[1] == nil then
        ExecuteSql("INSERT INTO ak4y_garbage SET citizenid = '"..citizenId.."', currentXP = '0', Tasks = '"..json.encode(AK4Y.Tasks).."', MoneyResetTime = '"..os.time() + (AK4Y.MoneyResetTime * 60).."'")
        data = {
            name = Player.PlayerData.charinfo["firstname"] .. " " .. Player.PlayerData.charinfo["lastname"],
            money = "$" .. Player.PlayerData.money["bank"],
            steamid = steamid,
            tasks = json.encode(AK4Y.Tasks),
            apiKey = SteamApiKey,
            routes = AK4Y.JobRoutes,
            currentXP = 0,
            Level = 0,
            EarnedMoney = 0,
            DrawedMoney = 0,
            completedtask = 0,
        }
        levels[src] = 0
    else
        if result[1].TaskResetTime < os.time() then
            ExecuteSql("UPDATE ak4y_garbage SET tasks = '"..json.encode(AK4Y.Tasks).."', TaskResetTime = '"..os.time() + (AK4Y.MoneyResetTime * 60).."' WHERE citizenid = '"..citizenId.."'")
            result = ExecuteSql("SELECT * FROM ak4y_garbage WHERE citizenid = '"..citizenId.."'")
        end
        local level = GetLevel(result[1].currentXP)
        levels[src] = level
        local exp = result[1].currentXP - (level * AK4Y.NeededXP)
        local completedtask = 0
        for k,v in pairs(json.decode(result[1].Tasks)) do
            if v.requiredCount <= v.hasCount then
                completedtask = completedtask + 1
            end
        end
        data = {
            name = Player.PlayerData.charinfo["firstname"] .. " " .. Player.PlayerData.charinfo["lastname"],
            money = "$" .. Player.PlayerData.money["bank"],
            steamid = steamid,
            apiKey = SteamApiKey,
            tasks = result[1].Tasks,
            routes = AK4Y.JobRoutes,
            currentXP = exp,
            Level = GetLevel(result[1].currentXP),
            EarnedMoney = result[1].EarnedMoney,
            DrawedMoney = result[1].DrawedMoney,
            completedtask = completedtask,
        }
    end
    cb(data)
end)

RegisterNetEvent('ak4y-garbage:payment', function(payment)
    local src = source
    local price = payment
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenId = Player.PlayerData.citizenid
    ExecuteSql("UPDATE ak4y_garbage SET EarnedMoney = EarnedMoney + '"..price.."' WHERE citizenid = '"..citizenId.."'")
end)

QBCore.Functions.CreateCallback('ak4y-garbage:Withdraw', function(source, cb, payment)
    local src = source
    local price = tonumber(payment)
    if price == 0 then
        TriggerClientEvent('ak4y-garbage:notify', src, "error", AK4Y.Languages["0$_withdraw"])
        cb(false)
        return
    end
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenId = Player.PlayerData.citizenid
    local result = ExecuteSql("SELECT * FROM ak4y_garbage WHERE citizenid = '"..citizenId.."'")
    if price <= tonumber(result[1].EarnedMoney) then
        if price <= AK4Y.DailyLimit then
            if result[1].DrawedMoney + price > AK4Y.DailyLimit then
                if result[1].MoneyResetTime < os.time() then
                    ExecuteSql("UPDATE ak4y_garbage SET MoneyResetTime = '"..os.time() + (AK4Y.MoneyResetTime * 60).."', DrawedMoney = '"..price.."', EarnedMoney = EarnedMoney - '"..price.."' WHERE citizenid = '"..citizenId.."'")
                    Player.Functions.AddMoney('cash', price, "Garbage Job")
                    TriggerClientEvent('ak4y-garbage:notify', src, "success", AK4Y.Languages["withdrawed"])
                    cb(payment)
                else
                    TriggerClientEvent('ak4y-garbage:notify', src, "error", AK4Y.Languages["max_withdraw"] .. (AK4Y.DailyLimit - result[1].DrawedMoney))
                    cb(false)
                end
            else
                ExecuteSql("UPDATE ak4y_garbage SET DrawedMoney = DrawedMoney + '"..price.."', EarnedMoney = EarnedMoney - '"..price.."' WHERE citizenid = '"..citizenId.."'")
                Player.Functions.AddMoney('cash', price, "Garbage Job")
                TriggerClientEvent('ak4y-garbage:notify', src, "success", AK4Y.Languages["withdrawed"])
                cb(payment)
            end
        else
            cb(false)
            TriggerClientEvent('ak4y-garbage:notify', src, "error", AK4Y.Languages["max_withdraw_limit"])
        end
    else
        TriggerClientEvent('ak4y-garbage:notify', src, "error", AK4Y.Languages["no_money"])
        cb(false)
    end
end)

RegisterNetEvent('ak4y-garbage:RandomItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = AK4Y.RandomItems[math.random(1, #AK4Y.RandomItems)]
    Player.Functions.AddItem(item, 1)
end)

function GetLevel(xp)
    local currentXP = xp
    local neededEXP = AK4Y.NeededXP
    local currentLevel = 0
    if (currentXP >= neededEXP) then
        currentLevel = currentLevel + math.floor(currentXP / neededEXP);
        currentXP = currentXP % neededEXP;
    end
    return currentLevel
end

RegisterNetEvent('ak4y-garbage:AddTask', function(taskid, amount)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local citizenId = xPlayer.PlayerData.citizenid
    local result = ExecuteSql("SELECT tasks FROM ak4y_garbage WHERE citizenid = '"..citizenId.."'")
    if result[1] then 
        local kayit = true
        local resultak4y = json.decode(result[1].tasks)
        for k, v in pairs(resultak4y) do 
            if tonumber(v.id) == tonumber(taskid) then 
                if v.taken or v.hasCount >= v.requiredCount then 
                    kayit = false
                end
                v.hasCount = v.hasCount + tonumber(amount)
                if v.hasCount > v.requiredCount then 
                    v.hasCount = v.requiredCount
                end
                break
            end
        end
        if kayit then 
            ExecuteSql("UPDATE ak4y_garbage SET tasks = '"..json.encode(resultak4y).."' WHERE citizenid = '"..citizenId.."'")
        end
    end
end)

RegisterNetEvent('ak4y-garbage:CollectReward', function(data)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local citizenId = xPlayer.PlayerData.citizenid
    local currentTaskId = tonumber(data.id)
    local result = ExecuteSql("SELECT tasks FROM ak4y_garbage WHERE citizenid = '"..citizenId.."'")
    if result[1] then 
        local tasks = json.decode(result[1].tasks)
        for k, v in pairs(tasks) do 
            if currentTaskId == v.id then 
                if v.hasCount >= v.requiredCount and not v.Collected then 
                    v.Collected = true
                    local addEXP = v.Reward.Exp
                    local AddMoney = v.Reward.Price
                    xPlayer.Functions.AddMoney('bank', AddMoney, "Garbage Job")
                    ExecuteSql("UPDATE ak4y_garbage SET tasks = '"..json.encode(tasks).."', currentXP = currentXP + '"..addEXP.."' WHERE citizenid = '"..citizenId.."'")
                    TriggerClientEvent('frameworknotify-cl', _source, AK4Y.Languages["task_successfully"], "success")
                    TriggerClientEvent('task-finish', _source)
                end
                break
            end
        end
    end
end)

function ExecuteSql(query)
    local IsBusy = true
    local result = nil
    if AK4Y.sql == "oxmysql" then
        if MySQL == nil then
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.query(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif AK4Y.sql == "ghmattimysql" then
        exports.ghmattimysql:execute(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    elseif AK4Y.sql == "mysql-async" then   
        MySQL.Async.fetchAll(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end