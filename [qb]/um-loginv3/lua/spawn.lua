local LoadingStateNui = false
AddEventHandler("playerSpawned", function ()
    if not LoadingStateNui then
        ShutdownLoadingScreen()
        ShutdownLoadingScreenNui()
        LoadingStateNui = true
    end
end)