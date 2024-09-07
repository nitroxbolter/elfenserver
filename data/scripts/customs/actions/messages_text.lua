local textFloat = GlobalEvent("textFloat")

local effects = {
      {position = Position(2024, 373, 7), text = 'Leave Kindernia, down stairs!', effect = 317},
    {position = Position(1093, 407, 5), text = 'Collect First Items!', effect = 257},
    {position = Position(671, 423, 7), text = 'Collect First Items!', effect = 257},
    {position = Position(375, 323, 7), text = 'Collect First Items!', effect = 257},
    {position = Position(1220, 1027, 5), text = 'Collect First Items!', effect = 257},
    {position = Position(1093, 407, 7), text = 'Collect First Items!', effect = 257},
    {position = Position(1090, 429, 7), text = 'Trainers', effect = 223},
    {position = Position(1090, 433, 7), text = 'Npc Khadin & Armin', effect = 228},
}

function textFloat.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

textFloat:interval(6000)
textFloat:register()