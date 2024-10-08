local mType = Game.createMonsterType("Cobra Vizier")
local monster = {}

monster.description = "a cobra vizier"
monster.experience = 9108
monster.outfit = {
	lookType = 1007,
	lookHead = 19,
	lookBody = 19,
	lookLegs = 67,
	lookFeet = 78,
	lookAddons = 0,
	lookMount = 0
}


monster.health = 8500
monster.maxHealth = 8500
monster.race = "undead"
monster.corpse = 26691
monster.speed = 300
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
	{text = "COMBINE FORCES MY BRETHEN!", yell = false},
	{text = "Feel the cobras wrath!", yell = false},
	{text = "OH NO, YOU WON'T!", yell = false}
}

monster.loot = {
	{id = "platinum coin", chance = 85480, maxCount = 4},
	{id = "terra rod", chance = 43000},
	{id = "snakebite rod", chance = 20970},
	{id = "cobra crest", chance = 16130},
	{id = "terra hood", chance = 13710},
	{id = "cyan crystal fragment", chance = 10805},
	{id = "terra boots", chance = 9680},
	{id = 7633, chance = 8870}, -- giant shimmering pearl (green)
	{id = 2156, chance = 6450}, -- red gem
	{id = "emerald bangle", chance = 5650},
	{id = "gemmed figurine", chance = 4840},
	{id = "green crystal fragment", chance = 3230},
	{id = "red crystal fragment", chance = 3230},
	{id = "serpent sword", chance = 2420},
	{id = "violet crystal shard", chance = 2420},
	{id = "green gem", chance = 1610},
	{id = "onyx chip", chance = 1610, maxCount = 3}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -480},
	{name ="explosion wave", interval = 2000, chance = 15, minDamage = -280, maxDamage = -400, target = false},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -350, maxDamage = -520, radius = 4, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_GREEN_RINGS, target = true}
}

monster.defenses = {
	defense = 82,
	armor = 82,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
