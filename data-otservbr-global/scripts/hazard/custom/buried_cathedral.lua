local hazard = Hazard.new({
	name = "hazard.buried-cathedral",
	from = Position(33544, 32483, 13),
	to = Position(33681, 32572, 15),
	maxLevel = 12,

	crit = true,
	dodge = true,
	damageBoost = true,
	defenseBoost = true,
})
--
--

hazard:register()

local hazardZone = Zone.getByName(hazard.name)
hazardZone:subtractArea({ x = 33606, y = 32553, z = 13 }, { x = 33628, y = 32571, z = 13 })

local deathEventName = "BuriedCathedralDeath"
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
deathEvent:register()
