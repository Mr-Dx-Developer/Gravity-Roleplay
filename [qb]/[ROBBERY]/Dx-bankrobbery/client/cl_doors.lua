currentBank = nil

--- Threads

CreateThread(function()
    for bank, value in pairs(Shared.Banks) do
        if type(value.coords) == 'table' then
            lib.zones.poly({
                points = value.coords,
                thickness = value.size,
                debug = false,
                onEnter = function(self)
                    currentBank = bank
    
                    if not Shared.Banks[bank].policeClose and Shared.Banks[bank].hacked then
                        local object = GetClosestObjectOfType(Shared.Banks[bank].vaultDoor.coords.x, Shared.Banks[bank].vaultDoor.coords.y, Shared.Banks[bank].vaultDoor.coords.z, 5.0, Shared.Banks[bank].vaultDoor.object, false, false, false)
                        
                        if object ~= 0 then
                            SetEntityHeading(object, Shared.Banks[bank].vaultDoor.open)
                            FreezeEntityPosition(object, true)
                        end
                    else
                        local object = GetClosestObjectOfType(Shared.Banks[bank].vaultDoor.coords.x, Shared.Banks[bank].vaultDoor.coords.y, Shared.Banks[bank].vaultDoor.coords.z, 5.0, Shared.Banks[bank].vaultDoor.object, false, false, false)
                        
                        if object ~= 0 then
                            SetEntityHeading(object, Shared.Banks[bank].vaultDoor.closed)
                            FreezeEntityPosition(object, true)
                        end
                    end
                end,
                onExit = function(self)
                    currentBank = nil
                end
            })
        else
            lib.zones.sphere({
                coords = value.coords,
                radius = value.size,
                debug = false,
                onEnter = function(self)
                    currentBank = bank
    
                    if not Shared.Banks[bank].policeClose and Shared.Banks[bank].hacked then
                        local object = GetClosestObjectOfType(Shared.Banks[bank].vaultDoor.coords.x, Shared.Banks[bank].vaultDoor.coords.y, Shared.Banks[bank].vaultDoor.coords.z, 5.0, Shared.Banks[bank].vaultDoor.object, false, false, false)
                        
                        if object ~= 0 then
                            SetEntityHeading(object, Shared.Banks[bank].vaultDoor.open)
                            FreezeEntityPosition(object, true)
                        end
                    else
                        local object = GetClosestObjectOfType(Shared.Banks[bank].vaultDoor.coords.x, Shared.Banks[bank].vaultDoor.coords.y, Shared.Banks[bank].vaultDoor.coords.z, 5.0, Shared.Banks[bank].vaultDoor.object, false, false, false)
                        
                        if object ~= 0 then
                            SetEntityHeading(object, Shared.Banks[bank].vaultDoor.closed)
                            FreezeEntityPosition(object, true)
                        end
                    end
                end,
                onExit = function(self)
                    currentBank = nil
                end
            })
        end
    end
    
end)
