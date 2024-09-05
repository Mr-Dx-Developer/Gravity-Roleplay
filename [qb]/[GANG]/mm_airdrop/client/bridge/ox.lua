if Shared.Core == 'ox' then
    local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
	local import = LoadResourceFile('ox_core', file)
	local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
	chunk()

	if player then
		Airdrop.isLoggedIn = true
	end
    
    AddEventHandler('ox:playerLoaded', function()
        Airdrop.CurrentDrops = lib.callback.await('mm_airdrop:server:getdrops', false)
        Airdrop:SetupDrops()
    end)
end

if Shared.Target == 'ox' then
    function Airdrop:CreateOxTarget(crate)
        exports[Shared.Resource.target]:addLocalEntity(crate.object, {
            name = 'open_package',
            distance = 1.5,
            label = locale("open_package"),
            icon = 'box-circle-check',
            canInteract = function()
                return self.insideZone
            end,
            onSelect = function()
                self:OpenPackage(crate)
            end
        })
    end
end