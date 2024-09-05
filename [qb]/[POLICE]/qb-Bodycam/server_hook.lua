
if QB.Framework == "qb" then
    QBCore = exports["qb-core"]:GetCoreObject()
else
    ESX = exports["es_extended"]:getSharedObject()
end


GetPlayersFw = function()
    if QB.Framework == "qb" then
        return QBCore.Functions.GetPlayers()
    else
        return ESX.GetPlayers()
    end
end

GetPlayer = function(player)
    if QB.Framework == "qb" then
        return QBCore.Functions.GetPlayer(player)
    else
        return ESX.GetPlayerFromId(player)
    end
end




GetJob = function(player)
    if QB.Framework == "qb" then
        return player.PlayerData.job
    else
        return player.getJob()
    end
end

GetGrade = function(player)
    if QB.Framework == "qb" then
        return  player.PlayerData.job.grade.name
    else
        return player.getJob().grade_name
    end
end

GetSource = function(player)
    if QB.Framework == "qb" then
        return player.PlayerData.source
    else
        return player.source
    end
end

GetPlayerRName = function(player)
    local xPlayer = GetPlayer(player)
    if QB.Framework == "qb" then
        return xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname
    else
        return xPlayer.getName()
    end
end

Notify = function (src,text)
    if QB.Framework == "qb" then
        return TriggerClientEvent("QBCore:Notify", src, text)
    else
        local xPlayer = GetPlayer(src)
        return xPlayer.showNotification(text)
    end
end