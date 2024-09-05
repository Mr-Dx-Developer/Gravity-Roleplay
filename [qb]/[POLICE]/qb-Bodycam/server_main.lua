Videos = {}

CreateThread(function()
    local file = json.decode(LoadResourceFile(GetCurrentResourceName(), "videopatch.json"))
    if file then
        Videos = file
    end
end)

local function getItem(source)
    local src = source
    if src == 0 then return end
    local player = GetPlayer(src)
    if not player then return end
    if QB.Framework == "qb" then
        local item = player.Functions.GetItemByName('bodycam')
        if not item then return end
        return true
    else
        local item = player.getInventoryItem("bodycam")
        if not item then return end
        return true
    end
    return false
end


RegisterCommand("records",function(playerId)
    if playerId then
        if not Videos then
            Videos = {}
        end
        local player = GetPlayer(playerId)
        if not player then return end
        local job = GetJob(player).name
        local jobCheck = false
        for _, allowedJob in ipairs(QB.allowedJob) do
            if job == allowedJob then
                jobCheck = true
                break
            end
        end
        if not jobCheck then
            Notify(playerId, "You are not a police or sheriff")
            return
        end
        TriggerClientEvent("qb-bodycam:action",playerId, "records", Videos)
    end
end)

QBCore.Functions.CreateUseableItem("bodycam", function(source, playerId)
    local player = QBCore.Functions.GetPlayer(source)

    if player then
        local job = player.PlayerData.job.name
        local jobCheck = false
        local allowedJobs = {"police", "sheriff"}  -- רשימת המשרות המותרות לשחקן להיות לו בכדי להשתמש ב-bodycam

        for _, allowedJob in pairs(allowedJobs) do
            if job == allowedJob then
                jobCheck = true
                break
            end
        end

        if not jobCheck then
            TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "You are not a police or sheriff")
            return
        end

        local Player = QBCore.Functions.GetPlayer(source)
        local firstname = Player.PlayerData.charinfo.firstname
        local lastname = Player.PlayerData.charinfo.lastname
        local info = {
            name = firstname .. " " .. lastname,
            grade = player.PlayerData.job.grade
        }
        local itemCheck = player.Functions.GetItemByName("bodycam")

        if not itemCheck then
            TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "You don't have a bodycam.")
            return
        end

        TriggerClientEvent("qb-bodycam:action", source, "bodycam", info)
    end
end)


RegisterServerEvent("sendFileData")
AddEventHandler("sendFileData", function(videoURL, recordName, videoDesc)
    local src = source
    if src == -1 or src == 0 then return end
    if videoURL ~= nil then
        local newVideo = {
            date = os.date("%Y-%m-%d"),
            hms = os.date("%H:%M:%S"),
            recordName = recordName,
            recordDetails = videoDesc,
            recorder = GetPlayerRName(src),
            videoLink = videoURL
        }
        table.insert(Videos, newVideo)
    end
    SaveResourceFile(GetCurrentResourceName(), "/videopatch.json", json.encode(Videos), -1)
end)




-- RegisterServerEvent("getPlayerInfos")
-- AddEventHandler("getPlayerInfos", function()
--     local player = GetPlayer(source)
--     infos = {}
--     if player then
--         infos = {
--             name = GetPlayerRName(source),
--             job = GetJob(player).grade.label
--         }
--         TriggerClientEvent("qb-client:updatePlayerInfos", source, infos)
--     end
-- end)


-- RegisterServerEvent("sendToClient")
-- AddEventHandler("sendToClient", function(_)
--     ToPolices()
-- end)



-- ToPolices = function()
--     local players = GetPlayersFw()
--     for i = 1, #players do
--         local player = GetPlayer(players[i])
--         print(GetJob(player).name)
--         if GetJob(player).name == "police" then
--             TriggerClientEvent("qb-client:updateVideos", GetSource(player), Videos)
--         end
--     end
-- end

