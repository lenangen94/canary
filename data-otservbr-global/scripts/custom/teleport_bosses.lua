local config = {
	{ name="Count Vlarkorth", position = Position(33456, 31408, 13) },
	{ name="Lord Azaram", position = Position(33423, 31497, 13) },
	{ name="Earl Osam", position = Position(33517, 31440, 13) },
	{ name="Sir Baeloc-Nictros", position = Position(33426, 31408, 13) },
	{ name="Duke Krule", position = Position(33456, 31497, 13) },
	{ name="KingZelos", position = Position(33489, 31546, 13) },
	{ name="Custodian", position = Position(33378, 32825, 8) },
	{ name="Guard Captain Quaid", position = Position(33397, 32658, 3) },
	{ name="Scarlett Etzel", position = Position(33395, 32662, 6) },
	{ name="Lady Tenebris", position = Position(32902, 31628, 14) },
	{ name="Lloyd", position = Position(32759, 32873, 14) },
	{ name="Thorn Knight", position = Position(32657, 32882, 14) },
	{ name="Dragonking Zyrtarch", position = Position(33391, 31183, 10) },
	{ name="Frozen Horror", position = Position(32302, 31093, 14) },
	{ name="Time Guardian", position = Position(33010, 31665, 14) },
	{ name="Last Lore Keeper", position = Position(32019, 32849, 14) },
	{ name="Brain Head", position = Position(31973, 32325, 10) },
	{ name="Unaz the Mean", position = Position(33566, 31477, 8) },
	{ name="Irgix the Flimsy", position = Position(33492, 31400, 8) },
	{ name="Vok the Freakish", position = Position(33509, 31452, 9) },
	{ name="Dread Maiden", position = Position(33744, 31506, 14) },
	{ name="Unwelcome", position = Position(33741, 31537, 14) },
	{ name="Fear Feaster", position = Position(33739, 31471, 14) },
	{ name="Pale Worm", position = Position(33776, 31504, 14) },
	{ name="Lion Sanctum", position = Position(33123, 32236, 12) },
	{ name="Shadowpelt", position = Position(33403, 32097, 9) },
	{ name="Black Vixen", position = Position(33442, 32052, 9) },
	{ name="Sharpclaw", position = Position(33128, 31972, 9) },
	{ name="Darkfang", position = Position(33055, 31911, 9) },
	{ name="Bloodback", position = Position(33167, 31978, 8) },
	{ name="Timira", position = Position(33804, 32702, 8) },
	{ name="Kroazur", position = Position(33619, 32305, 9) },
	{ name="Urmahlullu", position = Position(33920, 31623, 8) },
	{ name="Faceless bane", position = Position(33643, 32561, 13) },
	{ name="Ratmiral Blackwhiskers", position = Position(33894, 31386, 15) },
	{ name ="Oberon", position = Position(33364, 31342, 9) },
	{ name ="Drume", position = Position(32462, 32508, 6) }
}

local teleportBoss = Action()

local function teleportBossMessage(player, effect, message)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
    player:getPosition():sendMagicEffect(effect)
end

function teleportBoss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local inPz = player:getTile():hasFlag(TILESTATE_PROTECTIONZONE)
	local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)

	if not inPz and inFight then
			teleportBossMessage(player, CONST_ME_POFF, "You can't use this when you're in a fight.")
			return false
  end

	local window = ModalWindow {
		title = "Teleport Bosses",
		message = "Boss"
	}
	for i, info in pairs(config) do
		window:addChoice(string.format("%s", info.name), function (player, button, choice)
			if button.name ~= "Select" then
				return true
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported to " .. info.name)
			player:teleportTo(info.position)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end)
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return true
end
teleportBoss:id(33313)
teleportBoss:register()
