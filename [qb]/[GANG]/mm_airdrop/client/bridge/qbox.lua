if Shared.Core == 'qbox' then
    Airdrop.isLoggedIn = LocalPlayer.state.isLoggedIn

    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        Airdrop.CurrentDrops = lib.callback.await('mm_airdrop:server:getdrops', false)
        Airdrop:SetupDrops()
    end)

    AddStateBagChangeHandler('isLoggedIn', nil, function(bagName, key, value)
        Airdrop.isLoggedIn = value
    end)
end