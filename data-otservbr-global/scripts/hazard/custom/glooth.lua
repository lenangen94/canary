local hazard = Hazard.new({
	name = "hazard.glooth-bandits",
	from = Position(33624, 31921, 12),
	to = Position(33720, 32062, 12),
	maxLevel = 10,

	crit = true,
	dodge = true,
	damageBoost = true,
	defenseBoost = true,
})
-- {x = 33624, y = 31921, z = 12}
-- {x = 33720, y = 32062, z = 12}

hazard:register()

local hazardZone = Zone.getByName(hazard.name)

local deathEventName = "GloothBanditsDeath"
local spawnEvent = ZoneEvent(hazardZone)
function spawnEvent.onSpawn(monster, position)
	monster:registerEvent(deathEventName)
end
spawnEvent:register()

local deathEvent = CreatureEvent(deathEventName)
function deathEvent.onDeath(creature)
	local monster = creature:getMonster()
	if not creature or not monster or not monster:hazard() or not hazard:isInZone(monster:getPosition()) then
		return true
	end

	local _, points = hazard:getHazardPlayerAndPoints(monster:getDamageMap())
	if points < 1 then
		return true
	end

	if executeLevelUpEvent(points) then
		onDeathForDamagingPlayers(creature, function(creature, damagingPlayer)
			attemptLevelUpPlayer(hazard, damagingPlayer, points)
		end)
	end

	if executeCreateHazardPod(points) then
		createHazardPod(monster:getPosition(), monster:getName())
	end

	return true
end
deathEvent:register()
