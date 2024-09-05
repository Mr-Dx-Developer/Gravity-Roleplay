CreateThread(function()
    if isBridgeLoaded('Framework', Framework.Standalone) then
        CreateThread(function()
            while true do
                if NetworkIsPlayerActive(PlayerId()) then
                    Wait(500)
                    TriggerServerEvent('rcore_prison:bridge:standalonePlayerActivated')
                    break
                end
                Wait(0)
            end
        end)
    

        function Inventory.HandleInventoryOpenState(state)
            local ply = LocalPlayer
        
            if not ply then
                return
            end
        end


        function Framework.showHelpNotification(text)
            DisplayHelpTextThisFrame(text, false)
            BeginTextCommandDisplayHelp(text)
            EndTextCommandDisplayHelp(0, false, false, -1)
        end
    
        function Framework.sendNotification(message, type)
            TriggerEvent('chat:addMessage', {
                multiline = true,
                args = { message }
            })
        end
    end    
end)