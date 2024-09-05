CreateThread(function()
	while Config.RollPrevention do
			if(not globalIsPedInAnyVehicle)then
				Wait(4)
				if globalIsPlayerFreeAiming then
					DisableControlAction(0, 22, 1) -- 22 is the INPUT_JUMP key
				else
					Wait(100)
				end
			else
			Wait(500)
		end
	end
end)