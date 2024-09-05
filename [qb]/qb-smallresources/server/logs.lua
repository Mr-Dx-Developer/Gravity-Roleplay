local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discordapp.com/api/webhooks/1269288909108412469/Uv_V65R6CtP0lVr4-XtGSZAFxsJAMQwQNfmxbv-PDEl8lB_dHOlkz3ON239uy2ttaDNN',
    ['testwebhook'] = 'https://discordapp.com/api/webhooks/1269291385610305538/q5ejW-G36yx_l1C8bCMyXw-69g0QuuPfoD24K0qaK5dNQ44t56-Ylx8mUGiW6Bfa8GFg',
    ['playermoney'] = 'https://discordapp.com/api/webhooks/1269291567642841188/jXDQ4x4dE8sAlM76_Vb8bQdMsmxo-U3MhACCpWeMBrpBulPgl8HULkPbd8g6mqZb1-ho',
    ['playerinventory'] = 'https://discordapp.com/api/webhooks/1269291803421708348/AzYQuW-WI8unYWm52tWcz1e08wv3AZyVRmAIF4fHcgTShoMP0hEqCi9eFonz_ItEmesY',
    ['robbing'] = 'https://discordapp.com/api/webhooks/1269291937194573894/Z3OyUpsacUlseS0eaHH0L3JHzAf7rAKiLG9TxxKgPc7NROz_ZSLLKXU_WSxVeg-4u_Jp',
    ['cuffing'] = 'https://discordapp.com/api/webhooks/1269292129079918645/XGXQb_IZkGp32vJEA-jEM5Ev3dZhwwmAynPGfiknVqSztiBF4jwNx8DE5g1s1yeQpG5j',
    ['drop'] = 'https://discordapp.com/api/webhooks/1269292250182189056/2nMs0qrHkbPsVjCNW88EiT3EBKUjEl1oXLlgfVIoODsUmglqHzP2KXJjHu_O6iaptTu_',
    ['trunk'] = 'https://discordapp.com/api/webhooks/1269292420387049493/D1Gp0p0lmNPhD1tdBeh6BoQRh-A9U9pToHeUb3jSX4p6kCjf-FDGe3fSFh82x6TAZz0Y',
    ['stash'] = 'https://discordapp.com/api/webhooks/1269292600721149972/_ERp-avLCqf6-TveT_D6zKBC5UvTFpIoahfry27sqlkdSKNYHt4aHxmF3vk4uQJsP9rD',
    ['glovebox'] = 'https://discordapp.com/api/webhooks/1269292709596889200/T-R8i-uRs9lLdd6HS1gnkHy_338kCxOHQH1BQjdudhg80QdkHqXkXHx0IKd9dfGJJcjV',
    ['banking'] = 'https://discordapp.com/api/webhooks/1269292845899055196/hNETsFOsgqo4EHddRj9XrJBFPuIEoX8AWI_WgqWYJo1GkFWAp0ucajcPr0Z5he4j0mU-',
    ['vehicleshop'] = 'https://discordapp.com/api/webhooks/1269292994427883632/kfKwC96_jWcdHGYwMi7YUOw8X1gczUT_CLjt-YmU4qeqVu12eu0DNy9p4rfNtlSHt3pO',
    ['vehicleupgrades'] = 'https://discordapp.com/api/webhooks/1269293124996567050/egWWbrlvVm9m896iirHTI3PLPPRLf1K-2BJlGNe9z_t7UxDfnDoVJU3s_AJp12Omy3Dt',
    ['shops'] = 'https://discordapp.com/api/webhooks/1269293297491378307/-hbVSkBWJfnAw9Bd5OpXwVOFZICN6Xf8as1iKVU-7DqIaXsLBakGZ1ImYCbIRAAQIJVF',
    ['dealers'] = 'https://discordapp.com/api/webhooks/1269293551137722390/VgSBhFKo7OwarkIKNS23ow_mnm7uYqhl9Ignn5ELo-hqmBC3xyRz0ps46W0soASnE7re',
    ['storerobbery'] = 'https://discordapp.com/api/webhooks/1269293747229954119/s7UTy1RVbXT0O5M4StKIoVZFZUMSkr25xJVnp-NNb8nZ1Abea2teO7dm6F5kN3PeLHBd',
    ['bankrobbery'] = 'https://discordapp.com/api/webhooks/1269294038171779133/Jz4vwqD41jLwR9nTpy1enHdYVkI-s4rRJN7COQXVPWCdNW-3jHTHlh2j7WDN3T0YwbOQ',
    ['powerplants'] = 'https://discordapp.com/api/webhooks/1269294223224602776/4-bnhh5Ng6BzVOFwaopGnG7_wIq_BPfOi5bc_X3g2Sj38BTZpN69IspDCLE5eUCrXPU7',
    ['death'] = 'https://discordapp.com/api/webhooks/1269294346386145311/ii2XRhBQofGGqK5Mqi5wnq8_TxWFe5BX1TJa66mQFT8b_xdbFNaVgUFQU3uRF6XnQMna',
    ['joinleave'] = 'https://discordapp.com/api/webhooks/1269294551500062722/rD6d35x7GXQJgCuLo3-_JyZo20OEBOgsqtZRCLk3OCuOc6SDNiPkLKDsfqBxFDUZLFJ-',
    ['ooc'] = 'https://discordapp.com/api/webhooks/1269294670886731846/eZ_i9YKTxsV4Ivm05Y92AqySPSR_aWO2MPjJRi8wEWqCj7C13KhzHofZ9mMbtlybZlzd',
    ['report'] = 'https://discordapp.com/api/webhooks/1269294773752303697/ImtZ0ap2aB6XmFiL479X8_2t-H5tYO8UT-V0iGxJnReSH6rOFfn06ZdWgCNDQ0xH2d7L',
    ['me'] = 'https://discordapp.com/api/webhooks/1269294995425198212/Iyf6cKrBwTJVNyhCKqFrNd0ULS90NwBsFvO7-GuWykPn9tbHtgvTnlZ1wBOjfiY0Nr3n',
    ['pmelding'] = 'https://discordapp.com/api/webhooks/1269295287399350384/cGsmiMu50OOHp32Wqo-48uzno1on80GZmHg3ASOQVy7BEwPpyk3-sO88yrmCBMd4CsXX',
    ['112'] = 'https://discordapp.com/api/webhooks/1269295472653238333/1UnO8ulTv__ldRQ-tsxHsz1Xaba-L_SbWYD3kNkFEch9bGeUj37tLgPhh2l0m8ZnEfXY',
    ['bans'] = 'https://discordapp.com/api/webhooks/1269295618841514024/hFaHkOTBb3wB32vrGfWciSrVHts9KDUlg57DLcWnnV_hzrfgvqbCWxNKCAamZVLEukIO',
    ['anticheat'] = 'https://discordapp.com/api/webhooks/1269295760797601852/XgGqDgq5Njt2bAGlJgQ9N4DjuRzLqVwBTBx5oUItU9k0QWiWs0B_e5QkqObGgBQ-xBHN',
    ['weather'] = 'https://discordapp.com/api/webhooks/1269295905258078259/soVSZg8CBafWfVr2ZemOGIs2E4ZVS4dKUBHOdNqGPdqiehNIGgENTC-ABDYG0-FcEfqi',
    ['moneysafes'] = 'https://discordapp.com/api/webhooks/1269296014393872465/tAvrt703rTa8KM7fN48czsqUcj_79KWZVZSX_-NEQAc3mqH0CGpowRVetcrmQSTdlL24',
    ['bennys'] = 'https://discordapp.com/api/webhooks/1269296132882698321/Z2mG2WcaBM9y29GbuMT6cedLfL42A_sEcYGkGNTBQyb-kCoPuuZ8SX8c42is9T2fB8YR',
    ['bossmenu'] = 'https://discordapp.com/api/webhooks/1269296238663045180/IzH9XF7bhL9fI4i2rRYXWGkRZP0suEAvqLXcE9cFrFF1YJYdh5KtwN5xZRlmJ4KRA_mJ',
    ['robbery'] = 'https://discordapp.com/api/webhooks/1269296375519252523/TqIiwcfGLGZ1MU0Zc3JjOZhSherxWNyYcQK6ZhZ4Geuhkyj1UztRX_b1RpvUkxM9C6Fk',
    ['casino'] = 'https://discordapp.com/api/webhooks/1269296488673050715/H_cG8GL3qVjudFghQLoutc49k4dOeY3crBWHv-hTxSEY4mqljnzNQp1W6RXj7U4Jv0KM',
    ['traphouse'] = 'https://discordapp.com/api/webhooks/1269296657242263572/8jw5fBFyxZcjC81ylypdRNYd0qjvCRh22q4Nv1atFgK4xMfUK5GZIvcggY8q88pZshRH',
    ['911'] = 'https://discordapp.com/api/webhooks/1269296785407348756/2k6qwP0A3VEdPIvOmDsscp-sGS7euzN3tEB8yNhzrcRXogaVCbQ3snd1ZSEDPosdguS9',
    ['palert'] = 'https://discordapp.com/api/webhooks/1269297010792468571/95DwS89XLDBu0-EmHxTu3-H_PuaF0mAHLmJk9N_W-mWQHzhyvhDKxR-2OBCmEGmszko1',
    ['house'] = 'https://discordapp.com/api/webhooks/1269297117344698480/1wUbxn55YeuSu0x4sjJw2Mc2WngFMMIw6LcHsrM8xrrzh_zV6iTpM5zDlXwALK5v6IUW',
    ['qbjobs'] = 'https://discordapp.com/api/webhooks/1269297236739883081/A-g-8E3nqyxZxtyi1eYUanK13Wt-csUUunQx06YS-T4GvZb8i98NKePSZY-HtjBjuF87',
}


local colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ['lightgreen'] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone, imageUrl)
    local postData = {}
    local tag = tagEveryone or false

    if Config.Logging == 'discord' then
        if not Webhooks[name] then
            print('Tried to call a log that isn\'t configured with the name of ' .. name)
            return
        end
        local webHook = Webhooks[name] ~= '' and Webhooks[name] or Webhooks['default']
        local embedData = {
            {
                ['title'] = title,
                ['color'] = colors[color] or colors['default'],
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = 'QBCore Logs',
                    ['icon_url'] = 'https://raw.githubusercontent.com/GhzGarage/qb-media-kit/main/Display%20Pictures/Logo%20-%20Display%20Picture%20-%20Stylized%20-%20Red.png',
                },
                ['image'] = imageUrl and imageUrl ~= '' and { ['url'] = imageUrl } or nil,
            }
        }

        if not logQueue[name] then logQueue[name] = {} end
        logQueue[name][#logQueue[name] + 1] = { webhook = webHook, data = embedData }

        if #logQueue[name] >= 10 then
            if tag then
                postData = { username = 'QB Logs', content = '@everyone', embeds = {} }
            else
                postData = { username = 'QB Logs', embeds = {} }
            end
            for i = 1, #logQueue[name] do postData.embeds[#postData.embeds + 1] = logQueue[name][i].data[1] end
            PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
            logQueue[name] = {}
        end
    elseif Config.Logging == 'fivemanage' then
        local FiveManageAPIKey = GetConvar('FIVEMANAGE_LOGS_API_KEY', 'false')
        if FiveManageAPIKey == 'false' then
            print('You need to set the FiveManage API key in your server.cfg')
            return
        end
        local extraData = {
            level = tagEveryone and 'warn' or 'info', -- info, warn, error or debug
            message = title,                          -- any string
            metadata = {                              -- a table or object with any properties you want
                description = message,
                playerId = source,
                playerLicense = GetPlayerIdentifierByType(source, 'license'),
                playerDiscord = GetPlayerIdentifierByType(source, 'discord')
            },
            resource = GetInvokingResource(),
        }
        PerformHttpRequest('https://api.fivemanage.com/api/logs', function(statusCode, response, headers)
            -- Uncomment the following line to enable debugging
            -- print(statusCode, response, json.encode(headers))
        end, 'POST', json.encode(extraData), {
            ['Authorization'] = FiveManageAPIKey,
            ['Content-Type'] = 'application/json',
        })
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'QB Logs', embeds = {} }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds + 1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
