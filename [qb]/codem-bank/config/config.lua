Config = {}

Config.Framework = 'qb' -- esx, oldesx, qb, oldqb
Config.SQL = "oxmysql"  -- oxmysql, ghmattimysql, mysql-async

Config.ExampleProfilePicture =
"https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png"

Config.InteractionHandler = 'drawtext' -- bt-target, qb-target, drawtext, qtarget , ox-target
Config.CodemTextUi = {                 -- used when drawtext is selected
    banktextui = false,                -- true or false
    atmtextui = false,                 -- true or false
    bankText = "Bank",                 -- bank textui
    atmText = "ATM",                   -- atm textui
    bankKey = "E",                     -- bank key
    atmKey = "E",                      -- atm key
    bankThema = "thema-6",             -- bank theme
    atmThema = "thema-6",              -- atm theme
}
Config.newManagementSystem = false     -- true is qb-banking false qb-managment
Config.CreateJobAccount = true         -- is only for qb-banking, if there is no data for profession in sql, it creates automatically
Config.CleanSql = true                 --automatically deletes transaction data and unnecessary data in sql every week
Config.CurrencyUnit = '$'              -- '€' -- '₺'  '$'
Config.RestartCleanSql = false         -- deletes transaction history and does not keep it in the database


-- ██████╗░██╗░░░░░██╗██████╗░  ░██████╗███████╗████████╗████████╗██╗███╗░░██╗░██████╗░░██████╗
-- ██╔══██╗██║░░░░░██║██╔══██╗  ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗░██║██╔════╝░██╔════╝
-- ██████╦╝██║░░░░░██║██████╔╝  ╚█████╗░█████╗░░░░░██║░░░░░░██║░░░██║██╔██╗██║██║░░██╗░╚█████╗░
-- ██╔══██╗██║░░░░░██║██╔═══╝░  ░╚═══██╗██╔══╝░░░░░██║░░░░░░██║░░░██║██║╚████║██║░░╚██╗░╚═══██╗
-- ██████╦╝███████╗██║██║░░░░░  ██████╔╝███████╗░░░██║░░░░░░██║░░░██║██║░╚███║╚██████╔╝██████╔╝
-- ╚═════╝░╚══════╝╚═╝╚═╝░░░░░  ╚═════╝░╚══════╝░░░╚═╝░░░░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░
Config.Blip = {
    blipName = 'Bank',
    blipType = 108,
    blipColor = 2,
    blipScale = 0.55
}

-- ██████╗░░█████╗░███╗░░██╗██╗░░██╗  ██╗░░░░░░█████╗░░█████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗
-- ██╔══██╗██╔══██╗████╗░██║██║░██╔╝  ██║░░░░░██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
-- ██████╦╝███████║██╔██╗██║█████═╝░  ██║░░░░░██║░░██║██║░░╚═╝███████║░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
-- ██╔══██╗██╔══██║██║╚████║██╔═██╗░  ██║░░░░░██║░░██║██║░░██╗██╔══██║░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
-- ██████╦╝██║░░██║██║░╚███║██║░╚██╗  ███████╗╚█████╔╝╚█████╔╝██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
-- ╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝  ╚══════╝░╚════╝░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░
Config.BankLocations = {
    {
        coords = vector3(149.9, -1040.46, 29.37)
    },
    {
        coords = vector3(314.23, -278.83, 54.17),
    },
    {
        coords = vector3(-350.8, -49.57, 49.04),
    },
    {
        coords = vector3(-1213.0, -330.39, 37.79),
    },
    {
        coords = vector3(-2962.71, 483.0, 15.7),
    },
    {
        coords = vector3(1175.07, 2706.41, 38.09),
    },
    {
        coords = vector3(246.64, 223.20, 106.29),
    },
    {
        coords = vector3(-113.22, 6470.03, 31.63)
    },

}

-- ░█████╗░████████╗███╗░░░███╗  ███╗░░░███╗░█████╗░██████╗░███████╗██╗░░░░░░██████╗
-- ██╔══██╗╚══██╔══╝████╗░████║  ████╗░████║██╔══██╗██╔══██╗██╔════╝██║░░░░░██╔════╝
-- ███████║░░░██║░░░██╔████╔██║  ██╔████╔██║██║░░██║██║░░██║█████╗░░██║░░░░░╚█████╗░
-- ██╔══██║░░░██║░░░██║╚██╔╝██║  ██║╚██╔╝██║██║░░██║██║░░██║██╔══╝░░██║░░░░░░╚═══██╗
-- ██║░░██║░░░██║░░░██║░╚═╝░██║  ██║░╚═╝░██║╚█████╔╝██████╔╝███████╗███████╗██████╔╝
-- ╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░░░░╚═╝  ╚═╝░░░░░╚═╝░╚════╝░╚═════╝░╚══════╝╚══════╝╚═════╝░
Config.ATMModels = {
    {
        prop = "prop_atm_01",
    },
    {
        prop = "prop_atm_02",
    },
    {
        prop = "prop_atm_03",
    },
    {
        prop = "prop_fleeca_atm",
    }
}

