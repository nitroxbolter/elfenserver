function onEquip(player, item, slot, isCheck)
    if isCheck then
        return true
    end
    player:setStorageValue(Ships.TheAwakener, 1)
    if player:getStorageValue(110011) == 0 or player:getStorageValue(110011) == -1 then
        player:setStorageValue(110011, 1)
    end
    return true
end

function onDeEquip(player, item, slot)
    player:setStorageValue(Ships.TheAwakener, 0)
    return true
end