Rewards = {}

Rewards.Trollys = {
    ['money'] = { -- Amount of bags rewarded when a player loots a trolly, minWorth and maxWorth decide the item.info.worth of the markedbills
        fleeca = { minAmount = 2, maxAmount = 2, minWorth = 5000, maxWorth = 6500 },
        maze = { minAmount = 3, maxAmount = 4, minWorth = 10000, maxWorth = 14000 },
        paleto = { minAmount = 15, maxAmount = 15, minWorth = 7000, maxWorth = 8000 },
        pacific = { minAmount = 5, maxAmount = 6, minWorth = 10000, maxWorth = 14000 },
        vault = { minAmount = 6, maxAmount = 7, minWorth = 10000, maxWorth = 14000 }
    },
    ['gold'] = { -- Amount of gold bars rewarded when a player loots a gold trolly
        fleeca = { minAmount = 8, maxAmount = 10 },
        maze = { minAmount = 9, maxAmount = 11 },
        paleto = { minAmount = 10, maxAmount = 12 },
        pacific = { minAmount = 11, maxAmount = 13 },
        vault = { minAmount = 12, maxAmount = 14 }
    }
}

Rewards.Lockers = {
    ['fleeca'] = {
        items = {'goldbar1', }, -- Every time a player unlocks a locker, a random item from this array will be drawn, you can add more items
        amount = { minAmount = 1, maxAmount = 2 },
        rareChance = 20,
        rareItem = 'usb_blue',
    },
    ['maze'] = {
        items = {'goldbar1', },
        amount = { minAmount = 10, maxAmount = 12 },
        rareChance = 30,
        rareItem = 'usb_blue',
    },
    ['paleto'] = {
        items = {'goldbar1', },
        amount = { minAmount = 1, maxAmount = 4 },
        rareChance = 20,
        rareItem = {'usb_red', 'pistolblueprint', 'smgblueprint' }
    },
    ['pacific'] = {
        items = {'goldbar1', },
        amount = { minAmount = 10, maxAmount = 14 },
        rareChance = 20,
        rareItem = {'usb_gold', 'rifleblueprint'}
    },
    ['vault'] = {
        items = {'goldbar1', },
        amount = { minAmount = 10, maxAmount = 14 },
        rareChance = 20,
        rareItem = 'goldbar1', -- You could use the vault to drop a rare item used in another heist!
    }
}

Rewards.Stacks = {
    ['money'] = { -- Amount of bags rewarded when a player loots a trolly, minWorth and maxWorth decide the item.info.worth of the markedbills
        fleeca = { minAmount = 2, maxAmount = 3, minWorth = 10000, maxWorth = 14000 },
        maze = { minAmount = 3, maxAmount = 4, minWorth = 10000, maxWorth = 14000 },
        paleto = { minAmount = 4, maxAmount = 5, minWorth = 10000, maxWorth = 14000 },
        pacific = { minAmount = 5, maxAmount = 6, minWorth = 10000, maxWorth = 14000 },
        vault = { minAmount = 6, maxAmount = 7, minWorth = 10000, maxWorth = 14000 }
    },
    ['gold'] = { -- Amount of gold bars rewarded when a player loots a gold trolly
        fleeca = { minAmount = 8, maxAmount = 10 },
        maze = { minAmount = 9, maxAmount = 11 },
        paleto = { minAmount = 10, maxAmount = 12 },
        pacific = { minAmount = 11, maxAmount = 13 },
        vault = { minAmount = 12, maxAmount = 14 }
    }
}
