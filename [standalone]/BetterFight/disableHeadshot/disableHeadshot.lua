CreateThread(function()
    while Config.RemoveHeadshots do
        Wait(2000)
        SetPedSuffersCriticalHits(globalPed, false)
    end
end)