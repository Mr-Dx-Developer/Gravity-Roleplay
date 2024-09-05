NetworkService.EventListener('heartbeat', function(eventType, data)
    local plyPed = PlayerPedId()

    if Bridge.Inventory == Inventories.QS then
        -- ?? Should be handled by inventory, but for some unk reasons its not.
        GiveWeaponToPed(plyPed, `WEAPON_UNARMED`, 0, false, true)
        SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(plyPed, true)
    elseif Bridge.Inventory == Inventories.ESX then
        GiveWeaponToPed(plyPed, `WEAPON_UNARMED`, 0, false, true)
        SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(plyPed, true)
    elseif Bridge.Framework == Framework.Standalone then
        GiveWeaponToPed(plyPed, `WEAPON_UNARMED`, 0, false, true)
        SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(plyPed, true)
    end
end)