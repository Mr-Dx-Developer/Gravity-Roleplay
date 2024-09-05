function sendDiscordLogBitcoin(data)
    local header = false
    if data.buyed then
        header = 'Codem Bank - Bitcoin || Buyed Bitcoin'
    else
        header = 'Codem Bank - Bitcoin || Selled Bitcoin'
    end


    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = header,
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "──────────Bitcoin Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Coin Name",   value = data.bitcoinlabel or false,          inline = true },
                    { name = "Coin Amount", value = data.bitcoinamount or 'undefined',   inline = true },
                    { name = "Coin Price",  value = tonumber(data.price) or 'undefined', inline = true },

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['bitcoin'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end


function sendDiscordLogPayBill(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'Codem Bank - Pay Bill',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "──────────Bill Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Pay Bill Amount",   value = data.billMoney or 'undefined',          inline = true },

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['paybill'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end


function sendDiscordLogWithdraw(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'Codem Bank - Withdraw Money',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "──────────Withdraw Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Withdraw Money",   value = data.withdrawMoney or 'undefined',          inline = true },
                    { name = "Total Money", value = data.totalMoney or 'undefined',   inline = true },
                    

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['withdraw'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end

function sendDiscordLogDeposit(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'Codem Bank - Deposit Money',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "──────────Deposit Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Deposit Money",   value = data.depositMoney or 'undefined',          inline = true },
                    { name = "Total Money", value = data.totalMoney or 'undefined',   inline = true },
                    

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['deposit'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end

function sendDiscordLogSocityDeposit(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'Codem Bank - Socity Deposit Money',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "───Socity Deposit Information───",
                        value = "",
                        inline = false
                    },
                    { name = "Deposit Money",   value = data.depositMoney or 'undefined',          inline = true },
                    { name = "Job Name", value = data.jobname or 'undefined',   inline = true },
                    

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['societydeposit'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end

function sendDiscordLogSocityWithdraw(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'Codem Bank - Socity Withdraw Money',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "───Socity Withdraw Information───",
                        value = "",
                        inline = false
                    },
                    { name = "Withdraw Money",   value = data.depositMoney or 'undefined',          inline = true },
                    { name = "Job Name", value = data.jobname or 'undefined',   inline = true },
                    

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['societywithdraw'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end

function sendDiscordLogTransfer(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'Codem Bank - Transfer',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "──────To Player Information──────",
                        value = "",
                        inline = false
                    },
                    { name = "To Name", value = data.toname or false, inline = true },
                    { name = "To ID",   value = data.toidentifier or false,   inline = true },
                    {
                        name = "──────Transfer IBAN Information──────",
                        value = "",
                        inline = false
                    },
                    { name = "Transfer Money",   value = data.transferMoney or 'undefined',          inline = true },
                    { name = "Total Money", value = data.totalMoney or 'undefined',   inline = true },
                    

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['transfer'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end


function sendDiscordLogChangeIban(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'Codem Bank - ChangeIban',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "──────To Player Information──────",
                        value = "",
                        inline = false
                    },
                    { name = "To Name", value = data.toname or false, inline = true },
                    { name = "To ID",   value = data.toidentifier or false,   inline = true },
                    {
                        name = "──────IBAN Information──────",
                        value = "",
                        inline = false
                    },
                    { name = "Old Iban",   value = data.oldiban or 'undefined',          inline = true },
                    { name = "New Iban", value = data.newiban or 'undefined',   inline = true },
                    

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['changeiban'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end

function sendDiscordLogTransferIBAN(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'Codem Bank - Transfer IBAN',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "──────From Player Information──────",
                        value = "",
                        inline = false
                    },
                    { name = "From Name", value = data.fromname or false, inline = true },
                    { name = "From ID",   value = data.fromidentifier or false,   inline = true },
                    { name = "TargetIBAN",   value = data.targetIBAN or false,   inline = true },
                    {
                        name = "──────Transfer IBAN Information──────",
                        value = "",
                        inline = false
                    },
                    { name = "Transfer Money",   value = data.transferMoney or 'undefined',          inline = true },
                    { name = "Total Money", value = data.totalMoney or 'undefined',   inline = true },
                    

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['transferiban'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end

function sendDiscordLogLoan(data)
    local header = false
    if data.finish then
        header = 'Codem Bank - Loan || Finish Loan'
    else
        header = 'Codem Bank - Loan || Ongoing Loan'
    end
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = header,
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "──────────Loan Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Required Loan  Payment",   value = data.requiredPayment or 'undefined',   inline = true },
                    { name = "Total Loan Money",   value = data.totalloanMoney or 'undefined',  inline = true },
                    { name = "Total Money", value = data.totalMoney or 'undefined',   inline = true },
                    
                    

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['loan'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end

function sendDiscordnewLogLoan(data)

    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'Codem Bank - Loan || New Loan',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "──────────Loan Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Total Loan Money",   value = data.amount or 'undefined',   inline = true },
                    { name = "Loan Label",   value = data.label or 'undefined',  inline = true },
                    { name = "Loan Time",   value = data.loantime or 'undefined',  inline = true },
                    { name = "Total Money", value = data.totalMoney or 'undefined',   inline = true },
                    
                    

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['loan'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end


function sendDiscordLognewSaving(data)
    local header = false
    if data.cancel then
        header = 'Codem Bank - Saving || Cancel Saving'
    else
        header = 'Codem Bank - Saving || New Saving'
    end

    if data.pay then
        header = 'Codem Bank - Saving || Pay Saving'
    end
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = header,
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "──────────Saving Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Saving Amount",   value = data.savingMoney or 'undefined',   inline = true },
                    { name = "Total Saving Amount", value = data.totalSavingMoney or 'undefined',   inline = true },
                    { name = "Saving Title",   value = data.savingTitle or 'undefined',  inline = true },
                    { name = "Saving Time",   value = data.savingDay or 'undefined',  inline = true },
                  
                    {
                        name = "──────────Saving Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Saving Interest",  value = data.savingInterest.. '%' or 'undefined',  inline = true },
                    { name = "Start Day", value = data.savingday or 'undefined',   inline = true },
                    { name = "Finish Day", value = data.finishdate or 'undefined',   inline = true },
                    { name = "Total Money", value = data.totalMoney or 'undefined',   inline = true },
                    
                    

                },
                footer = {
                    text = "Codem Store - https://discord.gg/zj3QsUfxWs",
                    icon_url =
                    "https://cdn.discordapp.com/attachments/1025789416456867961/1106324039808594011/512x512_Logo.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['saving'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end