-- ██████╗░██╗██╗░░░░░██╗░░░░░██╗███╗░░██╗░██████╗░  ░██████╗██╗░░░██╗░██████╗████████╗███████╗███╗░░░███╗
-- ██╔══██╗██║██║░░░░░██║░░░░░██║████╗░██║██╔════╝░  ██╔════╝╚██╗░██╔╝██╔════╝╚══██╔══╝██╔════╝████╗░████║
-- ██████╦╝██║██║░░░░░██║░░░░░██║██╔██╗██║██║░░██╗░  ╚█████╗░░╚████╔╝░╚█████╗░░░░██║░░░█████╗░░██╔████╔██║
-- ██╔══██╗██║██║░░░░░██║░░░░░██║██║╚████║██║░░╚██╗  ░╚═══██╗░░╚██╔╝░░░╚═══██╗░░░██║░░░██╔══╝░░██║╚██╔╝██║
-- ██████╦╝██║███████╗███████╗██║██║░╚███║╚██████╔╝  ██████╔╝░░░██║░░░██████╔╝░░░██║░░░███████╗██║░╚═╝░██║
-- ╚═════╝░╚═╝╚══════╝╚══════╝╚═╝╚═╝░░╚══╝░╚═════╝░  ╚═════╝░░░░╚═╝░░░╚═════╝░░░░╚═╝░░░╚══════╝╚═╝░░░░░╚═╝
Config.BillingSystem = true            -- true or false | Do true if you want to use the billing system. or false if you don't want to use the billing system.
Config.BillingScript = 'okok' -- qbdefault - codem-billing - okok - esxdefault
Config.BillingJob = {
    ['mechanic'] = 'Mechanic',
    ['police'] = 'LSPD',
    --  you can add more jobs here like this ['jobname'] = 'Job label',
}
Citizen.CreateThread(function()
    if Config.BillingScript == 'codem-billing' then
        Config.HowManyDays = 7 -- after how many days will it double
        Config.Tax = 0.18      -- 18% tax
    end
end)

