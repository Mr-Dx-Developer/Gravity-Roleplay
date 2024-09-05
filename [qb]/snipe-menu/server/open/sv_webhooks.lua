local WebHooks = {
    ["exploit"] = "https://discord.com/api/webhooks/1269291299320627362/yadokCu3klG3bG2QJP7RBcxUOVsIop5_ElhShnGyCXvZnUnwOaZDLZR3ueFFBhnVQ6em",
    ["triggered"] = "https://discord.com/api/webhooks/1269291366014517332/XW9kFi8C7Ap52ZlDL4t5SYed_o_hEH55NluJu5VmqNYmAbBvNjdOrmltJuGmLKVwyqsL",
    ["report"] = "https://discord.com/api/webhooks/1269291435614535824/geB0nACdfG5ASP-TPDTIOpvjvV6oXf6N5MX_WTBdQs_jlPg1eopk2KsGQFBep_quOz7J",
    ["transcript"] = "https://discord.com/api/webhooks/1269291498587820095/EeaWvMmVxr33oIs0_nABc0VNGBmQ431wG5W1wY-SMmseLFvlsD7MRVfQu_z_XNduMVdM",
    ["bans"] = "https://discord.com/api/webhooks/1269291567261290567/4QeivVouDrrLv3BsN0lyMu5dskZabyk8WGoXCcU_5Oo8liqNYovgkZcE0XBhOSvHUOLN",
    ["duty"] = "https://discord.com/api/webhooks/1269291639847915615/6Vim8snx93GgfmxG2b4HPqfAXQvIpSr4Ffz6McZdc1UE5nVTrps2irVTuX3P_QsFWHGn", -- when they player logs in on duty
    ["dutylog"] = "https://discord.com/api/webhooks/1269291722647797771/5Sl0QMtTPBY9GJXZVktExxmkImgx0Q-d4bhJ6-pKvFZZkO6rxiLZzyvhoF3HmgluHqpx" -- when they player logs off duty
}

function SendLogs(source, type, message)
    local colorcode = 5763719
    if type == "exploit" then
        colorcode = 16711680
    end
    local description = ""
    if source == 0 then
        description = "**"..message.."**"
    else
        description = "**"..GetPlayerName(source).."** ("..source..")\n"..message
    end
    if type == "report" then
        description = "**"..GetPlayerName(source).."** ".. message
    end
    local embedData = {
        {
            ["title"] = "Admin Menu Logs" ,
            ["color"] = colorcode,
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            ["description"] = description,
            ["author"] = {
            ["name"] = 'Snipe Admin Menu Logs',
            },
        }
    }
    if type == "transcript" then
        embedData[1].title = "Chat Transcript (Closed by "..GetPlayerName(source)..")"
        embedData[1].footer.text = "Closed on "..os.date("%c")
        embedData[1].description = message
        description = ""
    end
    PerformHttpRequest(WebHooks[type], function(err, text, headers) end, 'POST', json.encode({ username = "Snipe Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end

function SendDutyLogs(source, isOnDuty, timeDiff)
    local colorcode = 5763719
    local webhook = WebHooks["duty"]
    if not isOnDuty then
        colorcode = 16711680
        webhook = WebHooks["dutylog"]
    end
    local name = GetPlayerName(source) or "Player Dropped"
    local status = isOnDuty and "On Duty" or "Off Duty"
    local embedData = {
        {
            ["title"] = "Snipe Duty Logs" ,
            ["color"] = colorcode,
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            -- ["description"] = description,
            ["fields"] = {
                {
                    ["name"] = "Player Info",
                    ["value"] = "```"..source.." | "..name.."```",
                    ["inline"] = false,
                },
                {
                    ["name"] = "Status",
                    ["value"] = "```"..status.."```",
                    ["inline"] = true,
                },

            },
            ["author"] = {
                ["name"] = 'Snipe Admin Menu Logs',
            },
        }
    }

    if not isOnDuty then
        local timeSpentString = ""
        if timeDiff >= 60 then
            local minutes = math.floor(timeDiff / 60)
            local seconds = timeDiff - (minutes * 60)
            timeSpentString = minutes.." minutes and "..seconds.." seconds"
        else
            timeSpentString = timeDiff.." seconds"
        end
        embedData[1].fields[3] = {
            ["name"] = "Time Spent",
            ["value"] = "```"..timeSpentString.."```",
            ["inline"] = true,
        }
    end

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = "Snipe Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end


RegisterServerEvent("snipe-menu:server:sendLogs", function(type, message)
    local source = source
    if type == "exploit" then
        SendLogs(source, type, message)
    elseif type == "triggered" then
        SendLogs(source, type, message)
    end
end)