local entranceTower = MoveEvent()

function entranceTower.onStepIn(player, item, position, fromPosition)
    local cooldownEntrance = 184320
    local currentTime = os.time()
    local cooldownTime = player:getStorageValue(cooldownEntrance)
    local remainingTime = cooldownTime - currentTime
	if player:isPlayer() then
        if player:getStorageValue(cooldownEntrance) < os.time() then
		player:teleportTo(Position(143, 1204, 8))
        player:setStorageValue(88709, 1)
        else
            player:teleportTo(fromPosition)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "There is a cooldown of " .. remainingTime .. " seconds for entry to the tower defense.")
        end
	end
	return true
end

entranceTower:type("stepin")
entranceTower:aid(25485)
entranceTower:register()


local entranceTower = MoveEvent()

function entranceTower.onStepIn(player, item, position, fromPosition)
    local cooldownEntrance = 184320
	if player:isPlayer() then
        player:setStorageValue(cooldownEntrance, os.time() + 30)
        player:teleportTo(Position(144, 1229, 8))
        player:setStorageValue(88709, 0)
	end
	return true
end

entranceTower:type("stepin")
entranceTower:aid(25486)
entranceTower:register()