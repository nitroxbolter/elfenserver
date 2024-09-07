local config = {
    actionId = 41761, 
    bossName = "fury of the emperor",
    bossPosition = Position(355, 1443, 11), 
    bossName1 = "scorn of the emperor",
    bossPosition1 = Position(356, 1443, 11), 
    bossName2 = "wrath of the emperor",
    bossPosition2 = Position(357, 1443, 11), 
    bossName3 = "spite of the emperor",
    bossPosition3 = Position(358, 1443, 11), 
    bossArea = {
        fromPos = Position(350, 1437, 11), 
        toPos = Position(366, 1458, 11), 
        entrancePos = Position(358, 1457, 11), 
        exitPosition = Position(338, 1449, 11) 
    },
    participantsAllowAnyCount = true, 
    participantsPos = {
        Position(341, 1450, 11),
        Position(340, 1450, 11),
        Position(340, 1449, 11),
        Position(340, 1448, 11),
        Position(341, 1448, 11),
        Position(342, 1448, 11),
        Position(342, 1449, 11),
        Position(342, 1450, 11),
    },
    attempts = {
        level = 200, 
        storage = 720071, 
        seconds = 7200 -- 4h
    },
    createTeleportPos = Position(357, 1441, 11), 
    teleportToPosition = Position(351, 1463, 11), 
    teleportRemoveSeconds = 60, 
    kickParticipantAfterSeconds = 60 * 30, 
}

local function getSpectators()
    if not config.centerPosition then
        config.diffX = math.ceil((config.bossArea.toPos.x - config.bossArea.fromPos.x) / 2)
        config.diffY = math.ceil((config.bossArea.toPos.y - config.bossArea.fromPos.y) / 2)
        config.centerPosition = config.bossArea.fromPos + Position(config.diffX, config.diffY, 0)
    end
    return Game.getSpectators(config.centerPosition, false, false, config.diffX, config.diffX, config.diffY, config.diffY)
end

local astroBoss = Action()

function astroBoss.onUse(player, item, fromPos, target, toPos, isHotkey)
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
                player:sendCancelMessage(string.format("The player %s must wait 2 hours before being able to enter again.", participant:getName()))
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
    local boss1 = Game.createMonster(config.bossName1, config.bossPosition1)
    local boss2 = Game.createMonster(config.bossName2, config.bossPosition2)
    local boss3 = Game.createMonster(config.bossName3, config.bossPosition3)
    if not boss then error(Game.getReturnMessage(RETURNVALUE_NOTENOUGHROOM)) end
    if not boss1 then error(Game.getReturnMessage(RETURNVALUE_NOTENOUGHROOM)) end
    if not boss2 then error(Game.getReturnMessage(RETURNVALUE_NOTENOUGHROOM)) end
    if not boss3 then error(Game.getReturnMessage(RETURNVALUE_NOTENOUGHROOM)) end
    boss:registerEvent("furyDeath")
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

    return true
end

astroBoss:aid(config.actionId)
astroBoss:register()

local creatureEvent = CreatureEvent("furyDeath")

function creatureEvent.onDeath()
    stopEvent(config.kickEventId)
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
    return true
end

creatureEvent:register()