-- ██╗░░░░░░█████╗░░█████╗░███╗░░██╗░██████╗███████╗████████╗████████╗██╗███╗░░██╗░██████╗░░██████╗
-- ██║░░░░░██╔══██╗██╔══██╗████╗░██║██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗░██║██╔════╝░██╔════╝
-- ██║░░░░░██║░░██║███████║██╔██╗██║╚█████╗░█████╗░░░░░██║░░░░░░██║░░░██║██╔██╗██║██║░░██╗░╚█████╗░
-- ██║░░░░░██║░░██║██╔══██║██║╚████║░╚═══██╗██╔══╝░░░░░██║░░░░░░██║░░░██║██║╚████║██║░░╚██╗░╚═══██╗
-- ███████╗╚█████╔╝██║░░██║██║░╚███║██████╔╝███████╗░░░██║░░░░░░██║░░░██║██║░╚███║╚██████╔╝██████╔╝
-- ╚══════╝░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░╚══════╝░░░╚═╝░░░░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░
Config.LoanUtilization = false -- true or false |Do true if your players will use the credit system. or false if you want to use the loan system.
Config.LoadDataWaitTime = 86400 -- 1 day
Config.LoanData = {
    {
        label = "Fleeca Entry",
        value = 10000,
        backgroundImage = "fleecaentry.png",
        label2 = "0% Interest",
        job = 'all',
        interest = 0,         -- % interest
        loantime = 86400,     -- 1 day
        paymentPerDay = 0.05, -- % payment per loantime
    },
    {
        label = "Fleeca Welcome",
        value = 20000,
        backgroundImage = "fleecawelcome.png",
        label2 = "0% Interest",
        job = 'all',
        interest = 0,         -- % interest
        loantime = 86400,     -- 1 day
        paymentPerDay = 0.05, -- % payment per loantime
    },
    {
        label = "Fleeca 50",
        value = 50000,
        backgroundImage = "fleeca50.png",
        label2 = "1% Interest",
        job = 'all',
        interest = 1,         -- % interest
        loantime = 86400,     -- 1 day
        paymentPerDay = 0.05, -- % payment per loantime
    },
    {
        label = "Fleeca Officer Loan",
        value = 50000,
        backgroundImage = "fleecaofficer.png",
        job = 'police',
        label2 = "0% Interest",
        interest = 0,         -- % interest
        loantime = 86400,     -- 1 day
        paymentPerDay = 0.05, -- % payment per loantime
    },
    {
        label = "Fleeca 75",
        value = 75000,
        backgroundImage = "fleeca75.png",
        job = 'all',
        label2 = "1% Interest",
        interest = 1,         -- % interest
        loantime = 86400,     -- 1 day
        paymentPerDay = 0.05, -- % payment per loantime
    },
    {
        label = "Pacific 100",
        value = 100000,
        backgroundImage = "fleeca100.png",
        job = 'all',
        label2 = "3% Interest",
        interest = 3,         -- % interest
        loantime = 86400,     -- 1 day
        paymentPerDay = 0.05, -- % payment per loantime
    },
    {
        label = "Pacific Supports EMS",
        value = 50000,
        backgroundImage = "fleeca50+50.png",
        job = 'ambulance',
        label2 = "12% Interest",
        interest = 12,        -- % interest
        loantime = 86400,     -- 1 day
        paymentPerDay = 0.05, -- % payment per loantime
    },
    {
        label = "Pacific 200",
        value = 200000,
        backgroundImage = "fleeca200.png",
        job = 'all',
        label2 = "7% Interest",
        interest = 7,         -- % interest
        loantime = 86400,     -- 1 day
        paymentPerDay = 0.05, -- % payment per loantime
    },
    {
        label = "Pacific Millionaire",
        value = 1000000,
        backgroundImage = "fleeca1000.png",
        job = 'all',
        label2 = "12% Interest",
        interest = 12,        -- % interest
        loantime = 86400,     -- 1 day
        paymentPerDay = 0.05, -- % payment per loantime
    },
}

-- ░██████╗░█████╗░██╗░░░██╗██╗███╗░░██╗░██████╗░░██████╗███████╗████████╗████████╗██╗███╗░░██╗░██████╗░░██████╗
-- ██╔════╝██╔══██╗██║░░░██║██║████╗░██║██╔════╝░██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗░██║██╔════╝░██╔════╝
-- ╚█████╗░███████║╚██╗░██╔╝██║██╔██╗██║██║░░██╗░╚█████╗░█████╗░░░░░██║░░░░░░██║░░░██║██╔██╗██║██║░░██╗░╚█████╗░
-- ░╚═══██╗██╔══██║░╚████╔╝░██║██║╚████║██║░░╚██╗░╚═══██╗██╔══╝░░░░░██║░░░░░░██║░░░██║██║╚████║██║░░╚██╗░╚═══██╗
-- ██████╔╝██║░░██║░░╚██╔╝░░██║██║░╚███║╚██████╔╝██████╔╝███████╗░░░██║░░░░░░██║░░░██║██║░╚███║╚██████╔╝██████╔╝
-- ╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░╚══════╝░░░╚═╝░░░░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░
Config.SavingSytem = true -- true or false | Do true if you want to use the saving system. or false if you don't want to use the saving system.
Config.SavingData = {
    {
        label = "Save 10% With Flecca",
        value = 10000,
        backgroundImage = "fleecaentry.png",
        job = 'all',
        label2 = "7 day of block time max $ 10.000",
        savingInterest = 10, -- % interest
        savingday = 7,       -- day
    },
    {
        label = "Save 5% With Flecca",
        value = 15000,
        backgroundImage = "fleecawelcome.png",
        job = 'all',
        label2 = "7 day of block time max $ 15.000",
        savingInterest = 5, -- % interest
        savingday = 5,      -- day
    },
    {
        label = "Save 15% With Flecca",
        value = 10000,
        backgroundImage = "fleeca50.png",
        job = 'all',
        label2 = "14 day of block time max $ 10.000",
        savingInterest = 15, -- % interest
        savingday = 14,      -- day
    },
    {
        label = "Save 20% With Flecca",
        value = 12500,
        backgroundImage = "fleecaofficer.png",
        job = 'all',
        label2 = "14 day of block time max $ 12.500",
        savingInterest = 20, -- % interest
        savingday = 21,      -- day
    },
    {
        label = "Save 25% Officers",
        value = 15000,
        job = 'police',
        backgroundImage = "fleeca75.png",
        label2 = "14 day of block time max $ 15.000",
        savingInterest = 25, -- % interest
        savingday = 14,      -- day
    },
    {
        label = "Save 30% With Pacific",
        value = 15000,
        job = 'all',
        backgroundImage = "fleeca100.png",
        label2 = "30 day of block time max $ 15.000",
        savingInterest = 30, -- % interest
        savingday = 30,      -- day
    },
    {
        label = "Save Lives Save %25",
        value = 15000,
        job = 'ambulance',
        backgroundImage = "fleeca50+50.png",
        label2 = "14 day of block time max $ 15.000",
        savingInterest = 25, -- % interest
        savingday = 14,      -- day
    },
    {
        label = "Save %35 With Pacific",
        value = 15000,
        backgroundImage = "fleeca200.png",
        job = 'all',
        label2 = "45 day of block time max $ 15.000",
        savingInterest = 35, -- % interest
        savingday = 45,      -- day
    },
    {
        label = "Save %40 With Pacific",
        value = 12500,
        job = 'all',
        backgroundImage = "fleeca1000.png",
        label2 = "30 day of block time max $ 12.500",
        savingInterest = 40, -- % interest
        savingday = 30,      -- day
    },
}


