local pastryTeleports = MoveEvent()

function pastryTeleports.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
		return false
	end
    if creature:getStorageValue(78195) == 1 then
        creature:teleportTo(Position(268, 1935, 7))
        creature:setStorageValue(78195, 2)
    elseif creature:getStorageValue(78195) == 7 then
        creature:teleportTo(Position(242, 2045, 8))
    else
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You should start a mission with candis in order to use the teleport.")
        creature:teleportTo(fromPosition)
    end
end

pastryTeleports:aid(38660)
pastryTeleports:register()

local pastryTeleports = MoveEvent()

function pastryTeleports.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
		return false
	end
    if creature:getStorageValue(78195) == 2 then
        creature:teleportTo(Position(236, 1935, 7))
        creature:setStorageValue(78195, 3)
    else
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You need continue to find the boss room.")
        creature:teleportTo(fromPosition)
    end
end

pastryTeleports:aid(38661)
pastryTeleports:register()

local pastryTeleports = MoveEvent()

function pastryTeleports.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
		return false
	end
    if creature:getStorageValue(78195) == 3 then
        creature:teleportTo(Position(156, 2035, 6))
        creature:setStorageValue(78195, 4)
    else
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You need continue to find the boss room.")
        creature:teleportTo(fromPosition)
    end
end

pastryTeleports:aid(38662)
pastryTeleports:register()

local pastryTeleports = MoveEvent()

function pastryTeleports.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
		return false
	end
    if creature:getStorageValue(78195) == 4 then
        creature:teleportTo(Position(135, 2056, 7))
        creature:setStorageValue(78195, 5)
    else
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You need continue to find the boss room.")
        creature:teleportTo(fromPosition)
    end
end

pastryTeleports:aid(38663)
pastryTeleports:register()

local pastryTeleports = MoveEvent()

function pastryTeleports.onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
		return false
	end
    if creature:getStorageValue(78195) == 5 then
        creature:teleportTo(Position(172, 2059, 7))
        creature:setStorageValue(78195, 6)
    else
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You need continue to find the boss room.")
        creature:teleportTo(fromPosition)
    end
end

pastryTeleports:aid(38664)
pastryTeleports:register()

local pastryTeleports = MoveEvent()

function pastryTeleports.onStepIn(creature, item, position, fromPosition)
    
    if creature:getStorageValue(78195) == 6 then
        creature:teleportTo(Position(188, 2073, 7))
        creature:setStorageValue(78195, 7)
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You founded the boss room.")
    else
        creature:sendTextMessage(MESSAGE_INFO_DESCR, "You need continue to find the boss room.")
        creature:teleportTo(fromPosition)
    end
end

pastryTeleports:aid(38665)
pastryTeleports:register()
