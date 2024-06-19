local mType = Game.createMonsterType("Skarn")
local monster = {}

monster.description = "Skarn"
monster.experience = 30000000
monster.outfit = {
	lookType = 1600,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 1000000
monster.maxHealth = 1000000
monster.race = "blood"
monster.corpse = 37704
monster.speed = 530
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
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
	convinceable = false,
	pushable = false,
	rewardBoss = true,
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
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Revenge for my little brother!", yell = false },
	{ text = "You are starting to annoy me!", yell = false },
	{ text = "I will restore our family honor!", yell = false },
}

monster.summons = {}

monster.loot = {
	{ id = 3043, chance = 60000, maxCount = 200 }, -- crystal coin
	{ id = 22724, chance = 1000000, maxCount = 1 }, -- Titanium Token
	{ id = 22723, chance = 10000, maxCount = 1 }, -- Platinum Token
	{ id = 14112, chance = 10000 }, -- Bar of Gold
	{ id = 37607, chance = 6666 }, -- Green Demon Legs
}

monster.attacks = {
	{ name = "melee", interval = 200, chance = 100, skill = 300, attack = 700 },
	{ name = "combat", interval = 100, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -1500, maxDamage = -2500, length = 8, spread = 4, effect = CONST_ME_WHITE_ENERGY_SPARK },
	{ name = "combat", interval = 150, chance = 100, type = CCOMBAT_FIREDAMAGE, minDamage = -1500, maxDamage = -2500, length = 8, spread = 4, effect = CONST_ME_MAGIC_RED },
	{ name = "combat", interval = 200, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -1500, maxDamage = -2500, length = 8, spread = 4, effect = CONST_ME_POFF },
	{ name = "combat", interval = 250, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -1500, maxDamage = -2500, length = 8, spread = 4, effect = CONST_ME_FIREAREA },
	{ name = "combat", interval = 300, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -1500, maxDamage = -2500, length = 8, spread = 4, effect = CONST_ME_MAGIC_GREEN },
	{ name = "combat", interval = 350, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -1800, maxDamage = -2750, length = 8, spread = 4, effect = CONST_ME_MAGIC_RED },
	{ name = "combat", interval = 400, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -1800, maxDamage = -3200, radius = 8, effect = CONST_ME_LOSEENERGY, target = false },
	{ name = "ice chain", interval = 750, chance = 55, minDamage = -1100, maxDamage = -2100, range = 9 },
	{ name = "combat", interval = 800, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -2000, maxDamage = -3000, effect = CONST_ME_ICEATTACK },
	{ name = "combat", interval = 100, chance = 70, type = COMBAT_FIREDAMAGE, minDamage = -1100, maxDamage = -3000, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 300, chance = 60, type = COMBAT_LIFEDRAIN, minDamage = -2100, maxDamage = -3200, length = 8, spread = 4, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "tenebris summon", interval = 2000, chance = 50, target = false },
}

monster.defenses = {
	defense = 160,
	armor = 160,
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 10000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 3000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 8, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
	{ name = "outfit", interval = 1000, chance = 2, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 7000, outfitItem = 2916 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -15 },
	{ type = COMBAT_EARTHDAMAGE, percent = -15 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = -15 },
	{ type = COMBAT_MANADRAIN, percent = -15 },
	{ type = COMBAT_DROWNDAMAGE, percent = -15 },
	{ type = COMBAT_ICEDAMAGE, percent = -15 },
	{ type = COMBAT_HOLYDAMAGE, percent = -15 },
	{ type = COMBAT_DEATHDAMAGE, percent = -15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "drunk", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