-- ██████╗░██╗████████╗░█████╗░░█████╗░██╗███╗░░██╗  ░██████╗██╗░░░██╗░██████╗████████╗███████╗███╗░░░███╗
-- ██╔══██╗██║╚══██╔══╝██╔══██╗██╔══██╗██║████╗░██║  ██╔════╝╚██╗░██╔╝██╔════╝╚══██╔══╝██╔════╝████╗░████║
-- ██████╦╝██║░░░██║░░░██║░░╚═╝██║░░██║██║██╔██╗██║  ╚█████╗░░╚████╔╝░╚█████╗░░░░██║░░░█████╗░░██╔████╔██║
-- ██╔══██╗██║░░░██║░░░██║░░██╗██║░░██║██║██║╚████║  ░╚═══██╗░░╚██╔╝░░░╚═══██╗░░░██║░░░██╔══╝░░██║╚██╔╝██║
-- ██████╦╝██║░░░██║░░░╚█████╔╝╚█████╔╝██║██║░╚███║  ██████╔╝░░░██║░░░██████╔╝░░░██║░░░███████╗██║░╚═╝░██║
-- ╚═════╝░╚═╝░░░╚═╝░░░░╚════╝░░╚════╝░╚═╝╚═╝░░╚══╝  ╚═════╝░░░░╚═╝░░░╚═════╝░░░░╚═╝░░░╚══════╝╚═╝░░░░░╚═╝
Config.BitcoinSystem = false
Config.BitcoinData = {
    {
        label = "Bitcoin",
        value = 0,
        backgroundImage = "bitcoinbg.png",
        requestname = "BTC",
        label2 = "1 BTC"
    },
    {
        label = "Ethereum",
        value = 0,
        backgroundImage = "etherbg.png",
        requestname = "ETH",
        label2 = "1 ETH"
    },
    {
        label = "TetherUs",
        value = 0,
        backgroundImage = "tetherbg.png",
        requestname = "USDT",
        label2 = "1 USDT"
    },
    {
        label = "Ripple",
        value = 0,
        backgroundImage = "ripplebg.png",
        requestname = "XRP",
        label2 = "1 XRP"
    },
    {
        label = "Binance",
        value = 0,
        backgroundImage = "binancebg.png",
        requestname = "BNB",
        label2 = "1 BNB"
    },
    {
        label = "USD Coin",
        value = 0,
        backgroundImage = "usdcoinbg.png",
        requestname = "USDC",
        label2 = "1 USDC"
    },
    {
        label = "Cardano",
        value = 0,
        backgroundImage = "cardanobg.png",
        requestname = "ADA",
        label2 = "1 ADA"
    },
    {
        label = "Solana",
        value = 0,
        backgroundImage = "solanabg.png",
        requestname = "SOL",
        label2 = "1 SOL"
    },

    {
        label = "Doge",
        value = 0,
        backgroundImage = "dogebg.png",
        requestname = "DOGE",
        label2 = "1 DOGE"
    }
}


