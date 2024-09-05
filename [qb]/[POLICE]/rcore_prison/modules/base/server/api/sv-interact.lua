CreateThread(function()
    if Config.COMS.Enable then
        SH.data.interaction[#SH.data.interaction + 1] = Config.COMS.StartLocations
    end
end)