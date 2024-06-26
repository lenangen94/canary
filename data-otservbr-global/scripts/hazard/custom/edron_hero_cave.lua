local hazard = Hazard.new({
	name = "hazard.edron-hero-cave",
	from = Position(33240, 31520, 9),
	to = Position(33370, 31626, 10),
	maxLevel = 7,

	crit = true,
	dodge = true,
	damageBoost = true,
	defenseBoost = false,
})

hazard:register()

local hazardZone = Zone.getByName(hazard.name)

local deathEventName = "EdronHeroCaveDeath"
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
