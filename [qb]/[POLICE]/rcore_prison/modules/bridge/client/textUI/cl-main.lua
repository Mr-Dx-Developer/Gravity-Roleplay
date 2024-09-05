local TRAVERSE_MAP_POSITION = {
    ['right'] = 'right-center',
    ['left'] = 'left-center',
    ['top'] = 'top-center'
}

TextService = {}

CreateThread(function()
    TextService.Hide()
end)

NetworkService.EventListener('heartbeat', function(eventType, data)
    if eventType ~= 'PRISONER_RELEASED' then
        return
    end

    TextService.Hide()
end)

TextService.Render = function(jailTime)
    if Bridge.TextUI == TextUI.NONE then
        Text.Show(jailTime) -- Using rcore_prison's
    elseif Bridge.TextUI == TextUI.OX then
        if not lib then
            Text.Show(jailTime)
            return dbg.debug('TextService.Render: ox_lib is not hooked with rcore_prison, loading prison default text UI.')
        end 
    
        lib.showTextUI(jailTime, {
            position = Config.Text.Position:lower(),
        })
    elseif Bridge.TextUI == TextUI.QBCORE then
        exports['qb-core']:DrawText(jailTime, 'left')
    elseif Bridge.TextUI == TextUI.ESX then
        exports['esx_textui']:TextUI(jailTime)
    end
end

TextService.Hide = function()
    if Bridge.TextUI == TextUI.NONE then
        Text.Hide()
    elseif Bridge.TextUI == TextUI.OX then
        if not lib then
            Text.Hide()
            return dbg.debug('TextService.Render: ox_lib is not hooked with rcore_prison, loading prison default text UI.')
        end 
    
        lib.hideTextUI()
    elseif Bridge.TextUI == TextUI.QBCORE then
        exports['qb-core']:HideText()
    elseif Bridge.TextUI == TextUI.ESX then
        exports['esx_textui']:HideUI()
    end
end
