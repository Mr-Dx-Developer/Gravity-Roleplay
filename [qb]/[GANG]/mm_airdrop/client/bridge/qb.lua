if Shared.Core == 'qb' then
    Airdrop.isLoggedIn = LocalPlayer.state.isLoggedIn

    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        Airdrop.CurrentDrops = lib.callback.await('mm_airdrop:server:getdrops', false)
        Airdrop:SetupDrops()
    end)

    AddStateBagChangeHandler('isLoggedIn', nil, function(bagName, key, value)
        Airdrop.isLoggedIn = value
    end)
end

if Shared.Target == 'qb' then
    function Airdrop:CreateQBTarget(crate)
        exports[Shared.Resource.target]:AddTargetEntity(crate.object, {
            options = {
                {
                    icon = "fas fa-box-circle-check",
                    label = locale("open_package"),
                    action = function()
                        self:OpenPackage(crate)
                    end,
                    canInteract = function()
                        return self.insideZone
                    end,
                },
            },
            distance = 3.0
        })
    end
end