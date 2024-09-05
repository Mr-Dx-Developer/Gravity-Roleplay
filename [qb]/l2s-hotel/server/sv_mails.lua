QBCore = exports[Shared.Exports.core]:GetCoreObject()



function SendMail(citizenid, sender, subject, message)
    TriggerEvent(Shared.Events.phone, citizenid, {
        sender = sender,
        subject = subject,
        message = message,
    })
end