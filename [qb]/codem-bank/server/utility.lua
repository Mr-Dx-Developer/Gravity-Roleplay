function ExecuteSql(query, parameters)
    local IsBusy = true
    local result = nil
    if Config.SQL == "oxmysql" then
        if parameters then
            exports.oxmysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "ghmattimysql" then
        if parameters then
            exports.ghmattimysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.ghmattimysql:execute(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "mysql-async" then
        if parameters then
            MySQL.Async.fetchAll(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.Async.fetchAll(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end

exports('addtransaction', function(src, value, payment)
    exportsTransaction(src, value, payment)
end)

RegisterServerEvent('codem-bank:server:addTransaction', function(src, value, payment)
    exportsTransaction(src, value, payment)
end)

function RegisterCallback(name, cbFunc)
    while not Core do
        Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Core.RegisterServerCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    else
        Core.Functions.CreateCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    end
end

function WaitCore()
    while Core == nil do
        Wait(0)
    end
end

function GetPlayer(source)
    local Player = false
    while Core == nil do
        Citizen.Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Player = Core.GetPlayerFromId(source)
    else
        Player = Core.Functions.GetPlayer(source)
    end
    return Player
end

function GetIdentifier(source)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            return Player.getIdentifier()
        else
            return Player.PlayerData.citizenid
        end
    end
end

function GetName(source)
    if Config.Framework == "oldesx" or Config.Framework == "esx" then
        local xPlayer = Core.GetPlayerFromId(tonumber(source))
        if xPlayer then
            return xPlayer.getName()
        else
            return "0"
        end
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local Player = Core.Functions.GetPlayer(tonumber(source))
        if Player then
            return Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
        else
            return "0"
        end
    end
end

function GetPlayerMoney(source, value)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            if value == 'bank' then
                return Player.getAccount('bank').money
            end
            if value == 'cash' then
                return Player.getMoney()
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            if value == 'bank' then
                return Player.PlayerData.money['bank']
            end
            if value == 'cash' then
                return Player.Functions.GetMoney('cash')
            end
        end
    end
end

function RemoveMoney(source, type, value)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            if type == 'bank' then
                Player.removeAccountMoney('bank', value)
            end
            if type == 'cash' then
                Player.removeMoney(value)
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            if type == 'bank' then
                Player.Functions.RemoveMoney('bank', value)
            end
            if type == 'cash' then
                Player.Functions.RemoveMoney('cash', value)
            end
        end
    end
end

function AddMoney(source, type, value)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            if type == 'bank' then
                Player.addAccountMoney('bank', value)
            end
            if type == 'cash' then
                Player.addMoney(value)
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            if type == 'bank' then
                Player.Functions.AddMoney('bank', value)
            end
            if type == 'cash' then
                Player.Functions.AddMoney('cash', value)
            end
        end
    end
end

function GetPlayerIban(source)
    local src = source
    local identifier = GetIdentifier(src)
    if not playerAllData[identifier] then
        return false
    end

    if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local result = ExecuteSql("SELECT iban FROM `players` WHERE `citizenid` = ?", { identifier })
        local iban = result[1].iban
        if not iban or iban == "" then
            iban = GenerateIBAN()
            ExecuteSql("UPDATE `players` SET `iban` = ? WHERE `citizenid` = ?", { iban, identifier })
        end
        playerAllData[identifier].profiledata.iban = iban
        return iban
    else
        local result = ExecuteSql("SELECT iban FROM `users` WHERE `identifier` = ?", { identifier })
        local iban = result[1].iban
        if not iban or iban == "" then
            iban = GenerateIBAN()
            ExecuteSql("UPDATE `users` SET `iban` = ? WHERE `identifier` = ?", { iban, identifier })
        end
        playerAllData[identifier].profiledata.iban = iban
        return iban
    end
end

function GetPlayerOfflineBank(identifier)
    if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local result = ExecuteSql("SELECT money FROM `players` WHERE `citizenid` = ?", { identifier })
        local targetMoney = json.decode(result[1].money)
        return targetMoney.bank
    else
        local result = ExecuteSql("SELECT accounts FROM `users` WHERE `identifier` = ?", { identifier })
        local targetMoney = json.decode(result[1].accounts)
        return targetMoney.bank
    end
end

function RemoveMoneyOfflineBank(identifier, payment)
    if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local result = ExecuteSql("SELECT money FROM `players` WHERE `citizenid` = ?", { identifier })
        local targetMoney = json.decode(result[1].money)
        targetMoney.bank = targetMoney.bank - payment
        ExecuteSql("UPDATE `players` SET `money` = ? WHERE `citizenid` = ?", { json.encode(targetMoney), identifier })
    else
        local result = ExecuteSql("SELECT accounts FROM `users` WHERE `identifier` = ?", { identifier })
        local targetMoney = json.decode(result[1].accounts)
        targetMoney.bank = targetMoney.bank - payment
        ExecuteSql("UPDATE `users` SET `accounts` = ? WHERE `identifier` = ?", { json.encode(targetMoney), identifier })
    end
end

function AddMoneyOfflineBank(identifier, payment)
    if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local result = ExecuteSql("SELECT money FROM `players` WHERE `citizenid` = ?", { identifier })
        local targetMoney = json.decode(result[1].money)
        targetMoney.bank = targetMoney.bank + payment
        ExecuteSql("UPDATE `players` SET `money` = ? WHERE `citizenid` = ?", { json.encode(targetMoney), identifier })
    else
        local result = ExecuteSql("SELECT accounts FROM `users` WHERE `identifier` = ?", { identifier })
        local targetMoney = json.decode(result[1].accounts)
        targetMoney.bank = targetMoney.bank + payment
        ExecuteSql("UPDATE `users` SET `accounts` = ? WHERE `identifier` = ?", { json.encode(targetMoney), identifier })
    end
end

exports('GetPlayerIban', function(src)
    if src then
        local identifier = GetIdentifier(src)
        if not playerAllData[identifier] then
            return GetPlayerIban(src)
        else
            return playerAllData[identifier].profiledata.iban
        end
    else
        return false
    end
end)

exports('GetBlockAccount', function(src)
    if src then
        local identifier = GetIdentifier(src)
        if not playerAllData[identifier] then
            return false
        else
            return playerAllData[identifier].profiledata.block
        end
    else
        return false
    end
end)

exports('SetBlockAccount', function(src, bool)
    if src then
        local identifier = GetIdentifier(src)
        if not playerAllData[identifier] then
            return
        else
            playerAllData[identifier].profiledata.block = bool
        end
    else
        return
    end
end)

function GetIbanPlayerData(targetIBAN)
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local result = ExecuteSql("SELECT * FROM users WHERE iban LIKE ?", { '%' .. targetIBAN .. '%' })
        return result
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local result = ExecuteSql("SELECT * FROM players WHERE iban LIKE ?", { '%' .. targetIBAN .. '%' })
        return result
    end
end

function GenerateIBAN()
    local IsUnique = false
    local ibanNumber = nil
    while not IsUnique do
        ibanNumber = math.random(100000, 999999)
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            local result = ExecuteSql("SELECT COUNT(*) as count FROM users WHERE iban LIKE ?",
                { '%' .. ibanNumber .. '%' })
            if result[1].count == 0 then
                IsUnique = true
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            local result = ExecuteSql("SELECT COUNT(*) as count FROM players WHERE iban LIKE ?",
                { '%' .. ibanNumber .. '%' })
            if result[1].count == 0 then
                IsUnique = true
            end
        end
    end
    return ibanNumber
end

function checkPlayerLoan(source)
    local src = source
    local identifier = GetIdentifier(src)
    local data = playerAllData[identifier]
    if not data then
        return false
    end
    local loanData = data.loandata
    if next(loanData) then
        return true
    else
        return false
    end
end

function CheckNeedstoPayLoan(time)
    if tonumber(time) <= 0 then
        return true
    else
        return false
    end
end

function checkPlayerSaving(source)
    local src = source
    local identifier = GetIdentifier(src)
    local data = playerAllData[identifier]
    if not data then
        return false
    end
    local savingdata = data.savingdata
    if next(savingdata) then
        return true
    else
        return false
    end
end

function GetPlayerByIdentifier(identifier)
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local player = Core.GetPlayerFromIdentifier(identifier)
        if player then
            return player.source
        else
            return false
        end
        -- local result = ExecuteSql("SELECT * FROM `users` WHERE `identifier` = ?", { identifier })
        -- return result[1]
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local player = Core.Functions.GetPlayerByCitizenId(identifier)

        if player then
            return player.PlayerData.source
        else
            return false
        end
    end
end

function GetFormattedDay()
    local day = os.date("*t").wday
    local days = {
        "sun",
        "mon",
        "tue",
        "wed",
        "thu",
        "fri",
        "sat"
    }
    return days[day]
end

function addSpendData(src, value)
    local identifier = GetIdentifier(src)
    local data = playerAllData[identifier]
    local spendData = data.spenddata
    local formatData = GetFormattedDay()
    for k, v in pairs(spendData) do
        if k == formatData then
            spendData[k] = v + value
            TriggerClientEvent('codem-bank:updateSpendData', tonumber(src), spendData)
            break
        end
    end
end

function addSpendDataSociety(job, value)
    local data = playerJobData[job]
    local spendData = data.spenddata
    local formatData = GetFormattedDay()
    for k, v in pairs(spendData) do
        if k == formatData then
            spendData[k] = v + value
            return spendData
        end
    end
end

function addSpendigsData(source, payment, value)
    local src = source
    local identifier = GetIdentifier(src)
    local data = playerAllData[identifier]
    if not data then
        return
    end
    local spendings = data.spendigsdata
    for k, v in pairs(spendings) do
        if k == value then
            spendings[k] = spendings[k] + payment
            return spendings
        end
    end
end

function exportsTransaction(src, value, payment)
    if src == nil then
        source = source
    else
        source = src
    end

    local player = GetPlayerByIdentifier(GetIdentifier(source))
    if not player then
        print('ERROR EXPORTSTRANSACTION NOT PLAYER FOUND')
        return
    end
    local data = playerAllData[GetIdentifier(source)]
    if not data then
        print('EROR EXPORETTRANSACTION NOT DATA')
        return
    end
    local src = source
    local transactionDetails = {
        gas = {
            label = Config.Locales['GASPAYMENT'],
            icon = 'gasiconsmall',
            to = 'LTD Gasoline'
        },
        shopping = {
            label = Config.Locales['MARKET7/24'],
            icon = 'shoppingiconsmall',
            to = '7/24 Market'
        },
        transfer = {
            llabel = Config.Locales['MONEYWITHDRAW'],
            icon = 'withdrawiconsmall',
            to = GetName(src)
        },
        bills = {
            label = Config.Locales['BILLPAYMENT'],
            icon = 'billiconsmall',
            to = 'Bill Payment'
        }
    }

    local details = transactionDetails[value]

    if details then
        local notificationData = {
            label = details.label,
            icon = details.icon,
            from = '**' .. playerAllData[GetIdentifier(src)].profiledata.iban,
            to = details.to,
            type = '-',
            date = os.date("%d/%m/%Y %H:%M"),
            amount = payment
        }
        local pushnotification = {
            title = details.label,
            header = details.to,
            amount = payment,
            time = os.date("%H:%M:%S"),
            type = "-"
        }
        pushNotificationData(src, pushnotification)
        addNotificationData(src, notificationData)
        local spendings = addSpendigsData(src, payment, value)
        TriggerClientEvent('codem-bank:client:updateSpendigsData', src, spendings)
    else
        print('ERROR: Invalid transaction type:', value)
    end
end

function addContributionDataSociety(jobname, amount, source)
    local src = source
    local identifier = GetIdentifier(src)
    local data = playerJobData[jobname]
    if not data then
        print('ERROR LINE 309 UTILITY. NOT DATA')
        return false
    end
    local contributionData = data.contributiondata
    local found = false
    for k, v in pairs(contributionData) do
        if v.identifier == identifier then
            found = true
            contributionData[k].amount = v.amount + amount
            return contributionData
        end
    end
    if not found then
        local data = {
            identifier = identifier,
            amount = amount,
            name = GetName(src),
            avatar = GetDiscordAvatar(src) or Config.ExampleProfilePicture,
        }
        table.insert(contributionData, data)
        return contributionData
    end
end

function addMostSendPlayers(source, dataInfo)
    local src = source
    local identifier = GetIdentifier(src)
    local data = playerAllData[identifier]
    if not data then
        print('ERROR LINE 309 UTILITY. NOT DATA')
        return false
    end
    local mostSendPlayers = data.mostsenddata
    local found = false
    for k, v in pairs(mostSendPlayers) do
        if v.identifier == dataInfo.identifier then
            found = true
            mostSendPlayers[k].contribution = v.contribution + 1
            TriggerClientEvent('codem-bank:client:updateMostSendPlayersData', src, data.mostsenddata)
            return
        end
    end

    if not found then
        table.insert(data.mostsenddata, dataInfo)
        TriggerClientEvent('codem-bank:client:updateMostSendPlayersData', src, data.mostsenddata)
        return
    end
end

function addNotificationData(src, notifydata)
    local identifier = GetIdentifier(src)
    local data = playerAllData[identifier]
    if not data then
        print('ERROR LINE 337 UTILITY. NOT DATA')
        return false
    end
    local notificationData = data.notificationdata
    table.insert(notificationData, notifydata)
    TriggerClientEvent('codem-bank:updateNotificationData', tonumber(src), notifydata)
end

function addNotificationDataSociety(jobname, notifydata)
    local data = playerJobData[jobname]
    if not data then
        print('ERROR LINE 602 UTILITY. NOT DATA')
        return false
    end
    local notificationData = data.notificationdata
    table.insert(notificationData, notifydata)
    local onlineMembers = findOnlineJobMembers(jobname)
    for _, playerID in pairs(onlineMembers) do
        if playerID and openBankMenu[playerID] then
            TriggerClientEvent('codem-bank:updateNotificationDataScoiety', tonumber(playerID), notifydata)
        end
    end
end

function pushNotificationData(src, notifydata)
    local identifier = GetIdentifier(src)
    local data = playerAllData[identifier]
    if not data then
        print('ERROR LINE 337 UTILITY. NOT DATA')
        return false
    end
    local notificationData = data.pushnotificationdata
    table.insert(notificationData, notifydata)
    TriggerClientEvent('codem-bank:updatePushNotificationData', tonumber(src), notifydata)
end

function GetSocietyMoney(job)
    if Config.Framework == "esx" or Config.Framework == "oldesx" then
        if job then
            TriggerEvent("esx_addonaccount:getSharedAccount", 'society_' .. job, function(account)
                money = tonumber(account.money)
            end)
            return money
        end
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        if job then
            local accountName = job
            local societyAccountMoney
            if Config.newManagementSystem then
                societyAccountMoney = ExecuteSql("SELECT * FROM `bank_accounts` WHERE `account_name` = '" ..
                    accountName .. "'")
                if next(societyAccountMoney) then
                    return societyAccountMoney[1].account_balance
                else
                    if Config.CreateJobAccount then
                        exports["qb-banking"]:CreateJobAccount(accountName, 0)
                        Wait(350)
                        return 0
                    else
                        return false
                    end
                end
            else
                societyAccountMoney = ExecuteSql("SELECT * FROM `management_funds` WHERE `job_name` = '" ..
                    accountName .. "'")
                if next(societyAccountMoney) then
                    return societyAccountMoney[1].amount
                else
                    return false
                end
            end
        end
    end
end

function RemoveSocietyMoney(job, givenAmount)
    if Config.Framework == "esx" or Config.Framework == "oldesx" then
        if job then
            local accountName = 'society_' .. job
            TriggerEvent("esx_addonaccount:getSharedAccount", 'society_' .. job, function(account)
                if account then
                    if account.money >= tonumber(givenAmount) then
                        local currentAmount = account.money
                        newAmount = currentAmount - givenAmount
                        account.removeMoney(givenAmount)
                        Wait(500)
                        return tonumber(newAmount) or 0
                    else
                        print('ERROR SOCIETY MONEY IS NOT ENOUGH')
                        return false
                    end
                else
                    return false
                end
            end)
            return newAmount or 0
        end
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        if job then
            local accountName = job
            local societyAccountMoney
            if Config.newManagementSystem then
                societyAccountMoney = ExecuteSql("SELECT * FROM `bank_accounts` WHERE `account_name` = '" ..
                    accountName .. "'")

                if societyAccountMoney and societyAccountMoney[1] then
                    local currentAmount = societyAccountMoney[1].account_balance
                    local newAmount = currentAmount - givenAmount
                    if newAmount < 0 then
                        print('ERROR SOCIETY MONEY IS NOT ENOUGH')
                        return false
                    else
                        ExecuteSql("UPDATE `bank_accounts` SET `account_balance` = ? WHERE `account_name` = ?",
                            { newAmount, accountName })
                        return newAmount
                    end
                else
                    return false
                end
            else
                local societyAccountMoney = ExecuteSql("SELECT * FROM `management_funds` WHERE `job_name` = '" ..
                    accountName .. "'")
                if societyAccountMoney and societyAccountMoney[1] then
                    local currentAmount = societyAccountMoney[1].amount
                    local newAmount = currentAmount - givenAmount
                    if newAmount < 0 then
                        print('ERROR SOCIETY MONEY IS NOT ENOUGH')
                        return false
                    else
                        ExecuteSql("UPDATE `management_funds` SET `amount` = ? WHERE `job_name` = ?",
                            { newAmount, accountName })
                        return newAmount
                    end
                else
                    return false
                end
            end
        end
    end
end

function AddSocietyMoney(job, givenAmount)
    if Config.Framework == "esx" or Config.Framework == "oldesx" then
        if job then
            local accountName = 'society_' .. job
            TriggerEvent("esx_addonaccount:getSharedAccount", 'society_' .. job, function(account)
                account.addMoney(givenAmount)
                Wait(500)
                newAmount = account.money
            end)
            return newAmount
        end
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        if job then
            local accountName = job
            local societyAccountMoney
            if Config.newManagementSystem then
                societyAccountMoney = ExecuteSql("SELECT * FROM `bank_accounts` WHERE `account_name` = '" ..
                    accountName .. "'")
                if societyAccountMoney and societyAccountMoney[1] then
                    local currentAmount = societyAccountMoney[1].account_balance
                    local newAmount = currentAmount + givenAmount
                    if newAmount < 0 then
                        print('ERROR SOCIETY MONEY IS NOT ENOUGH')
                        return false
                    else
                        ExecuteSql("UPDATE `bank_accounts` SET `account_balance` = ? WHERE `account_name` = ?",
                            { newAmount, accountName })
                        return newAmount
                    end
                else
                    print('ERROR SOCIETY NOT FOUND')
                    return false
                end
            else
                societyAccountMoney = ExecuteSql("SELECT * FROM `management_funds` WHERE `job_name` = '" ..
                    accountName .. "'")
                if societyAccountMoney and societyAccountMoney[1] then
                    local currentAmount = societyAccountMoney[1].amount
                    local newAmount = currentAmount + givenAmount
                    if newAmount < 0 then
                        print('ERROR SOCIETY MONEY IS NOT ENOUGH')
                        return false
                    else
                        ExecuteSql("UPDATE `management_funds` SET `amount` = ? WHERE `job_name` = ?",
                            { newAmount, accountName })
                        return newAmount
                    end
                else
                    print('ERROR SOCIETY NOT FOUND')
                    return false
                end
            end
        end
    end
end
