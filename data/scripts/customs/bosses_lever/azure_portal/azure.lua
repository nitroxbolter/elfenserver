local config = {
    actionId = 43029, 
    bossName = "terror spider",
    bossPosition = Position(1028, 1045, 13), 
    bossArea = {
        fromPos = Position(1011, 1030, 13), 
        toPos = Position(1048, 1059, 13), 
        entrancePos = Position(1014, 1045, 13), 
        exitPosition = Position(1027, 1005, 13) 
    },
    participantsAllowAnyCount = true, 
    participantsPos = {
        Position(1024, 1004, 13),
        Position(1024, 1005, 13),
        Position(1024, 1006, 13), 
        Position(1024, 1007, 13), 
    },
    attempts = {
        level = 200, 
        storage = 720020, 
        seconds = 14400 -- 4h
    },
    createTeleportPos = Position(1031, 1036, 13), 
    teleportToPosition = Position(1028, 1003, 13), 
    teleportRemoveSeconds = 120, 
    kickParticipantAfterSeconds = 120 * 30, 
    leverIds = {1945, 1946} 
}

local function getSpectators()
    if not config.centerPosition then
        config.diffX = math.ceil((config.bossArea.toPos.x - config.bossArea.fromPos.x) / 2)
        config.diffY = math.ceil((config.bossArea.toPos.y - config.bossArea.fromPos.y) / 2)
        config.centerPosition = config.bossArea.fromPos + Position(config.diffX, config.diffY, 0)
    end
    return Game.getSpectators(config.centerPosition, false, false, config.diffX, config.diffX, config.diffY, config.diffY)
end

local azureBoss = Action()

function azureBoss.onUse(player, item, fromPos, target, toPos, isHotkey)
    local participants = {}
    for index, pos in pairs(config.participantsPos) do
        local tile = Tile(pos)
        if not tile then error("[Warning - Tile not found]") end
        local participant = tile:getTopVisibleCreature(player)
        if participant and participant:isPlayer() then
            if index == 1 and participant ~= player then
                player:sendCancelMessage("Only the first participant can pull the lever.")
                return true
            end

            if participant:getStorageValue(config.attempts.storage) >= os.time() then
                player:sendCancelMessage(string.format("The player %s must wait 4 hours before being able to enter again.", participant:getName()))
                return true
            elseif participant:getLevel() < config.attempts.level then
                player:sendCancelMessage(string.format("The player %s is not level %d.", participant:getName(), config.attempts.level))
                return true
            end
            participants[#participants +1] = participant    
        end
    end

    local spectators = getSpectators()
    for _, spectator in pairs(spectators) do
        if spectator:isPlayer() then
            player:sendCancelMessage("At this time the room is occupied, please try again later.")
            return true
        end
    end

    for _, spectator in pairs(spectators) do spectator:remove() end
    local boss = Game.createMonster(config.bossName, config.bossPosition)
    if not boss then error(Game.getReturnMessage(RETURNVALUE_NOTENOUGHROOM)) end
    for index, participant in pairs(participants) do
        config.participantsPos[index]:sendMagicEffect(CONST_ME_POFF)
        participant:teleportTo(config.bossArea.entrancePos, false)
        config.bossArea.entrancePos:sendMagicEffect(CONST_ME_TELEPORT)
        participant:setStorageValue(config.attempts.storage, os.time() + config.attempts.seconds)
        playSound(player, "lever.ogg")
    end

    config.kickEventId = addEvent(function ()
        for _, spectator in pairs(getSpectators()) do
            if spectator:isPlayer() then
                spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
                spectator:teleportTo(config.bossArea.exitPosition, false)
                config.bossArea.exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
                spectator:sendTextMessage(MESSAGE_INFO_DESCR, "It's been a long time and you haven't managed to defeat the boss.")
            else
                spectator:remove()
            end
        end
    end, config.kickParticipantAfterSeconds * 1000)

    item:transform(item:getId() == config.leverIds[1] and config.leverIds[2] or config.leverIds[1])
    return true
end

azureBoss:aid(config.actionId)
azureBoss:register()

local creatureEvent = CreatureEvent("AzureDeath")

function creatureEvent.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    stopEvent(config.kickEventId)

    if creature:getName():lower() == 'azure' then
        local teleport = Game.createItem(1387, 1, config.createTeleportPos)
        if teleport then
            teleport:setDestination(config.teleportToPosition)
            addEvent(function ()
                local tile = Tile(config.createTeleportPos)
                if tile then
                    local teleport = tile:getItemById(1387)
                    if teleport then
                        teleport:remove()
                        config.teleportToPosition:sendMagicEffect(CONST_ME_POFF)
                    end
                end

                for _, spectator in pairs(getSpectators()) do
                    if spectator:isPlayer() then
                        spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
                        spectator:teleportTo(config.teleportToPosition, false)
                        config.teleportToPosition:sendMagicEffect(CONST_ME_TELEPORT)
                    end
                end
            end, config.teleportRemoveSeconds * 1000)
        end
    end

    return true
end



creatureEvent:register()

