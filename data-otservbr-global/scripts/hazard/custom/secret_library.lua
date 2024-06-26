local hazard = Hazard.new({
	name = "hazard.secret-library",
	from = Position(32381, 32513, 12),
	to = Position(32705, 32815, 15),
	maxLevel = 8,

	crit = true,
	dodge = true,
	damageBoost = true,
	defenseBoost = true,
})

hazard:register()

local hazardZone = Zone.getByName(hazard.name)
--hazardZone:addArea({x = 33124, y = 32333, z = 11}, {x = 33220, y = 32548, z = 11})
--hazardZone:subtractArea({x = 33200, y = 32482, z = 11}, {x = 33227, y = 32553, z = 11})

local deathEventName = "SecretLibraryDeath"
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
