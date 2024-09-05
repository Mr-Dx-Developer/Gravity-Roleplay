RegisterCommand(Config.Commands.JailCP, function(source, args, rawCommand)
    local playerId = source

    if not Framework.canPerformJobCommand(playerId, Config.Commands.JailCP) then
        Framework.sendNotification(playerId, _U('GENERAL.YOU_NEED_TO_BE_IN_JOB'), 'error')
        dbg.info("Cannot perform this command - you are not job member!", playerId)
        return
    end

    if not IS_DATABASE_READY then
        Framework.sendNotification(playerId, 'Resource being loaded, please wait 10sec!', 'error')
        return
    end

    StartClient(playerId, 'openMDW', true)
end, false)

RegisterCommand(Config.Commands.StopAlarm, function(source, args, rawCommand)
    local playerId = source

    if not Framework.canPerformJobCommand(playerId, Config.Commands.StopAlarm) then
        Framework.sendNotification(playerId, _U('GENERAL.YOU_NEED_TO_BE_IN_JOB'), 'error')
        dbg.info("Cannot perform this command - you are not job member!", playerId)
        return
    end
    
    if not IS_DATABASE_READY then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.RESOURCE_LOADING'), 'error')
        return
    end

    StartClient(-1, 'setAlarm', false)
end, false)

RegisterCommand(Config.Commands.Startcs, function(source, args, rawCommand)
    local playerId = source

    if not Framework.canPerformJobCommand(playerId, Config.Commands.Startcs) then
         Framework.sendNotification(playerId, _U('GENERAL.YOU_NEED_TO_BE_IN_JOB'), 'error')
        dbg.info("Cannot perform this command - you are not job member!", playerId)
        return
    end
    
    local targetPlayerId = GetPlayerByIdOrName(args[1])
    local perolAmount = tonumber(args[2])
    local reason = args[3] and tostring(args[3]) or 'none'

    if not targetPlayerId then
        dbg.info("Cannot find player from value %s", args[1])
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_PLAYER_ID'), 'error')
        return
    end

    if not perolAmount then
        dbg.info("Cannot parse peroll time %s", args[2])
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_JAIL_TIME'), 'error')
        return
    end

    if PrisonService.CheckForAnySentence(targetPlayerId) then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.PLAYER_ALREADY_HAS_SENTENCE'), 'error')
        return
    end

    if not IS_DATABASE_READY then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.RESOURCE_LOADING'), 'error')
        return
    end

    if perolAmount <= 0 then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_JAIL_TIME_VALUE'), 'error')
        return
    end


    COMSService.StartPerollForCitizen(playerId, targetPlayerId, perolAmount, reason)
end, false)

RegisterCommand(Config.Commands.Jail, function(source, args, rawCommand)
    local playerId = source

    if not Framework.canPerformJobCommand(playerId, Config.Commands.Jail) then
        Framework.sendNotification(playerId, _U('GENERAL.YOU_NEED_TO_BE_IN_JOB'), 'error')
        dbg.info("Cannot perform this command - you are not job member!", playerId)
        return
    end
    
    local targetPlayerId = GetPlayerByIdOrName(args[1])
    local jailTime = tonumber(args[2])
    local reason = args[3] and tostring(args[3]) or 'none'

    if not targetPlayerId then
        dbg.info("Cannot find player from value %s", args[1])
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_PLAYER_ID'), 'error')
        return
    end

    if not jailTime then
        dbg.info("Cannot parse jail time %s", args[2])
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_JAIL_TIME'), 'error')
        return
    end
    
    if COMSService.CheckForAnySentence(targetPlayerId) then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.PLAYER_ALREADY_HAS_SENTENCE'), 'error')
        return
    end

    if not IS_DATABASE_READY then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.RESOURCE_LOADING'), 'error')
        return
    end

    if jailTime <= 0 then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_JAIL_TIME_VALUE'), 'error')
        return
    end

    PrisonService.JailCitizen(playerId, targetPlayerId, jailTime, reason)
end, false)

RegisterCommand(Config.Commands.Unjail, function(source, args, rawCommand)
    local playerId = source

    if not Framework.canPerformJobCommand(playerId, Config.Commands.Unjail) then
        Framework.sendNotification(playerId, _U('GENERAL.YOU_NEED_TO_BE_IN_JOB'), 'error')
        dbg.info("Cannot perform this command - you are not job member!", playerId)
        return
    end
    
    local targetPlayerId = GetPlayerByIdOrName(args[1])

    if not targetPlayerId then
        dbg.info("Cannot find player from value %s", args[1])
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_PLAYER_ID'), 'error')
        return
    end

    if not IS_DATABASE_READY then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.RESOURCE_LOADING'), 'error')
        return
    end

    PrisonService.UnjailCitizen(targetPlayerId, true)
end, false)

