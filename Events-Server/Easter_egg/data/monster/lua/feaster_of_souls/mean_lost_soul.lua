local mType = Game.createMonsterType("Mean Lost Soul")
local monster = {}

monster.description = "Mean Lost Soul"
monster.experience = 5580
monster.outfit = {
	lookType = 1031,
	lookHead = 0,
	lookBody = 14,
	lookLegs = 0,
	lookFeet = 83,
	lookAddons = 0,
	lookMount = 0
}


monster.health = 5000
monster.maxHealth = 5000
monster.race = "undead"
monster.corpse = 26691
monster.speed = 350
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.events = {
	"onDeath_randomTierDrops"
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
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
	{id = "platinum coin", chance = 56040},
	{id = "lost soul", chance = 36220},
	{id = "skull staff", chance = 4540},
	{id = "machete", chance = 3520},
	{id = "ensouled essence", chance = 2760},
	{id = "fire axe", chance = 1400},
	{id = "ivory comb", chance = 1200},
	{id = "mercenary sword", chance = 1050},
	{id = "haunted blade", chance = 960},
	{id = "warrior's axe", chance = 730},
	{id = "twiceslicer", chance = 310}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -500},
	{name ="combat", interval = 1700, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -300, maxDamage = -550, radius = 3, shootEffect = CONST_ANI_ENVENOMEDARROW, target = true},
	{name ="combat", interval = 1700, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -550, length = 4, spread = 3, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 1700, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -300, maxDamage = -550, radius = 3, effect = CONST_ME_MORTAREA, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 82
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 55},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -30},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
