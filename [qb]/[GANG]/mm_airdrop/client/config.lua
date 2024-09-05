function PhoneNotify()
    TriggerServerEvent('lb-phone:server:sendNewMail', {
        sender = 'Dark Web',
        subject = 'Alert!!!',
        message = 'A Supply Drop has been spotted on the map! Go get it before someone else does!',
        button = {}
    })
end

function ExplosionConfig(crateInfo, source)
    local soundId = GetSoundId()
    PlaySoundFromEntity(soundId, "Explosion_Countdown", crateInfo.object, "GTAO_FM_Events_Soundset", false, 0)
    Wait(math.random(1000, 2000))
    StopSound(soundId)
    ReleaseSoundId(soundId)
    Wait(10)
    AddExplosion(crateInfo.coords.x, crateInfo.coords.y, crateInfo.coords.z, 8, 10.0, true, false, 0.0)
end

-- change also in server/config.lua -> line 12
function OpenCrate()
    return Airdrop:hasItem('drill')
end