function Creature:onChangeOutfit(outfit)
    if hasEventCallback(EVENT_CALLBACK_ONCHANGEMOUNT) then
        if not EventCallback(EVENT_CALLBACK_ONCHANGEMOUNT, self, outfit.lookMount) then
            return false
        end
    end
    if hasEventCallback(EVENT_CALLBACK_ONCHANGEOUTFIT) then
        return EventCallback(EVENT_CALLBACK_ONCHANGEOUTFIT, self, outfit)
    else
        return true
    end
end

function Creature:onAreaCombat(tile, isAggressive)
    if hasEventCallback(EVENT_CALLBACK_ONAREACOMBAT) then
        return EventCallback(EVENT_CALLBACK_ONAREACOMBAT, self, tile, isAggressive)
    else
        return RETURNVALUE_NOERROR
    end
end

function Creature:onTargetCombat(target)
    if not target then
        print("Erro: target é nil na função onTargetCombat")
        return RETURNVALUE_NOERROR
    end

    -- Verifica se o target é um NPC e se self é um jogador
    if target:isNpc() and self:isPlayer() then
        self:say("Hi", TALKTYPE_MONSTER_SAY)
    end

    -- Verifica se o target é um jogador e se self é um jogador
    if target:isPlayer() and self:isPlayer() then
        local attackerPlayer = Player(self)
        local targetPlayer = Player(target)
        
        if attackerPlayer and attackerPlayer:isPlayer() then
            local attackerParty = attackerPlayer:getParty()
            local targetParty = targetPlayer:getParty()
            
            if attackerParty and attackerParty == targetParty then
                return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
            end

            if attackerPlayer == targetPlayer then
                return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
            end

            if targetPlayer:hasSecureMode() then
                return RETURNVALUE_TURNSECUREMODETOATTACKUNMARKEDPLAYERS
            end
        end
    end

    if hasEventCallback(EVENT_CALLBACK_ONTARGETCOMBAT) then
        return EventCallback(EVENT_CALLBACK_ONTARGETCOMBAT, self, target)
    else
        return RETURNVALUE_NOERROR
    end
end

function Creature:onHear(speaker, words, type)
    if hasEventCallback(EVENT_CALLBACK_ONHEAR) then
        EventCallback(EVENT_CALLBACK_ONHEAR, self, speaker, words, type)
    end
end
