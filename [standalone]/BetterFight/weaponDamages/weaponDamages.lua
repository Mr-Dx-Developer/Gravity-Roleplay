CreateThread(function()
    if(Config.UseCustomWeaponDamages)then
        for _, v in pairs(Config.Weapons) do
            Wait(50)
            SetWeaponDamageModifier(v.hash, v.damageMultiplier) 
        end
    end
end)