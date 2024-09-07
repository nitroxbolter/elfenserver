

function onSay(player, words, param)
    
    local text = '               Ancestral Tasks Information               \n\n - Ranking: '..getRankTask(player)..'.\n - Ancestral Rank Points: '..taskRank_get(player)..'.\n\n                                 Points                                          \n\n - Ancestral Points: '..taskPoints_get(player)..'.'
    local ret_t = getTaskInfos(player)

    return false,  player:popupFYI(text)
end
