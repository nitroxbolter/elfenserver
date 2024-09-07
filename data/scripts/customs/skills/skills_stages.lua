local skillStages = {
    [SKILL_FIST] = {
        [{  1,   60}] = {multiplier = 100},
        [{  61,  80}] = {multiplier = 75},
        [{ 81,  100}] = {multiplier = 45},
        [{ 101, 110}] = {multiplier = 25},
        [{111, 125}]  = {multiplier = 18},
        [{126, 149}]  = {multiplier = 12},
        [{150}]       = {multiplier = 5}
    },
    [SKILL_CLUB] = {
        [{  1,   60}] = {multiplier = 100},
        [{  61,  80}] = {multiplier = 75},
        [{ 81,  100}] = {multiplier = 45},
        [{ 101, 110}] = {multiplier = 25},
        [{111, 125}]  = {multiplier = 18},
        [{126, 149}]  = {multiplier = 12},
        [{150}]       = {multiplier = 5}
    },
    [SKILL_SWORD] = {
        [{  1,   60}] = {multiplier = 100},
        [{  61,  80}] = {multiplier = 75},
        [{ 81,  100}] = {multiplier = 45},
        [{ 101, 110}] = {multiplier = 25},
        [{111, 125}]  = {multiplier = 18},
        [{126, 149}]  = {multiplier = 12},
        [{150}]       = {multiplier = 5}
    },
    [SKILL_AXE] = {
        [{  1,   60}] = {multiplier = 100},
        [{  61,  80}] = {multiplier = 75},
        [{ 81,  100}] = {multiplier = 45},
        [{ 101, 110}] = {multiplier = 25},
        [{111, 125}]  = {multiplier = 18},
        [{126, 149}]  = {multiplier = 12},
        [{150}]       = {multiplier = 5}
    },
    [SKILL_DISTANCE] = {
        [{  1,   60}] = {multiplier = 100},
        [{  61,  80}] = {multiplier = 75},
        [{ 81,  100}] = {multiplier = 45},
        [{ 101, 110}] = {multiplier = 25},
        [{111, 125}]  = {multiplier = 18},
        [{126, 149}]  = {multiplier = 12},
        [{150}]       = {multiplier = 5}
    },
    [SKILL_SHIELD] = {
        [{  1,   60}] = {multiplier = 100},
        [{  61,  80}] = {multiplier = 75},
        [{ 81,  100}] = {multiplier = 45},
        [{ 101, 110}] = {multiplier = 25},
        [{111, 125}]  = {multiplier = 18},
        [{126, 149}]  = {multiplier = 12},
        [{150}]       = {multiplier = 5}
    },
    [SKILL_FISHING] = {
        [{  1,   60}] = {multiplier = 100},
        [{  61,  80}] = {multiplier = 75},
        [{ 81,  100}] = {multiplier = 45},
        [{ 101, 110}] = {multiplier = 25},
        [{111, 125}]  = {multiplier = 18},
        [{126, 149}]  = {multiplier = 12},
        [{150}]       = {multiplier = 5}
    },
    [SKILL_MAGLEVEL] = {
        [{  1,   60}] = {multiplier = 70},
        [{  61,  80}] = {multiplier = 50},
        [{ 81,  100}] = {multiplier = 35},
        [{ 101, 110}] = {multiplier = 20},
        [{111, 125}]  = {multiplier = 14},
        [{126, 149}]  = {multiplier = 8},
        [{150}]       = {multiplier = 3}
    }
}


local ec = EventCallback

ec.onGainSkillTries = function(self, skill, tries)
    if not skillStages[skill] then
        return tries
    end
    local playerLevel = skill == SKILL_MAGLEVEL and self:getMagicLevel() or self:getSkillLevel(skill)
    for k, v in pairs(skillStages[skill]) do
        if playerLevel >= k[1] then
            if not k[2] or playerLevel <= k[2] then
                tries = tries * v.multiplier
            end
        end
    end  
    return tries
end

ec:register()