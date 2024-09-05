

RegisterNetEvent("qb-bodycam:action",function(k, v)
    print(k)
    if not k then return end if not v then return end
    if (k == "bodycam") then
        SendNUIMessage({
            action = "bodycam",
            name = v.name,
            grade = v.grade,
            desc = QB.recordDesc,
            header = QB.recordName,
            webhook = QB.webhook
        })
    elseif (k == "records") then
        SendNUIMessage({
            action = "records",
            infos = v,
            header = QB.Header,
            footer = QB.Footer,
        })
        SetNuiFocus(true,true)
    end
end)


RegisterNUICallback("getVideoURL",function(data,cb)
    TriggerServerEvent("sendFileData", data.videoURL, data.videoName, data.videoDesc)
    cb("ok")
end)


RegisterNUICallback("escapeFromNUI",function(data,cb)
    SetNuiFocus(false,false)
end)




-- Videos = {}
-- infos = {}

-- local function startSettings()

-- end

-- RegisterNetEvent("qb-client:updatePlayerInfos",function(array)
--     infos = array
-- end)
-- RegisterNetEvent("qb-client:updateVideos",function(array)
--     Videos = array
--     print("kanka update video")
-- end)

-- RegisterNetEvent("useBodycam",function()
--     SendNUIMessage({
--         action = "bodycam",
--         name = infos.name,
--         grade = infos.grade,
--         desc = QB.recordDesc,
--         header = QB.recordName,
--         webhook = QB.webhook
--     })
-- end)

-- local function fetchInfo()
--     TriggerServerEvent("getPlayerInfos")
--     TriggerServerEvent("sendToClient")
--     CreateThread(function()
--         for i,j in pairs(QB.Commands) do
--             print("command")
--             RegisterCommand(QB.Commands[i].command, function(source,args)
--                 if QB.Commands[i].action == "bodycam" then
--                     SendNUIMessage({
--                         action = "bodycam",
--                         name = infos.name,
--                         grade = infos.grade,
--                         desc = QB.recordDesc,
--                         header = QB.recordName,
--                         webhook = QB.webhook
--                     })
--                 elseif QB.Commands[i].action == "recordmenu" then
--                     SendNUIMessage({
--                         action = "records",
--                         infos = Videos,
--                         header = QB.Header,
--                         footer = QB.Footer,
--                     })
--                     print("records")
--                     SetNuiFocus(true,true)
--                 elseif QB.Commands[i].action == "resume" then
--                     SendNUIMessage("resume")
--                 elseif QB.Commands[i].action == "pause" then
--                     SendNUIMessage("pause")
--                 end
--             end)
--         end
--     end)
-- end

-- RegisterCommand("ld",function()
--     TriggerEvent(QB.playerLoaded)
-- end)

-- RegisterNetEvent(QB.playerLoaded)
-- AddEventHandler(QB.playerLoaded,function()
--     fetchInfo()
-- end)






