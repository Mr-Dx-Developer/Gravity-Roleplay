Shared.Ready = true -- do not touch this

Shared.Resource = {
    core = 'qb-core',
    inventory = 'ox_inventory',
    target = 'ox_target',
}

if GetResourceState('qb-core') == 'started' then
    Shared.Core = 'qb'
    Shared.Resource.core = 'qb-core'
    QBCore = exports[Shared.Resource.core]:GetCoreObject()
elseif GetResourceState('qbx_core') == 'started' then
    Shared.Core = 'qbox'
    Shared.Resource.core = 'qbx_core'
elseif GetResourceState('es_extended') == 'started' then
    Shared.Core = 'esx'
    Shared.Resource.core = 'es_extended'
    export, ESX = pcall(function() return exports[Shared.Resource.core]:getSharedObject() end)
    if not export then
        while not ESX do
            TriggerEvent("esx:getSharedObject", function(obj)
                ESX = obj
            end)
            Wait(500)
        end
    end
else
    error('No core found', 0)
    Shared.Core = false
    Shared.Resource.core = false
    Shared.Ready = false
end

if GetResourceState('ox_target') == 'started' then
    Shared.Target = 'ox'
    Shared.Resource.target = 'ox_target'
elseif GetResourceState('qb-target') == 'started' then
    Shared.Target = 'qb'
    Shared.Resource.target = 'qb-target'
else
    Shared.Target = false
    Shared.Resource.target = false
    warn('No target system found')
end

-- don't change if you dont know what you are doing
if GetResourceState('ox_inventory') == 'started' then
    Shared.Inventory = 'ox'
    Shared.Resource.inventory = 'ox_inventory'
elseif GetResourceState('mm_inventory') == 'started' then
    Shared.Inventory = 'qb'
    Shared.Resource.inventory = 'mm_inventory'
else
    Shared.Inventory = false
    Shared.Resource.inventory = false
    Shared.Ready = false
    error('No inventory found', 0)
end

lib.locale()