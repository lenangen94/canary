local mType = Game.createMonsterType("Rotten Man-Maggot")
local monster = {}

monster.description = "a rotten man-maggot"
monster.experience = 56562
monster.outfit = {
	lookType = 1655,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2393
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 5000,
	FirstUnlock = 200,
	SecondUnlock = 2000,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Putrefactory.",
}

monster.health = 31100
monster.maxHealth = 31100
monster.race = "undead"
monster.corpse = 43820
monster.speed = 195
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 0,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ name = "crystal coin", chance = 65850},
	{ name = "terra boots", chance = 3000 },
	{ name = "small amethyst", chance = 15850, maxCount = 2 },
	{ name = "wood cape", chance = 6100 },
	{ id = 3039, chance =  3660 },
	{ id = 3037, chance = 2440 },
	{ id = 43895, chance = 3 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -900 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -1500, maxDamage = -1600, radius = 5, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ICEDAMAGE, minDamage = -1500, maxDamage = -1900, radius = 5, effect = CONST_ME_GHOSTLY_BITE, target = true },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ICEDAMAGE, minDamage = -1500, maxDamage = -1700, length = 8, spread = 3, effect = CONST_ME_ICEAREA, target = false },
	{ name = "largeicering", interval = 2000, chance = 15, minDamage = -800, maxDamage = -1200, target = false },
}

monster.defenses = {
	defense = 110,
	armor = 110,
	mitigation = 2.75,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 55 },
	{ type = COMBAT_EARTHDAMAGE, percent = -15 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 40 },
	{ type = COMBAT_HOLYDAMAGE, percent = -15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