-- ░██████╗░█████╗░░█████╗░██╗███████╗████████╗██╗░░░██╗░██████╗███████╗████████╗████████╗██╗███╗░░██╗░██████╗░░██████╗
-- ██╔════╝██╔══██╗██╔══██╗██║██╔════╝╚══██╔══╝╚██╗░██╔╝██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗░██║██╔════╝░██╔════╝
-- ╚█████╗░██║░░██║██║░░╚═╝██║█████╗░░░░░██║░░░░╚████╔╝░╚█████╗░█████╗░░░░░██║░░░░░░██║░░░██║██╔██╗██║██║░░██╗░╚█████╗░
-- ░╚═══██╗██║░░██║██║░░██╗██║██╔══╝░░░░░██║░░░░░╚██╔╝░░░╚═══██╗██╔══╝░░░░░██║░░░░░░██║░░░██║██║╚████║██║░░╚██╗░╚═══██╗
-- ██████╔╝╚█████╔╝╚█████╔╝██║███████╗░░░██║░░░░░░██║░░░██████╔╝███████╗░░░██║░░░░░░██║░░░██║██║░╚███║╚██████╔╝██████╔╝
-- ╚═════╝░░╚════╝░░╚════╝░╚═╝╚══════╝░░░╚═╝░░░░░░╚═╝░░░╚═════╝░╚══════╝░░░╚═╝░░░░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░
Config.SocietySystem = true -- true or false | Do true if you want to use the society system. or false if you don't want to use the society system.
Config.SocietyAccountJob = {
    { name = 'police',   grade = { 3, 4 }, label = 'LSPD' },
    { name = 'mechanic', grade = { 4 },    label = 'MECHANIC' }
}


-- ███╗░░██╗░█████╗░████████╗██╗███████╗██╗░█████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗
-- ████╗░██║██╔══██╗╚══██╔══╝██║██╔════╝██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
-- ██╔██╗██║██║░░██║░░░██║░░░██║█████╗░░██║██║░░╚═╝███████║░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
-- ██║╚████║██║░░██║░░░██║░░░██║██╔══╝░░██║██║░░██╗██╔══██║░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
-- ██║░╚███║╚█████╔╝░░░██║░░░██║██║░░░░░██║╚█████╔╝██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
-- ╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░
Config.NotificationText = {
    ['beforewait'] = {
        text = "Please wait before sending another request.",
        type = "error"
    },
    ['contactserveradmin'] = {
        text = "Contact the server administrator!",
        type = "error"
    },
    ['blockaccount'] = {
        text = "Your account has been blocked!",
        type = "error"
    },
    ['changeiban'] = {
        text = "You changed the player's iban",
        type = "success"
    },
    ['wrongpassword'] = {
        text = "Wrong Password",
        type = "error"
    },
    ['notpincode'] = {
        text = "User does not have a defined pincode",
        type = "error"
    },
    ['wrongiban'] = {
        text = "Wrong IBAN",
        type = "error"
    },
    ['THISIBANISALREADYINUSE'] = {
        text = "This IBAN is already in use by another player.",
        type = "error"
    },
    ['NEWIBANMUSTCONSISTOF6DIGITS'] = {
        text = "The new IBAN must consist of 6-digit numbers only.",
        type = "error"
    },
    ['USECORRECTLYCHANGEIBAN'] = {
        text = "Use correctly: /changeiban [player id] [new iban]",
        type = "error"
    },
    ['THISISALREADYTHEPLAYERSIBAN'] = {
        text = "This is already the player's IBAN",
        type = "error"
    },
}


-- ███╗░░██╗░█████╗░████████╗██╗███████╗██╗░█████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗
-- ████╗░██║██╔══██╗╚══██╔══╝██║██╔════╝██║██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
-- ██╔██╗██║██║░░██║░░░██║░░░██║█████╗░░██║██║░░╚═╝███████║░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
-- ██║╚████║██║░░██║░░░██║░░░██║██╔══╝░░██║██║░░██╗██╔══██║░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
-- ██║░╚███║╚█████╔╝░░░██║░░░██║██║░░░░░██║╚█████╔╝██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
-- ╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░
Config.Notification = function(message, type, isServer, src) -- You can change here events for notifications
    if isServer then
        if Config.Framework == "esx" then
            TriggerClientEvent("esx:showNotification", src, message)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
        end
    else
        if Config.Framework == "esx" then
            TriggerEvent("esx:showNotification", message)
        else
            TriggerEvent('QBCore:Notify', message, type, 1500)
        end
    end
end
