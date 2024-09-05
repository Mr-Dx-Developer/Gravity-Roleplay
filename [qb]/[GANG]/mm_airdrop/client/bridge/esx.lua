if Shared.Core == 'esx' then
    Airdrop.isLoggedIn = ESX.IsPlayerLoaded()

    RegisterNetEvent('esx:playerLoaded',function()
        Airdrop.isLoggedIn = true
        Airdrop.CurrentDrops = lib.callback.await('mm_airdrop:server:getdrops', false)
        Airdrop:SetupDrops()
    end)
end