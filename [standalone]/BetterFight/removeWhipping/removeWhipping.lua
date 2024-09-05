CreateThread(function()
    while(Config.RemovePistolWhipping)do
            if globalIsPedArmed then
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
            else
                Wait(200)
            end
        Wait(4)
    end
end)