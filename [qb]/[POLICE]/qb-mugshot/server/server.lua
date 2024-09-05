local QBCore = exports['qb-core']:GetCoreObject()

local MugShots = {}

RegisterNetEvent('qb-mugshot:server:triggerSuspect')

RegisterNetEvent('qb-mugshot:Server:triggerSuspect', function(suspect)
    local src = source
    TriggerClientEvent('qb-mugshot:client:trigger', suspect, suspect)
    exports['ws-log']:Log('mugshot', src, 'took Mugshot of %s', exports['ws-log']:FetchFormatedIds(suspect)); -- cz po
end)

RegisterNetEvent('qb-mugshot:server:MDTupload', function(citizenid, MugShotURLs)
    MugShots[citizenid] = MugShotURLs
    if Config.CQCMDT then
        TriggerEvent('cqc-mdt:server:updateMugShotForCitizen',citizenid, MugShotURLs)
    end
end)

--Allows external resources to pull most recent mugshot urls for a given citizen id
QBCore.Functions.CreateCallback(function(source, cb, citizenid) 
    cb(MugShots[citizenid])
end)