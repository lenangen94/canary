local hazard = Hazard.new({
	name = "hazard.pirats",
	from = Position(33825, 31177, 4),
	to = Position(33945, 31268, 7),
	maxLevel = 12,

	crit = false,
	dodge = true,
	damageBoost = false,
	defenseBoost = true,
})

hazard:register()

local hazardZone = Zone.getByName(hazard.name)
--hazardZone:addArea({x = 33124, y = 32333, z = 11}, {x = 33220, y = 32548, z = 11})
--hazardZone:subtractArea({x = 33200, y = 32482, z = 11}, {x = 33227, y = 32553, z = 11})

local deathEventName = "PiratsDeath"
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

	local player, points = hazard:getHazardPlayerAndPoints(monster:getDamageMap())
	if points < 1 then
		return true
	end

	-- Level up if monster is a boss
	if monster:getType():isRewardBoss() then
		onDeathForDamagingPlayers(creature, function(creature, damagingPlayer)
			attemptLevelUpPlayer(hazard, damagingPlayer, points)
		end)

		return true
	end

	local miniBosses = { "Dreadmaw" }

	if executeLevelUpEvent(points) then
		spawnCustomHazardBoss(player, monster, miniBosses)
	end

	if executeCreateHazardPod(points) then
		createHazardPod(monster:getPosition(), monster:getName())
	end

	return true
end
deathEvent:register()
