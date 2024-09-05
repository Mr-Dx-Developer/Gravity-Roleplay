OutfitService = {}

local ActionTypesList = {
    [HEARTBEAT_EVENTS.PRISONER_LOADED] = PRISON_OUTFITS.PRISONER,
    [HEARTBEAT_EVENTS.PRISONER_NEW] = PRISON_OUTFITS.PRISONER,
    [HEARTBEAT_EVENTS.PRISONER_RELEASED] = PRISON_OUTFITS.CITIZEN,
}

NetworkService.EventListener('heartbeat', function(eventType, data)
    local actionType = ActionTypesList[eventType]

    if not actionType then
        return
    end

    if eventType == HEARTBEAT_EVENTS.PRISONER_LOADED then
        SetTimeout(1000, function()
            OutfitService.SetAppearance(actionType)
        end)
    else
        OutfitService.SetAppearance(actionType)
    end
end)


OutfitService.GetOufitByPlayerModel = function()
    local plyPed = PlayerPedId()
    local model = GetEntityArchetypeName(plyPed)
    
    local isMale = 'mp_m_freemode_01' == model
    local gender = isMale and 'Male' or 'Female'
    
    if Bridge.Framework == Framework.QBOX and Bridge.Clothing == Clothing.IAPPEARANCE then
        Bridge.Clothing = Clothing.QB 
        dbg.debugClothing('Server is running QBX-Core with Illenium-appearance, loading qb-clothing configuration.')
    end
    
    if Bridge.Framework == Framework.ESX and Bridge.Clothing == Clothing.IAPPEARANCE then
        Bridge.Clothing = Clothing.ESX
        dbg.debugClothing('Server is running ESX with Illenium-appearance, loading esx-skin configuration.')
    end
    
    local outfit = OUTFITS[Bridge.Clothing]
    
    if not outfit then
        return dbg.debugClothing('Outfit not found')
    end

    dbg.debugClothing('Bridge clothing loaded now: %s', Bridge.Clothing)
    
    local idx = nil
    local outfitState = 'RANDOM_OUTFIT'

    local success, result = pcall(function()
        if not Cache.GetOutfitKVP() then
            local size = outfit and #outfit[gender]
    
            if size and size > 0 then
                return math.random(1, size)
            else
                return 0
            end
        else
            outfitState = 'SAVED_OUTFIT'
            return Cache.GetOutfitKVP()
        end
    end)

    if success then
        idx = result
        dbg.debugClothing('Random outfit index: %s', idx)
    else
        dbg.debugClothing('Error generating random outfit: %s', result)
        idx = 0
    end

    dbg.debugClothing('Loading clothing from: %s', outfitState)
    
    local randomOutfit = nil

    if idx ~= 0 then
        randomOutfit = outfit[gender][idx]
    else
        randomOutfit = outfit[gender]
    end

    if not randomOutfit or randomOutfit == nil then
        randomOutfit = outfit[gender]
        dbg.debugClothing('Loading fallback outfit for client.')
    end
    
    if Bridge.Clothing == Clothing.ESX then
        return randomOutfit.components and randomOutfit.components.skin
    end

    return randomOutfit
end

OutfitService.RestorePlayerOutfit = function()
    if Bridge.Clothing == Clothing.ESX then
        Framework.object.TriggerServerCallback(Config.FrameworkEvents['esx_skin:getPlayerSkin'], function(skin)
            repeat
                Wait(1000)
            until skin ~= nil
    
            TriggerEvent(Config.FrameworkEvents['skinchanger:loadSkin'], skin)
        end)
    elseif Bridge.Framework == Framework.QBOX and Bridge.Clothing == Clothing.IAPPEARANCE then -- QBOX which use Illenium-appearance with qb-clothing compatibility.
        ExecuteCommand('reloadskin')
    elseif Bridge.Clothing == Clothing.QB then
        TriggerServerEvent("qb-clothes:loadPlayerSkin")
        TriggerServerEvent("qb-clothing:loadPlayerSkin")
    elseif Clothing.TGIANN and Bridge.Clothing == Clothing.TGIANN then
        exports[Clothing.TGIANN]:RefreshSkin()
    elseif Clothing.IAPPEARANCE and Bridge.Clothing == Clothing.IAPPEARANCE then
        ExecuteCommand('reloadskin')
    elseif Clothing.AK47_CLOTHING and Bridge.Clothing == Clothing.AK47_CLOTHING then
        ExecuteCommand('reloadskin')
    elseif Clothing.CRM and Bridge.Clothing == Clothing.CRM then
        TriggerEvent("crm-appearance:load-player-skin")
    elseif Clothing.ONEX and Bridge.Clothing == Clothing.ONEX then
        TriggerEvent('onex-creation:syncClothes')
    else
        dbg.critical('Clothing resource not found: %s not going to restore player outfit!', Bridge.Clothing)
    end

    if Cache.GetOutfitKVP() then
        Cache.DeleteOutfitKVP()
    end
end

