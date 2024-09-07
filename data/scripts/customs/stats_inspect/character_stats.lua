local ITEM_ID = 28092

local statIndexByName = {
  ["strength"] = CHARSTAT_STRENGTH,
  ["intelligence"] = CHARSTAT_INTELLIGENCE,
  ["dexterity"] = CHARSTAT_DEXTERITY,
  ["vitality"] = CHARSTAT_VITALITY,
  ["spirit"] = CHARSTAT_SPIRIT,
  ["wisdom"] = CHARSTAT_WISDOM
}

local statNameByIndex = {
  [CHARSTAT_STRENGTH] = "strength",
  [CHARSTAT_INTELLIGENCE] = "intelligence",
  [CHARSTAT_DEXTERITY] = "dexterity",
  [CHARSTAT_VITALITY] = "vitality",
  [CHARSTAT_SPIRIT] = "spirit",
  [CHARSTAT_WISDOM] = "wisdom"
}

-- this is VISUAL ONLY for the client, to change actual values, you have to edit sources
local valuePerStat = {
  [CHARSTAT_STRENGTH] = 1,
  [CHARSTAT_INTELLIGENCE] = 1,
  [CHARSTAT_DEXTERITY] = 1,
  [CHARSTAT_VITALITY] = 1,
  [CHARSTAT_SPIRIT] = 1,
}

-- max points that player can add to single stat
StatsMaxValues = {
  [CHARSTAT_STRENGTH] = 50,
  [CHARSTAT_INTELLIGENCE] = 50,
  [CHARSTAT_DEXTERITY] = 50,
  [CHARSTAT_VITALITY] = 60,
  [CHARSTAT_SPIRIT] = 60,
}

-- +1 point at X level
local StatsConfig = {
  levels = {
    50,
    100,
    150,
    200,
    250,
    300,
    350,
    400,
    450,
    500,
    550,
    600,
    650,
    700,
    750,
    800,
    850,
    900,
    950,
    1000,
    1050,
    1100,
    1150,
    1200,
    1250,
    1300,
    1350,
    1400,
    1450,
    1500,
    1550,
    1600,
    1650,
    1700,
    1750,
    1800,
    1850,
    1900,
    1950,
    2000,
    2050,
    2100,
    2150,
    2200,
    2250,
    2300,
    2350,
    2400,
    2450,
    2500,
    2550,
    2600,
    2650,
    2700,
    2750,
    2800,
    2850,
    2900,
    2950,
    3000,
    3050,
    3100,
    3150,
    3200,
    3250,
    3300,
    3350,
    3400,
    3450,
    3500,
    3550,
    3600,
    3650,
    3700,
    3750,
    3800,
    3850,
    3900,
    3950,
    4000,
    4050,
    4100,
    4150,
    4200,
    4250,
    4300,
    4350,
    4400,
    4450,
    4500,
    4550,
    4600,
    4650,
    4700,
    4750,
    4800,
    4850,
    4900,
    4950,
    5000
  }
}

local LoginEvent = CreatureEvent("CharacterStatsLogin")

function LoginEvent.onLogin(player)
  player:registerEvent("CharacterStatsExtended")
  player:registerEvent("CharacterStatsAdvance")
  player:updateCharacterStats()
  return true
end

local AdvanceEvent = CreatureEvent("CharacterStatsAdvance")

function AdvanceEvent.onAdvance(player, skill, oldLevel, newLevel)
  if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
    return true
  end

  for i = 1, #StatsConfig.levels do
    local level = StatsConfig.levels[i]
    if newLevel >= level and player:getStorageValue(PlayerStorageKeys.characterStatsLevel) < i then
      player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have gained a new stat point.")
      player:addStatsPoints(1)
      player:setStorageValue(PlayerStorageKeys.characterStatsLevel, i)
    end
  end

  return true
end

local ExtendedEvent = CreatureEvent("CharacterStatsExtended")

function ExtendedEvent.onExtendedOpcode(player, opcode, buffer)
  if opcode == ExtendedOPCodes.CODE_CHARSTATS then
    local status, json_data =
      pcall(
      function()
        return json.decode(buffer)
      end
    )
    if not status then
      return
    end

    local action = json_data.action
    local data = json_data.data

    if action == "add" then
      addStat(player, data)
    elseif action == "remove" then
      removeStat(player, data)
    elseif action == "reset" then
      resetStats(player)
    end
  end
end

function addStat(player, data)
  if player:getStatsPoints() <= 0 then
    return
  end
  local statId = statIndexByName[data]
  if player:getCharacterStat(statId) >= StatsMaxValues[statId] then
    return
  end
  player:addCharacterStat(statId, 1)
  player:addStatsPoints(-1, true)

  player:updateCharacterStats()
end

function removeStat(player, data)
  local statId = statIndexByName[data]
  if player:getCharacterStat(statId) <= 0 then
    return
  end
  player:addCharacterStat(statId, -1)
  player:addStatsPoints(1, true)

  player:updateCharacterStats()
end

function resetStats(player)
  if player:getItemCount(ITEM_ID) == 0 then
    player:popupFYI("You need " .. ItemType(ITEM_ID):getName() .. " to reset stats")
    return
  end
  for i = CHARSTAT_FIRST, CHARSTAT_SPIRIT do
    local points = player:getStorageValue(PlayerStorageKeys.characterStatsPoints + i + 1)
    if points > 0 then
      player:setStorageValue(PlayerStorageKeys.characterStatsPoints + i + 1, -1)
      player:addStatsPoints(points, true)
    end
  end

  for i = CHARSTAT_FIRST, CHARSTAT_SPIRIT do
    local points = player:getCharacterStat(i)
    player:setCharacterStat(i, 0)
    player:addStatsPoints(points, true)
  end
  
  player:removeItem(ITEM_ID, 1)

  player:updateCharacterStats()
end

function Player:updateCharacterStats()
  local stats = {}
  for i = CHARSTAT_FIRST, CHARSTAT_SPIRIT do
    stats[statNameByIndex[i]] = {
      points = self:getCharacterStat(i),
      value = valuePerStat[i] * self:getCharacterStat(i)
    }
  end

  local data = {
    points = self:getStatsPoints(),
    stats = stats
  }

  self:sendExtendedOpcode(ExtendedOPCodes.CODE_CHARSTATS, json.encode({action = "update", data = data}))
end

function Player:addStatsPoints(points, silent)
  local val = self:getStorageValue(PlayerStorageKeys.characterStatsPoints)
  if val == -1 then
    val = 0
  end
  self:setStorageValue(PlayerStorageKeys.characterStatsPoints, val + points)

  if not silent then
    self:updateCharacterStats()
  end
end

function Player:getStatsPoints()
  local val = self:getStorageValue(PlayerStorageKeys.characterStatsPoints)
  if val == -1 then
    val = 0
  end

  return val
end

LoginEvent:type("login")
LoginEvent:register()
AdvanceEvent:type("advance")
AdvanceEvent:register()
ExtendedEvent:type("extendedopcode")
ExtendedEvent:register()
