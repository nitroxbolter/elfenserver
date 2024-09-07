print(">> Stars Upgrade System Loaded")

local upgradeTable = {

    -- Common --
    [27134] = {
        [27113] = {transformId = 26813},
        [27114] = {transformId = 26816},
        [27115] = {transformId = 26819},
        [27116] = {transformId = 26822},
        [27117] = {transformId = 26825},
        [27118] = {transformId = 26828},
        [27119] = {transformId = 26831},
        [27120] = {transformId = 26834},
        [27121] = {transformId = 26837},
        [27122] = {transformId = 26840},
        [27123] = {transformId = 26843},
        [27124] = {transformId = 26846},
        [27125] = {transformId = 26849},
        [27126] = {transformId = 26852},
        [27127] = {transformId = 26855},
        [27128] = {transformId = 26858},
        [27129] = {transformId = 26861},
        [27130] = {transformId = 26864},
        [27131] = {transformId = 26867},
        [27132] = {transformId = 26870},
    },
    [27135] = {
        [27113] = {transformId = 26814},
        [27114] = {transformId = 26817},
        [27115] = {transformId = 26820},
        [27116] = {transformId = 26823},
        [27117] = {transformId = 26826},
        [27118] = {transformId = 26829},
        [27119] = {transformId = 26832},
        [27120] = {transformId = 26835},
        [27121] = {transformId = 26838},
        [27122] = {transformId = 26841},
        [27123] = {transformId = 26844},
        [27124] = {transformId = 26847},
        [27125] = {transformId = 26850},
        [27126] = {transformId = 26853},
        [27127] = {transformId = 26856},
        [27128] = {transformId = 26859},
        [27129] = {transformId = 26862},
        [27130] = {transformId = 26865},
        [27131] = {transformId = 26868},
        [27132] = {transformId = 26871},
    },
    [27136] = {
        [27113] = {transformId = 26815},
        [27114] = {transformId = 26818},
        [27115] = {transformId = 26821},
        [27116] = {transformId = 26824},
        [27117] = {transformId = 26827},
        [27118] = {transformId = 26830},
        [27119] = {transformId = 26833},
        [27120] = {transformId = 26836},
        [27121] = {transformId = 26839},
        [27122] = {transformId = 26842},
        [27123] = {transformId = 26845},
        [27124] = {transformId = 26848},
        [27125] = {transformId = 26851},
        [27126] = {transformId = 26854},
        [27127] = {transformId = 26857},
        [27128] = {transformId = 26860},
        [27129] = {transformId = 26863},
        [27130] = {transformId = 26866},
        [27131] = {transformId = 26869},
        [27132] = {transformId = 26872},
    },
    -- Rare --
    [27137] = {
        [27113] = {transformId = 26873},
        [27114] = {transformId = 26876},
        [27115] = {transformId = 26879},
        [27116] = {transformId = 26882},
        [27117] = {transformId = 26885},
        [27118] = {transformId = 26888},
        [27119] = {transformId = 26891},
        [27120] = {transformId = 26894},
        [27121] = {transformId = 26897},
        [27122] = {transformId = 26900},
        [27123] = {transformId = 26903},
        [27124] = {transformId = 26906},
        [27125] = {transformId = 26909},
        [27126] = {transformId = 26912},
        [27127] = {transformId = 26915},
        [27128] = {transformId = 26918},
        [27129] = {transformId = 26921},
        [27130] = {transformId = 26924},
        [27131] = {transformId = 26927},
        [27132] = {transformId = 26930},
    },
    [27138] = {
        [27113] = {transformId = 26874},
        [27114] = {transformId = 26877},
        [27115] = {transformId = 26880},
        [27116] = {transformId = 26883},
        [27117] = {transformId = 26886},
        [27118] = {transformId = 26889},
        [27119] = {transformId = 26892},
        [27120] = {transformId = 26895},
        [27121] = {transformId = 26898},
        [27122] = {transformId = 26901},
        [27123] = {transformId = 26904},
        [27124] = {transformId = 26907},
        [27125] = {transformId = 26910},
        [27126] = {transformId = 26913},
        [27127] = {transformId = 26916},
        [27128] = {transformId = 26919},
        [27129] = {transformId = 26922},
        [27130] = {transformId = 26925},
        [27131] = {transformId = 26928},
        [27132] = {transformId = 26931},
    },
    [27139] = {
        [27113] = {transformId = 26875},
        [27114] = {transformId = 26878},
        [27115] = {transformId = 26881},
        [27116] = {transformId = 26884},
        [27117] = {transformId = 26887},
        [27118] = {transformId = 26890},
        [27119] = {transformId = 26893},
        [27120] = {transformId = 26896},
        [27121] = {transformId = 26899},
        [27122] = {transformId = 26902},
        [27123] = {transformId = 26905},
        [27124] = {transformId = 26908},
        [27125] = {transformId = 26911},
        [27126] = {transformId = 26914},
        [27127] = {transformId = 26917},
        [27128] = {transformId = 26920},
        [27129] = {transformId = 26923},
        [27130] = {transformId = 26926},
        [27131] = {transformId = 26929},
        [27132] = {transformId = 26932},
    },
    -- Very Rare --
    [27140] = {
        [27113] = {transformId = 26933},
        [27114] = {transformId = 26936},
        [27115] = {transformId = 26939},
        [27116] = {transformId = 26942},
        [27117] = {transformId = 26945},
        [27118] = {transformId = 26948},
        [27119] = {transformId = 26951},
        [27120] = {transformId = 26954},
        [27121] = {transformId = 26957},
        [27122] = {transformId = 26960},
        [27123] = {transformId = 26963},
        [27124] = {transformId = 26966},
        [27125] = {transformId = 26969},
        [27126] = {transformId = 26972},
        [27127] = {transformId = 26975},
        [27128] = {transformId = 26978},
        [27129] = {transformId = 26981},
        [27130] = {transformId = 26984},
        [27131] = {transformId = 26987},
        [27132] = {transformId = 26990},
    },
    [27141] = {
        [27113] = {transformId = 26934},
        [27114] = {transformId = 26937},
        [27115] = {transformId = 26940},
        [27116] = {transformId = 26943},
        [27117] = {transformId = 26946},
        [27118] = {transformId = 26949},
        [27119] = {transformId = 26952},
        [27120] = {transformId = 26955},
        [27121] = {transformId = 26958},
        [27122] = {transformId = 26961},
        [27123] = {transformId = 26964},
        [27124] = {transformId = 26967},
        [27125] = {transformId = 26970},
        [27126] = {transformId = 26973},
        [27127] = {transformId = 26976},
        [27128] = {transformId = 26979},
        [27129] = {transformId = 26982},
        [27130] = {transformId = 26985},
        [27131] = {transformId = 26988},
        [27132] = {transformId = 26991},
    },
    [27142] = {
        [27113] = {transformId = 26935},
        [27114] = {transformId = 26938},
        [27115] = {transformId = 26941},
        [27116] = {transformId = 26944},
        [27117] = {transformId = 26947},
        [27118] = {transformId = 26950},
        [27119] = {transformId = 26953},
        [27120] = {transformId = 26956},
        [27121] = {transformId = 26959},
        [27122] = {transformId = 26962},
        [27123] = {transformId = 26965},
        [27124] = {transformId = 26968},
        [27125] = {transformId = 26971},
        [27126] = {transformId = 26974},
        [27127] = {transformId = 26977},
        [27128] = {transformId = 26980},
        [27129] = {transformId = 26983},
        [27130] = {transformId = 26986},
        [27131] = {transformId = 26989},
        [27132] = {transformId = 26992},
    },
    -- Epic --
    [27143] = {
        [27113] = {transformId = 26993},
        [27114] = {transformId = 26996},
        [27115] = {transformId = 26999},
        [27116] = {transformId = 27002},
        [27117] = {transformId = 27005},
        [27118] = {transformId = 27008},
        [27119] = {transformId = 27011},
        [27120] = {transformId = 27014},
        [27121] = {transformId = 27017},
        [27122] = {transformId = 27020},
        [27123] = {transformId = 27023},
        [27124] = {transformId = 27026},
        [27125] = {transformId = 27029},
        [27126] = {transformId = 27032},
        [27127] = {transformId = 27035},
        [27128] = {transformId = 27038},
        [27129] = {transformId = 27041},
        [27130] = {transformId = 27044},
        [27131] = {transformId = 27047},
        [27132] = {transformId = 27050},
    },
    [27144] = {
        [27113] = {transformId = 26994},
        [27114] = {transformId = 26997},
        [27115] = {transformId = 27000},
        [27116] = {transformId = 27003},
        [27117] = {transformId = 27006},
        [27118] = {transformId = 27009},
        [27119] = {transformId = 27012},
        [27120] = {transformId = 27015},
        [27121] = {transformId = 27018},
        [27122] = {transformId = 27021},
        [27123] = {transformId = 27024},
        [27124] = {transformId = 27027},
        [27125] = {transformId = 27030},
        [27126] = {transformId = 27033},
        [27127] = {transformId = 27036},
        [27128] = {transformId = 27039},
        [27129] = {transformId = 27042},
        [27130] = {transformId = 27045},
        [27131] = {transformId = 27048},
        [27132] = {transformId = 27051},
    },
    [27145] = {
        [27113] = {transformId = 26995},
        [27114] = {transformId = 26998},
        [27115] = {transformId = 27001},
        [27116] = {transformId = 27004},
        [27117] = {transformId = 27007},
        [27118] = {transformId = 27010},
        [27119] = {transformId = 27013},
        [27120] = {transformId = 27016},
        [27121] = {transformId = 27019},
        [27122] = {transformId = 27022},
        [27123] = {transformId = 27025},
        [27124] = {transformId = 27028},
        [27125] = {transformId = 27031},
        [27126] = {transformId = 27034},
        [27127] = {transformId = 27037},
        [27128] = {transformId = 27040},
        [27129] = {transformId = 27043},
        [27130] = {transformId = 27046},
        [27131] = {transformId = 27049},
        [27132] = {transformId = 27052},
    },
    -- Legendary --
    [27146] = {
        [27113] = {transformId = 27053},
        [27114] = {transformId = 27056},
        [27115] = {transformId = 27059},
        [27116] = {transformId = 27062},
        [27117] = {transformId = 27065},
        [27118] = {transformId = 27068},
        [27119] = {transformId = 27071},
        [27120] = {transformId = 27074},
        [27121] = {transformId = 27077},
        [27122] = {transformId = 27080},
        [27123] = {transformId = 27083},
        [27124] = {transformId = 27086},
        [27125] = {transformId = 27089},
        [27126] = {transformId = 27092},
        [27127] = {transformId = 27095},
        [27128] = {transformId = 27098},
        [27129] = {transformId = 27101},
        [27130] = {transformId = 27104},
        [27131] = {transformId = 27107},
        [27132] = {transformId = 27110},
    },
    [27147] = {
        [27113] = {transformId = 27054},
        [27114] = {transformId = 27057},
        [27115] = {transformId = 27060},
        [27116] = {transformId = 27063},
        [27117] = {transformId = 27066},
        [27118] = {transformId = 27069},
        [27119] = {transformId = 27072},
        [27120] = {transformId = 27075},
        [27121] = {transformId = 27078},
        [27122] = {transformId = 27081},
        [27123] = {transformId = 27084},
        [27124] = {transformId = 27087},
        [27125] = {transformId = 27090},
        [27126] = {transformId = 27093},
        [27127] = {transformId = 27096},
        [27128] = {transformId = 27099},
        [27129] = {transformId = 27102},
        [27130] = {transformId = 27105},
        [27131] = {transformId = 27108},
        [27132] = {transformId = 27111},
    },
    [27148] = {
        [27113] = {transformId = 27055},
        [27114] = {transformId = 27058},
        [27115] = {transformId = 27061},
        [27116] = {transformId = 27064},
        [27117] = {transformId = 27067},
        [27118] = {transformId = 27070},
        [27119] = {transformId = 27073},
        [27120] = {transformId = 27076},
        [27121] = {transformId = 27079},
        [27122] = {transformId = 27082},
        [27123] = {transformId = 27085},
        [27124] = {transformId = 27088},
        [27125] = {transformId = 27091},
        [27126] = {transformId = 27094},
        [27127] = {transformId = 27097},
        [27128] = {transformId = 27100},
        [27129] = {transformId = 27103},
        [27130] = {transformId = 27106},
        [27131] = {transformId = 27109},
        [27132] = {transformId = 27112},
    },
}

local upgradeAction = Action()

function upgradeAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target:isItem() then
        player:sendCancelMessage('You must select an item.')
        player:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local targetId = target.itemid
    local itemId = item.itemid

    local upgradeData = upgradeTable[itemId] and upgradeTable[itemId][targetId]

    if upgradeData then
        target:transform(upgradeData.transformId)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfully inlaid one common star.")
        target:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, ItemType(target:getId()):getDescription().."\nRefined by "..player:getName()..".")
        player:getPosition():sendMagicEffect(210)
        item:remove(1)
        playSound(player, "success.ogg")
    else
        player:sendCancelMessage('This item cannot be upgraded.')
    end

    return true
end

upgradeAction:id(27134, 27135, 27136, 27137, 27138, 27139, 27140, 27141, 27142, 27143, 27144, 27145, 27146, 27147, 27148)
upgradeAction:register()
