local config = {
    actionId = 18563, 
    lever = {
        left = 9825,
        right = 9826
    },
    playItem = {
        itemId = 28058, 
        count = 1
    },
    rouletteOptions = {
        rareItemChance_broadcastThreshold = 5000,
        ignoredItems = {18007, 18008}, 
        winEffects = {83, 313, 314, 315, 313}, 
        effectDelay = 304,
        spinTime = {min = 9, max = 9}, 
        spinSlowdownRamping = 3,
        rouletteStorage = 48551
    },
    prizePool = {
        {itemId = 27761, count = {1, 1},   chance = 6000},
        {itemId = 27762, count = {1, 1},    chance = 6000 },
        {itemId = 27763, count = {1, 1},    chance = 6000 }, 
        {itemId = 27764, count = {1, 1},    chance = 6000 }, 
        {itemId = 27765, count = {1, 1},   chance = 6000 }, 
        {itemId = 27766, count = {1, 1}, chance = 6000 }, 
        {itemId = 27767, count = {1, 1},    chance = 6000 }, 
        {itemId = 27768, count = {1, 1},   chance = 2500},
        {itemId = 27769, count = {1, 1},    chance = 2500 },
        {itemId = 27770, count = {1, 1},    chance = 2500 }, 
        {itemId = 27771, count = {1, 1},    chance = 2500 }, 
        {itemId = 27772, count = {1, 1},   chance = 2500 }, 
        {itemId = 27773, count = {1, 1}, chance = 2500 }, 
        {itemId = 27774, count = {1, 1},    chance = 2500 }, 
        {itemId = 27775, count = {1, 1},   chance = 900},
        {itemId = 27776, count = {1, 1},    chance = 900 },
        {itemId = 27777, count = {1, 1},    chance = 900 }, 
        {itemId = 27778, count = {1, 1},    chance = 900 }, 
        {itemId = 27779, count = {1, 1},   chance = 900 }, 
        {itemId = 27780, count = {1, 1}, chance = 900 }, 
        {itemId = 27781, count = {1, 1},    chance = 900 }, 
    
    },
    roulettePositions = { 
    Position(287, 1372, 7),
    Position(287, 1373, 7),
    Position(287, 1374, 7),
    Position(287, 1375, 7),
    Position(287, 1376, 7),
    Position(287, 1377, 7),
    Position(287, 1378, 7),
    Position(287, 1379, 7),
    Position(287, 1380, 7),
    Position(287, 1381, 7),
    Position(287, 1382, 7),
    Position(287, 1383, 7),
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