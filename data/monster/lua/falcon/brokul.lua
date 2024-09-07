local mType = Game.createMonsterType("Brokul")
local monster = {}

monster.description = "Brokul"
monster.experience = 23000
monster.outfit = {
	lookType = 1003,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "undead"
monster.corpse = 26691
monster.speed = 400
monster.manaCost = 0

monster.changeTarget = {
	interval = 1000,
	chance = 10
}


monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}
monster.events = {
	"playerAttackSound"
}
monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 60,
	targetDistance = 1,
	runHealth = 60,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summon = {
	maxSummons = 5,
	summons = {
		{name = "deepling warrior", chance = 70, interval = 1000, count = 5}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = "small sapphire", chance = 2854, maxCount = 10},
	{id = "gold coin", chance = 70000, maxCount = 60},
	{id = "platinum coin", chance = 80000, maxCount = 10},
	{id = "gold ingot", chance = 3448, maxCount = 10},
	{id = "broccoli", chance = 2439, maxCount = 10},
	{id = "small diamond", chance = 498, maxCount = 10},
	{id = "blue gem", chance = 2500},
	{id= 2156, chance = 2000}, -- red gem
	{id = "deepling ceremonial dagger", chance = 200},
	{id = "deepling fork", chance = 200},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -100, maxDamage = -700, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -700, radius = 4, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -840, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -700, length = 8, spread = 3, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 2000, chance = 29, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -840, range = 7, radius = 4, effect = CONST_ME_FIREAREA, target = true}
}

monster.defenses = {
	defense = 60,
	armor = 86,
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 500, effect = 185, target = false},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_HEALING, minDamage = 500, maxDamage = 1000, effect = 185, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = -20},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
