local config = {
    actionId = 18562, 
    lever = {
        left = 9825,
        right = 9826
    },
    playItem = {
        itemId = 28033, 
        count = 1
    },
    rouletteOptions = {
        rareItemChance_broadcastThreshold = 5000,
        ignoredItems = {18007, 18008},
        winEffects = {84, 223, 223, 223, 223}, 
        effectDelay = 201,
        spinTime = {min = 9, max = 9}, 
        spinSlowdownRamping = 3,
        rouletteStorage = 48550 
    },
    prizePool = {
        {itemId = 27633, count = {1, 1},    chance = 7000},
        {itemId = 27822, count = {1, 1},    chance = 6800 }, 
        {itemId = 27808, count = {1, 1},    chance = 6500 }, 
        {itemId = 27804, count = {1, 1},    chance = 6100 },
        {itemId = 27634, count = {1, 1},    chance = 5800 }, 
        {itemId = 27812, count = {1, 1},    chance = 5000 }, 
        {itemId = 27826, count = {1, 1},    chance = 4800 }, 
        {itemId = 27797, count = {1, 1},    chance = 4400 }, 
        {itemId = 27817, count = {1, 1},    chance = 4100 }, 
        {itemId = 27831, count = {1, 1},    chance = 3500  },
        {itemId = 27835, count = {1, 1},    chance = 3000  },
        {itemId = 27839, count = {1, 1},    chance = 2500  },
        {itemId = 27547, count = {1, 1},    chance = 800  },
        {itemId = 27595, count = {1, 1},    chance = 800  },
        {itemId = 27613, count = {1, 1},    chance = 800  },
        {itemId = 27571, count = {1, 1},    chance = 800  },

    
    },
    roulettePositions = { 
    Position(295, 1372, 7),
    Position(296, 1372, 7),
    Position(297, 1372, 7),
    Position(298, 1372, 7), 
    Position(299, 1372, 7),
    Position(300, 1372, 7),
    Position(301, 1372, 7),
    Position(302, 1372, 7),
    Position(303, 1372, 7),
    Position(304, 1372, 7),
    Position(305, 1372, 7),
    Position(306, 1372, 7),
    Position(307, 1372, 7),
    Position(308, 1372, 7),
    }
}

local chancedItems = {} 

local function resetLever(position)
    local lever = Tile(position):getItemById(config.lever.right)
    lever:transform(config.lever.left)
end

local function updateRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            if i ~= 14 then
                item:moveTo(positions[i + 1])
            else
                item:remove()
            end
        end
    end
    if ItemType(newItemInfo.itemId):hasShowCharges() then
        local item = Game.createItem(newItemInfo.itemId, 1, positions[1])
        item:setAttribute("charges", newItemInfo.count)
    else
        Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[1])
    end
end

local function clearRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            item:remove()
        end
        if newItemInfo == nil then
            positions[i]:sendMagicEffect(CONST_ME_POFF)
        else
            if ItemType(newItemInfo.itemId):hasShowCharges() then
                local item = Game.createItem(newItemInfo.itemId, 1, positions[i])
                item:setAttribute("charges", newItemInfo.count)
            else
                Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[i])
            end
        end
    end
end

local function chanceNewReward()
    local newItemInfo = {itemId = 0, count = 0}
    
    local rewardTable = {}
    while #rewardTable < 1 do
        for i = 1, #config.prizePool do
            if config.prizePool[i].chance >= math.random(10000) then
                rewardTable[#rewardTable + 1] = i
            end
        end
    end
    
    local rand = math.random(#rewardTable)
    newItemInfo.itemId = config.prizePool[rewardTable[rand]].itemId
    newItemInfo.count = math.random(config.prizePool[rewardTable[rand]].count[1], config.prizePool[rewardTable[rand]].count[2])
    chancedItems[#chancedItems + 1] = config.prizePool[rewardTable[rand]].chance
    
    return newItemInfo
end

local function initiateReward(leverPosition, effectCounter)
    if effectCounter < #config.rouletteOptions.winEffects then
        effectCounter = effectCounter + 1
        if effectCounter == 1 then
            config.roulettePositions[1]:sendDistanceEffect(config.roulettePositions[7], config.rouletteOptions.winEffects[1])
            config.roulettePositions[7]:sendDistanceEffect(config.roulettePositions[7], config.rouletteOptions.winEffects[1])
        else
            for i = 1, #config.roulettePositions do
                config.roulettePositions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
            end
        end
        if effectCounter == 2 then
            local item = Tile(config.roulettePositions[7]):getTopVisibleThing()
            local newItemInfo = {itemId = item:getId(), count = item:getCount()}
            clearRoulette(newItemInfo)
        end
        addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter)
        return
    end
    resetLever(leverPosition)
end

local function rewardPlayer(playerId, leverPosition)
    local player = Player(playerId)
    if not player then
        return
    end
    
    local item = Tile(config.roulettePositions[7]):getTopVisibleThing()
    
    if ItemType(item:getId()):hasShowCharges() then
        local addedItem = player:addItem(item:getId(), 1, true)
        addedItem:setAttribute("charges", item:getCharges())
    else
        player:addItem(item:getId(), item:getCount(), true)
    end

    player:setStorageValue(config.rouletteOptions.rouletteStorage, -1)
    if chancedItems[#chancedItems - 3] <= config.rouletteOptions.rareItemChance_broadcastThreshold then
        Game.broadcastMessage("The player " .. player:getName() .. " has won " .. item:getName() .. " from the boss roulette!", MESSAGE_EVENT_ADVANCE)
    end
end

local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
    local player = Player(playerId)
    if not player then
        resetLever(leverPosition)
        return
    end
    
    local newItemInfo = chanceNewReward()
    updateRoulette(newItemInfo)
    
    if spinTimeRemaining > 0 then
        spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
        addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
        return
    end
    
    initiateReward(leverPosition, 0)
    playSound(player, "prize.ogg")
    rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Boss Roulette is currently in progress. Please wait.")
        return true
    end
    
    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        if player:getStorageValue(config.rouletteOptions.rouletteStorage) < 1 then
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "Boss Roulette requires " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to use.")
            return true
        end
    end
    
    item:transform(config.lever.right)
    clearRoulette()
    chancedItems = {}
    
    player:removeItem(config.playItem.itemId, config.playItem.count)
    player:setStorageValue(config.rouletteOptions.rouletteStorage, 1)
    playSound(player, "roulette.ogg")
    local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
    roulette(player:getId(), toPosition, spinTimeRemaining, 100)
    return true
end

casinoRoulette:aid(config.actionId)
casinoRoulette:register()


local disableMovingItemsToRoulettePositions = EventCallback

disableMovingItemsToRoulettePositions.onMoveItem = function(self, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    for v, k in pairs(config.roulettePositions) do
        if toPosition == k then
            return false
        end
    end
    return true
end

disableMovingItemsToRoulettePositions:register()