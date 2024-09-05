if Shared.Ready then
    lib.addCommand('airdrop', {
        help = 'Call an Airdrop',
        params = {},
        restricted = 'group.admin'
    }, function(source)
        ExecuteAirdropCommand(source)
    end)
end

-- remove item used to open crate (ref client/config.lua -> line 21)
RegisterNetEvent('mm_airdrop:server:removeitem', function()
    Airdrop:RemoveItem(source, 'drill', 1)
end)

---@class logdata
---@field type 'loot' | 'landed' | 'explode' | 'start' | 'stop' | 'drop' | 'open'
---@field title string
---@field msg string
---@field color number

---@param data logdata
RegisterNetEvent('mm_airdrop:server:generatelog', function(data)
    local webhook = 'https://discord.com/api/webhooks/1269286689767952477/Tgg63t3A_fM3upCbIJ236ZY-8DpKCe7oMW_SKzBTWFzsDePkyccuy2FxJAoOjaUO0vLI'
    local embedData = {
        {
            ['title'] = data.title,
            ['color'] = data.color,
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = data.msg,
            ['author'] = {
                ['name'] = 'Airdrop Log',
                ['icon_url'] = '',
            },
        }
    }
    PerformHttpRequest(webhook, function() end, 'POST', json.encode({ username = 'Airdrop Log', embeds = embedData}), { ['Content-Type'] = 'application/json' })
end)