OutfitService.SetAppearance = function(actionType)
    local plyPed = PlayerPedId()
    local outfit = nil

    if actionType == PRISON_OUTFITS.PRISONER then
        outfit = OutfitService.GetOufitByPlayerModel()
    end

    dbg.debugClothing('Setting outfit via resource: %s >> with type: %s (%s)', Bridge.Clothing, actionType, Bridge.Framework)
    
    if Clothing.CODEM and isResourceLoaded(Clothing.CODEM) and actionType == PRISON_OUTFITS.CITIZEN and Config.Outfits.RestorePlayerOutfitOnRelease then
        return TriggerEvent("codem-appearance:reloadSkin")
    end
    
    if Clothing.AK47_CLOTHING and isResourceLoaded(Clothing.AK47_CLOTHING) and actionType == PRISON_OUTFITS.CITIZEN and Config.Outfits.RestorePlayerOutfitOnRelease then
        return ExecuteCommand('reloadskin')
    end
    
    if Clothing.CRM and isResourceLoaded(Clothing.CRM) and actionType == PRISON_OUTFITS.CITIZEN and Config.Outfits.RestorePlayerOutfitOnRelease then
        return TriggerEvent("crm-appearance:load-player-skin")
    end

    if Clothing.TGIANN and isResourceLoaded(Clothing.TGIANN) and actionType == PRISON_OUTFITS.CITIZEN and Config.Outfits.RestorePlayerOutfitOnRelease then
        return exports[Clothing.TGIANN]:RefreshSkin()
    end

    if Clothing.IAPPEARANCE and isResourceLoaded(Clothing.IAPPEARANCE) and actionType == PRISON_OUTFITS.CITIZEN and Config.Outfits.RestorePlayerOutfitOnRelease then
        return ExecuteCommand('reloadskin')
    end

    if Clothing.ONEX and isResourceLoaded(Clothing.ONEX) and actionType == PRISON_OUTFITS.CITIZEN and Config.Outfits.RestorePlayerOutfitOnRelease then
        return TriggerEvent('onex-creation:syncClothes')
    end

    dbg.debugClothing('Setting player outfit via resource %s', Bridge.Clothing)

    if Bridge.Clothing == Clothing.CRM or Bridge.Clothing == 'crm-appearance' then
        exports['crm-appearance']:crm_set_ped_clothing(plyPed, outfit.crm_clothing)
        exports['crm-appearance']:crm_set_ped_accessories(plyPed, outfit.crm_accessories)
        
        return
    end

    if Bridge.Clothing == Clothing.ESX then
        if not outfit and Config.Outfits.RestorePlayerOutfitOnRelease then
            return OutfitService.RestorePlayerOutfit()
        end

        local currentOutfit = outfit and outfit.components and outfit.components.skin

        TriggerEvent('skinchanger:getSkin', function(skin)
            if not currentOutfit then
                currentOutfit = outfit
            end

            TriggerEvent('skinchanger:loadClothes', skin, currentOutfit)
        end)
    elseif Bridge.Clothing == Clothing.ONEX then
        if not outfit then
            return dbg.critical('Outfit not found when using onex-creation clothing.')
        end

        TriggerEvent('onex-creation:client:loadCustomOutfit', outfit)
    elseif Bridge.Clothing == Clothing.QB then
        if not outfit and Config.Outfits.RestorePlayerOutfitOnRelease then
            return OutfitService.RestorePlayerOutfit()
        end

        local skin = {
            outfitData = outfit.components
        }

        SetTimeout(200, function()
            TriggerEvent(Config.FrameworkEvents['qb-clothing:client:loadOutfit'], skin)
        end)
    elseif Bridge.Clothing == Clothing.TGIANN then
        if not outfit and Config.Outfits.RestorePlayerOutfitOnRelease then
            return OutfitService.RestorePlayerOutfit()
        end

        local currentOutfit = outfit and outfit.components and outfit.components.skin

        if not currentOutfit then
            currentOutfit = outfit
        end

        TriggerEvent("tgiann-clothing:changeScriptClothe", currentOutfit)
    elseif Bridge.Clothing == Clothing.FAPPEARANCE then
        exports[Clothing.FAPPEARANCE]:setPedAppearance(plyPed, outfit)
    elseif Bridge.Clothing == Clothing.IAPPEARANCE then
        local pedModel = GetEntityModel(plyPed)
        local pedModelReadable = GetEntityArchetypeName(plyPed)

        local allowedModels = {
            [`mp_m_freemode_01`] = true,
            [`mp_f_freemode_01`] = true,
        }

        if not allowedModels[pedModel] then
            return dbg.info('Player model not allowed for Illenium-appearance to apply outfit player model detected: (%s) supported: (mp_m_freemode_01, mp_f_freemode_01)', pedModelReadable)
        end

        pcall(function()
            exports[Clothing.IAPPEARANCE]:setPedAppearance(plyPed, outfit)
        end)
    else
        dbg.critical('Clothing resource not found: %s not going to set player outfit!', Bridge.Clothing)
    end
end
