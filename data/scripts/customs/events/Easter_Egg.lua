local config = {
    ["crustacea gigantica"] = {
        chance = 5000,
        tiers = {
            [{1, 10000}] = {
                tier = {"Rare", true},
                effect = {192, true},
                itemList = {{27985, 1, 1, 10000}, {27986, 1, 1, 10000}, {27987, 1, 3, 25000}, {27988, 1, 1, 5000}, {27989, 1, 1, 10000}},
                bag = 26691 
            }
        }
    },
    
}

local creatureevent = CreatureEvent("onDeath_EasterEgg")

function creatureevent.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    local monster = config[creature:getName():lower()]
    if monster then
        if math.random(10000) > monster.chance then
            return true
        end
        local rand = math.random(10000)
        for chance, index in pairs(monster.tiers) do
            if chance[1] <= rand and chance[2] >= rand then
                local rewardItems = {}
                for i = 1, #index.itemList do
                    if math.random(10000) <= index.itemList[i][4] then
                        rewardItems[#rewardItems + 1] = i
                    end
                end
                if rewardItems[1] then
                    rand = math.random(#rewardItems)
                    local itemId = index.itemList[rand][1]
                    local itemCount = math.random(index.itemList[rand][2], index.itemList[rand][3])
                    
                    local position = creature:getPosition()
                    local direction = math.random(0, 3)
                    if direction == 0 then
                        position.y = position.y - 1
                    elseif direction == 1 then
                        position.x = position.x + 1
                    elseif direction == 2 then
                        position.y = position.y + 1
                    else
                        position.x = position.x - 1
                    end
                    local bagId = index.bag
                    local bag = Game.createItem(bagId, 1, position)
                    bag:addItem(itemId, itemCount)
                    
                    local bagPosition = bag:getPosition()
                    if index.tier[2] == true then
                        creature:say(index.tier[1], TALKTYPE_MONSTER_SAY, false, nil, creature:getPosition())
                        addEvent(function()
                            creature:say("", TALKTYPE_MONSTER_SAY, false, nil, creature:getPosition())
                        end, 10000)
                    end
                    if index.effect[2] == true then
                        for i = 1, 12 do
                            addEvent(function() bagPosition:sendMagicEffect(index.effect[1]) end, (i - 1) * 1600)
                        end
                    end
                end
                return true
            end
        end
    end
    return true
end

creatureevent:register()