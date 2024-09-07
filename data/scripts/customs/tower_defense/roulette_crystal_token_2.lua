local config = {
    actionId = 18566, 
    lever = {
        left = 1945,
        right = 1946
    },
    playItem = {
        itemId = 28372, 
        count = 15
    },
    rouletteOptions = {
        rareItemChance_broadcastThreshold = 5000,
        ignoredItems = {18007, 18008}, 
        winEffects = {86, 300, 300, 300, 300}, 
        effectDelay = 302,
        spinTime = {min = 9, max = 9}, 
        spinSlowdownRamping = 3,
        rouletteStorage = 48753
    },
    prizePool = {
        {itemId = 28385, count = {1, 1},    chance = 9000}, 
        {itemId = 28393, count = {1, 1},    chance = 9000 }, 
        {itemId = 28389, count = {1, 1},    chance = 9000 }, 
        {itemId = 28384, count = {1, 1},    chance = 6000 }, 
        {itemId = 28392, count = {1, 1},    chance = 6000 }, 
        {itemId = 28388, count = {1, 1},    chance = 6000 }, 
        {itemId = 28379, count = {1, 1},    chance = 6000 }, 
        {itemId = 28386, count = {1, 1},    chance = 4500 }, 
        {itemId = 28390, count = {1, 1},    chance = 4500 }, 
        {itemId = 28383, count = {1, 1},    chance = 4500  },
        {itemId = 28383, count = {1, 1},    chance = 3500  },
        {itemId = 28391, count = {1, 1},    chance = 3500  },
        {itemId = 28387, count = {1, 1},    chance = 3500  },
        {itemId = 28381, count = {1, 1},    chance = 3500  }, 
        {itemId = 28380, count = {1, 1},    chance = 3500  },  
        {itemId = 28374, count = {1, 1},    chance = 2500  },  
        {itemId = 28378, count = {1, 1},    chance = 2500  },  
        {itemId = 28376, count = {1, 1},    chance = 2500  },  
        {itemId = 28375, count = {1, 1},    chance = 2500  },  
        {itemId = 28377, count = {1, 1},    chance = 2500  },  
        {itemId = 28373, count = {1, 1},    chance = 2500  },  
        {itemId = 28369, count = {1, 1},    chance = 2500  },
        {itemId = 28370, count = {1, 1},    chance = 2000  },
    },
    roulettePositions = { 
    Position(137, 1233, 8),
    Position(137, 1234, 8),
    Position(137, 1235, 8),
    Position(137, 1236, 8),
    Position(137, 1237, 8),
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
            if i ~= #positions then
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
        -- Adjust the effect application to be vertical
        for i = 1, #config.roulettePositions do
            config.roulettePositions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
        end
        if effectCounter == 2 then
            local item = Tile(config.roulettePositions[#config.roulettePositions]):getTopVisibleThing()
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
    
    local item = Tile(config.roulettePositions[#config.roulettePositions]):getTopVisibleThing()
    
    if ItemType(item:getId()):hasShowCharges() then
        local addedItem = player:addItem(item:getId(), 1, true)
        addedItem:setAttribute("charges", item:getCharges())
    else
        player:addItem(item:getId(), item:getCount(), true)
    end

    player:setStorageValue(config.rouletteOptions.rouletteStorage, -1)
    if chancedItems[#chancedItems - 3] <= config.rouletteOptions.rareItemChance_broadcastThreshold then
        Game.broadcastMessage("The player " .. player:getName() .. " has won " .. item:getName() .. " from the exercise roulette!", MESSAGE_EVENT_ADVANCE)
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
    playSound(player, "prize.ogg")
    initiateReward(leverPosition, 0)
    rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Exercise Roulette is currently in progress. Please wait.")
        return true
    end
    
    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        if player:getStorageValue(config.rouletteOptions.rouletteStorage) < 1 then
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "Exercise Roulette requires " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to use.")
            return true
        end
        -- player:sendTextMessage(MESSAGE_STATUS_SMALL, "Free Spin being used due to a previous unforeseen error.")
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