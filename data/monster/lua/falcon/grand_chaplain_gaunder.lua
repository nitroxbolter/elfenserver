local mType = Game.createMonsterType("Grand Chaplain Gaunder")
local monster = {}

monster.description = "Grand Chaplain Gaunder"
monster.experience = 14000
monster.outfit = {
	lookType = 1001,
	lookHead = 57,
	lookBody = 96,
	lookLegs = 23,
	lookFeet = 105,
	lookAddons = 1,
	lookMount = 0
}

monster.health = 15000
monster.maxHealth = 15000
monster.race = "undead"
monster.corpse = 26691
monster.speed = 450
monster.manaCost = 0


monster.changeTarget = {
	interval = 3000,
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
	staticAttackChance = 70,
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
	{id = "ham", chance = 50000, maxCount = 2},
	{id = "onyx arrow", chance = 35000, maxCount = 3},
	{id = "small diamond", chance = 30000, maxCount = 3},
	{id = "small emerald", chance = 30000, maxCount = 3},
	{id = "small enchanted amethyst", chance = 20000, maxCount = 3},
	{id = 7633, chance = 12000, maxCount = 1}, -- giant shimmering pearl (green)
	{id = "knight armor", chance = 7000},
	{id = "patch of fine cloth", chance = 1800},
	{id = "spiked squelcher", chance = 3200},
	{id = "titan axe", chance = 2400},
	{id = "falcon battleaxe", chance = 200},
	{id = "falcon longsword", chance = 200},
	{id = "falcon mace", chance = 210},
	{id = "falcon plate", chance = 100},
	{id = "falcon shield", chance = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -150, maxDamage = -850},
	{name ="combat", interval = 1500, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -380, maxDamage = -890, range = 4, radius = 4, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -290, maxDamage = -720, range = 7, shootEffect = CONST_ANI_ETHEREALSPEAR, target = false},
	{name ="combat", interval = 1500, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_BLOCKHIT, target = false},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -200, maxDamage = -700, range = 5, radius = 3, effect = CONST_ME_SMALLCLOUDS, target = false}
}

monster.defenses = {
	defense = 50,
	armor = 82,
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 550, effect = 185, target = false},
	{name = "speed", chance = 15, interval = 2*1000, speed = 650, effect = CONST_ME_MAGIC_RED}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 55},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 40}
}

monster.immunities = {
	{type = "paralyze", condition = true},
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
