local mType = Game.createMonsterType("Enhanced Fire Book")
local monster = {}

monster.description = "an Enhanced Fire book"
monster.experience = 20000
monster.outfit = {
	lookType = 989,
	lookHead = 79,
	lookBody = 113,
	lookLegs = 78,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 30000
monster.maxHealth = 30000
monster.race = "fire"
monster.corpse = 26691
monster.speed = 550
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 100,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = "Platinum Coin", chance = 89960, maxCount = 58},
	{id = "Book Page", chance = 3000, maxCount = 7},
	{id = "Demonic Essence", chance = 3000, maxCount = 5},
	{id = "Concentrated Demonic Blood", chance = 3000, maxCount = 3},
	{id = "Small Amethyst", chance = 2000, maxCount = 10},
	{id = 2419, chance = 3000},
	{id = "Silken Bookmark", chance = 2000, maxCount = 2},
	{id = "Magma Coat", chance = 8000},
	{id = "Guardian Shield", chance = 11500},
	{id = "Soul Orb", chance = 3000, maxCount = 4},
	{id = "Necrotic Rod", chance = 13000},
	{id = "Magma Monocle", chance = 11500},
	{id = 6300, chance = 1200},
	{id = "Stealth Ring", chance = 18000},
	{id = "Shadow Sceptre", chance = 89900}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -900},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -980, range = 7, shootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 1500, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = -500, maxDamage = -1100, radius = 3, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -1250, length = 5, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_FIREDAMAGE, minDamage = -400, maxDamage = -975, radius = 3, effect = CONST_ME_HITBYFIRE, target = false}
}

monster.defenses = {
	defense = 55,
	armor = 80
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
