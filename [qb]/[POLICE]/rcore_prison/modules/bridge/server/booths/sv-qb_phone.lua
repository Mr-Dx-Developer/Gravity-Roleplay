CreateThread(function()
    if (isBridgeLoaded('Phone', Phones.QB_PHONE)) then
        function EndCallSession(boothPlayerId, targetPlayerId, callId)
            if targetPlayerId and boothPlayerId then
                TriggerClientEvent('qb-phone:client:CancelCall', targetPlayerId, callId)
                dbg.debug('Booths: -> EndCallSession: %s (%s) ended call with %s (%s)', boothPlayerId, GetPlayerName(boothPlayerId), targetPlayerId, GetPlayerName(targetPlayerId))
            elseif boothPlayerId then
                dbg.debug('Booths: -> EndCallSession: %s (%s) ended call with no target', boothPlayerId, GetPlayerName(boothPlayerId))
            end

            StartClient(boothPlayerId, 'endCall', callId)
        end

        function StartCallSession(boothPlayerId, targetPlayerId, boothNumber, callId)
            dbg.debug('Booths: -> StartCallSession: %s (%s) started call with %s (%s)', boothPlayerId, GetPlayerName(boothPlayerId), targetPlayerId, GetPlayerName(targetPlayerId))

            TriggerClientEvent('qb-phone:client:GetCalled', targetPlayerId, boothNumber, callId, true)
            TriggerClientEvent('qb-phone:client:AnswerCall', targetPlayerId)

            StartClient(boothPlayerId, 'startCall', callId)
        end

        RegisterNetEvent('qb-phone:server:CancelCall', function(ContactData)
            local targetNumber = tonumber(ContactData.TargetData.number)
            local booth = BoothService.GetBooth(targetNumber)
        
            if not booth then
                return
            end

            local boothCallData = booth.callData

            if not boothCallData then
                return
            end

            local boothPlayerId = boothCallData.initiatorPlayerId
            local targetPlayerId = boothCallData.targetPlayerId
            local callId = boothCallData.callId

            EndCallSession(boothPlayerId, targetPlayerId, callId)
        end)
        
        RegisterNetEvent('qb-phone:server:CallContact', function(callData, CallId, AnonymousCall)
            if not callData then
                return
            end
        
            local playerId = source
            local targetNumber = tonumber(callData.number)
        
            if not targetNumber then
                return
            end
        
            local booth = BoothService.GetBooth(targetNumber)
        
            if not booth then
                return
            end
        
            local state, statusCode, boothPlayerId = BoothService.CanCall(targetNumber)

            if state and boothPlayerId then
                booth.state = CALL_ENUMS.IN_CALL
                booth.callData = {
                    callId = CallId,
                    targetPlayerId = playerId,
                    initiatorPlayerId = boothPlayerId
                }

                StartCallSession(boothPlayerId, playerId, targetNumber, CallId)
        
                dbg.debug('%s: %s (%s) called from %s to prisoner at booth %s (%s)', 'qb-phone:server:CallContact', playerId, GetPlayerName(playerId), targetNumber, boothPlayerId, GetPlayerName(boothPlayerId))
            else
                dbg.debug('%s: Call to booth state failed: %s', 'qb-phone:server:CallContact', statusCode)
            end
        end)
        

        AddEventHandler('rcore_prison:server:booth:HeartBeat', function(action, data, cb)
            local playerId = nil
            local targetPlayerId = nil
            local targetNumber = nil
            local boothNumber = nil
            local callId = nil
        
            if data then
                playerId = data.initiatorPlayerId
                targetPlayerId = data.targetPlayerId
                targetNumber = data.targetNumber
                boothNumber = data.boothNumber
                callId = data.callId
            end 

            if action == 'BOOTH_LEAVE' then
                EndCallSession(playerId, targetPlayerId, callId)
                cb(true)
            elseif action == 'BOOTH_START_CALL' then
                local booth = BoothService.GetBooth(boothNumber)
        
                if not booth then
                    return cb(false)
                end

                if not targetPlayerId then
                    Framework.sendNotification(playerId, _U('BOOTHS.CALL_STARTED_FAILED_SINCE_NO_PLAYER'), 'error')
                    return cb(false)
                end


                booth.state = CALL_ENUMS.IN_CALL
                booth.callData = {
                    callId = ('%s_%s'):format(playerId, targetPlayerId),
                    targetPlayerId = targetPlayerId,
                    initiatorPlayerId = playerId
                }

                cb(true)
            else
                cb(true)
            end
        end)

        AssetDeployer:registerFileDeploy('booth-api', Phones.QB_PHONE, 'server/main.lua',
        function(file, data)
            file = file:strtrim():gsub('}$', '')

            local itemTemplate = [[

    -- This part was added by rcore_prison booth bridge to support QB Phone with Prison.
    
    local isCustomAPILoaded = true
    local targetNumber = tonumber(ContactData.number)
    local state, statusCode, boothPlayerId = exports['rcore_prison']:GetBoothCallState(targetNumber)

    if state then
        if statusCode == 'BOOTH_NOT_IDLE' then
            cb(false, true)
        elseif statusCode == 'IN_CALL' then
            cb(false, true)
        else
            cb(true, true)
        end
    else
        if Target ~= nil then
            if Calls[Target.PlayerData.citizenid] ~= nil then
                if Calls[Target.PlayerData.citizenid].inCall then
                    cb(false, true)
                else
                    cb(true, true)
                end
            else
                cb(true, true)
            end
        else
            cb(false, false)
        end
    end

    if isCustomAPILoaded then
        return
    end

            ]]

            file = appendQBPhoneTarget(file, itemTemplate)

            return file
        end, {})
    end
end)

