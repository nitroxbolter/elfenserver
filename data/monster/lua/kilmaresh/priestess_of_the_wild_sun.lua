local mType = Game.createMonsterType("Priestess of the Wild Sun")
local monster = {}

monster.description = "a priestess of the wild sun"
monster.experience = 6400
monster.outfit = {
	lookType = 1028,
	lookHead = 95,
	lookBody = 78,
	lookLegs = 94,
	lookFeet = 3,
	lookAddons = 0,
	lookMount = 0
}


monster.health = 8500
monster.maxHealth = 8500
monster.race = "blood"
monster.corpse = 26691
monster.speed = 360
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	canPushCreatures = false,
	staticAttackChance = 80,
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
	{text = "Fafnar will burn you!", yell = false},
	{text = "Fear the Wild Sun!", yell = false},
	{text = "There is only one true sun!", yell = false}
}

monster.loot = {
	{id = "platinum coin", chance = 100000, maxCount = 2},
	{id = "fafnar symbol", chance = 7360},
	{id = "sea horse figurine", chance = 910},
	{id = "wand of decay", chance = 1250},
	{id = "wand of everblazing", chance = 1290},
	{id = "golden sickle", chance = 1250},
	{id = "relic sword", chance = 1390},
	{id = "war axe", chance = 1777}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -350},
	{name ="targetfirering", interval = 2000, chance = 8, minDamage = -300, maxDamage = -500, target = true},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -500, radius = 2, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_EXPLOSIONHIT, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -250, maxDamage = -400, radius = 3, effect = CONST_ME_ENERGYAREA, target = false},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = -250, maxDamage = -350, length = 4, spread = 3, effect = CONST_ME_ENERGYHIT, target = false}
}

monster.defenses = {
	defense = 82,
	armor = 82
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -25},
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