RegisterCommand(Config.Commands.Solitary, function(source, args, rawCommand)
    local playerId = source

    if not Framework.canPerformJobCommand(playerId, Config.Commands.Solitary) then
        Framework.sendNotification(playerId, _U('GENERAL.YOU_NEED_TO_BE_IN_JOB'), 'error')
        dbg.info("Cannot perform this command - you are not job member!", playerId)
        return
    end
    
    local targetPlayerId = GetPlayerByIdOrName(args[1])
    local jailTime = tonumber(args[2])

    if not targetPlayerId then
        dbg.info("Cannot find player from value %s", args[1])
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_PLAYER_ID'), 'error')
        return
    end

    if not jailTime then
        dbg.info("Cannot parse jail time %s", args[2])
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_JAIL_TIME'), 'error')
        return
    end

    if not IS_DATABASE_READY then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.RESOURCE_LOADING'), 'error')
        return
    end

    if jailTime <= 0 then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_JAIL_TIME_VALUE'), 'error')
        return
    end

    SolitaryService.SetPrisonerSentence(targetPlayerId, jailTime, '-', playerId)
end, false)

RegisterCommand(Config.Commands.RemoveSolitary, function(source, args, rawCommand)
    local playerId = source

    if not Framework.canPerformJobCommand(playerId, Config.Commands.RemoveSolitary) then
        Framework.sendNotification(playerId, _U('GENERAL.YOU_NEED_TO_BE_IN_JOB'), 'error')
        dbg.info("Cannot perform this command - you are not job member!", playerId)
        return
    end
    
    local targetPlayerId = GetPlayerByIdOrName(args[1])

    if not targetPlayerId then
        dbg.info("Cannot find player from value %s", args[1])
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_PLAYER_ID'), 'error')
        return
    end

    if not IS_DATABASE_READY then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.RESOURCE_LOADING'), 'error')
        return
    end

    SolitaryService.ReleasePrisoner(targetPlayerId)
end, false)

RegisterCommand(Config.Commands.Removecs, function(source, args, rawCommand)
    local playerId = source

    if not Framework.canPerformJobCommand(playerId, Config.Commands.Removecs) then
        Framework.sendNotification(playerId, _U('GENERAL.YOU_NEED_TO_BE_IN_JOB'), 'error')
        dbg.info("Cannot perform this command - you are not job member!", playerId)
        return
    end
    
    local targetPlayerId = GetPlayerByIdOrName(args[1])

    if not targetPlayerId then
        dbg.info("Cannot find player from value %s", args[1])
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.INVALID_PLAYER_ID'), 'error')
        return
    end

    if not IS_DATABASE_READY then
        Framework.sendNotification(playerId, _U('COMMANDS_MESSAGES.RESOURCE_LOADING'), 'error')
        return
    end

    COMSService.ReleaseUser(targetPlayerId, playerId)
end, false)

RegisterCommand(Config.Commands.ResetPrisonBreak, function(source, args, rawCommand)
    local playerId = source
    local isAdmin = Framework.isAdmin(playerId)

    if not isAdmin then
        Framework.sendNotification(playerId, _U('GENERAL.YOU_NEED_TO_BE_ADMIN'), 'error')
        dbg.info("Cannot perform this command - you are not admin!", playerId)
        return
    end
    
    PrisonBreakReset(playerId)
end, false)

function GetPlayerByIdOrName(targetPlayer)
    local targetPlayer = targetPlayer

    if isNumber(targetPlayer) and GetPlayerPed(targetPlayer) > 0 then
        return tonumber(targetPlayer)
    elseif type(targetPlayer) == 'string' then
        for _, playerId in pairs(GetPlayers()) do
            local playerName = Framework.getCharacterShortName(playerId)

            if playerName == targetPlayer then
                return playerId
            end
        end
    end
end

function GetPlayerByCharacterId(targetCharId)
    if not targetCharId then
        return
    end

    for _, playerId in pairs(GetPlayers()) do
        local playerId = tonumber(playerId)
        local charId = Framework.getIdentifier(playerId)
  
        if charId == targetCharId then
            return playerId
        end
    end
end

