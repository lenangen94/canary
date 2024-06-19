local internalNpcName = "Classification Three"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1716,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
	return true
end

local function onTradeRequest(npc, creature)
	if Player(creature):getStorageValue(Storage.TravellingTrader.Mission07) ~= 1 then
		npcHandler:say('Sorry, but you do not belong to my exclusive customers. I have to make sure that I can trust in the quality of your wares.', npc, creature)
		return false
	end

	return true
end

npcHandler:setCallback(CALLBACK_ON_TRADE_REQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "Albino Plate", clientId = 19358, sell = 250000},
	{ itemName = "Bear Skin", clientId = 31578, sell = 250000 },
	{ itemName = "Bow of Cataclysm", clientId = 31581, sell = 250000 },
	{ itemName = "Dark Whispers", clientId = 29427, sell = 250000 },
	{ itemName = "Deepling Ceremonial Dagger", clientId = 28825, sell = 250000 },
	{ itemName = "Deepling Fork", clientId = 28826, sell = 250000 },
	{ itemName = "Demonbone", clientId = 7431, sell = 250000 },
	{ itemName = "Demonwing Axe", clientId = 8098, sell = 250000 },
	{ itemName = "Djinn Blade", clientId = 3339, sell = 250000 },
	{ itemName = "Dragon Scale Helmet", clientId = 3400, sell = 250000 },
	{ itemName = "Dream Shroud", clientId = 29423, sell = 250000 },
	{ itemName = "Dwarven Armor", clientId = 3397, sell = 250000 },
	{ itemName = "Dwarven Helmet", clientId = 3396, sell = 250000 },
	{ itemName = "Dwarven Legs", clientId = 3398, sell = 250000 },
	{ itemName = "Elite Draken Helmet", clientId = 11689, sell = 250000 },
	{ itemName = "Elven Legs", clientId = 3401, sell = 250000 },
	{ itemName = "Elven Mail", clientId = 3399, sell = 250000 },
	{ itemName = "Embrace of Nature", clientId = 31579, sell = 250000 },
	{ itemName = "Emerald Sword", clientId = 8102, sell = 250000 },
	{ itemName = "Energized Demonbone", clientId = 28830, sell = 250000 },
	{ itemName = "Energized Limb", clientId = 29425, sell = 250000 },
	{ itemName = "Executioner", clientId = 7453, sell = 250000 },
	{ itemName = "Fabulous Legs", clientId = 32617, sell = 250000 },
	{ itemName = "Fur Cap", clientId = 7458, sell = 250000 },
	{ itemName = "Galea Mortis", clientId = 31582, sell = 250000 },
	{ itemName = "Ghost Chestplate", clientId = 32628, sell = 250000 },
	{ itemName = "Gnome Armor", clientId = 27648, sell = 250000 },
	{ itemName = "Gnome Helmet", clientId = 27647, sell = 250000 },
	{ itemName = "Gnome Legs", clientId = 27649, sell = 250000 },
	{ itemName = "Gnome Sword", clientId = 27651, sell = 250000 },
	{ itemName = "Goo Shell", clientId = 19372, sell = 250000 },
	{ itemName = "Great Axe", clientId = 3303, sell = 250000 },
	{ itemName = "Havoc Blade", clientId = 7405, sell = 250000 },
	{ itemName = "Hellforged Axe", clientId = 8096, sell = 250000 },
	{ itemName = "Impaler", clientId = 7435, sell = 250000 },
	{ itemName = "Living Armor", clientId = 29418, sell = 250000 },
	{ itemName = "Living Vine Bow", clientId = 29417, sell = 250000 },
	{ itemName = "Magician Hat", clientId = 3573, sell = 250000 },
	{ itemName = "Maimer", clientId = 22762, sell = 250000 },
	{ itemName = "Master Archer's Armor", clientId = 8060, sell = 250000 },
	{ itemName = "Mortal Mace", clientId = 31580, sell = 250000 },
	{ itemName = "Obsidian Truncheon", clientId = 8100, sell = 250000 },
	{ itemName = "Old Cape", clientId = 11701, sell = 250000 },
	{ itemName = "Phantasmal Axe", clientId = 32616, sell = 250000 },
	{ itemName = "Pharaoh Sword", clientId = 3334, sell = 250000 },
	{ itemName = "Queen's Sceptre", clientId = 7410, sell = 250000 },
	{ itemName = "Ravager's Axe", clientId = 3331, sell = 250000 },
	{ itemName = "Reaper's Axe", clientId = 7420, sell = 250000 },
	{ itemName = "Resizer", clientId = 29419, sell = 250000 },
	{ itemName = "Rotten Demonbone", clientId = 28829, sell = 250000 },
	{ itemName = "Royal Crossbow", clientId = 8023, sell = 250000 },
	{ itemName = "Royal Draken Mail", clientId = 11686, sell = 250000 },
	{ itemName = "Royal Scale Robe", clientId = 11687, sell = 250000 },
	{ itemName = "Silver Mace", clientId = 3312, sell = 250000 },
	{ itemName = "Skullcrusher", clientId = 7423, sell = 250000 },
	{ itemName = "Snake God's Sceptre", clientId = 11692, sell = 250000 },
	{ itemName = "Soulful Legs", clientId = 32618, sell = 250000 },
	{ itemName = "Sulphurous Demonbone", clientId = 28832, sell = 250000 },
	{ itemName = "Summerblade", clientId = 29421, sell = 250000 },
	{ itemName = "Terra Helmet", clientId = 31577, sell = 250000 },
	{ itemName = "The Calamity", clientId = 8104, sell = 250000 },
	{ itemName = "Stomper", clientId = 8101, sell = 250000 },
	{ itemName = "Thorn Spitter", clientId = 14768, sell = 250000 },
	{ itemName = "Toga Mortis", clientId = 31583, sell = 250000 },
	{ itemName = "Twin Axe", clientId = 3335, sell = 250000 },
	{ itemName = "Umbral Axe", clientId = 20071, sell = 250000 },
	{ itemName = "Umbral Blade", clientId = 20065, sell = 250000 },
	{ itemName = "Umbral Bow", clientId = 20083, sell = 250000 },
	{ itemName = "Umbral Chopper", clientId = 20074, sell = 250000 },
	{ itemName = "Umbral Crossbow", clientId = 20086, sell = 250000 },
	{ itemName = "Umbral Hammer", clientId = 20080, sell = 250000 },
	{ itemName = "Umbral Mace", clientId = 20077, sell = 250000 },
	{ itemName = "Umbral Slayer", clientId = 20068, sell = 250000 },
	{ itemName = "Warsinger Bow", clientId = 8026, sell = 250000 },
	{ itemName = "Winterblade", clientId = 29422, sell = 250000 },
	{ itemName = "Gnome Shield", clientId = 27650, sell = 250000 },
	{ itemName = "Ectoplasmic Shield", clientId = 29430, sell = 250000 },
	{ itemName = "Make-do Boots", clientId = 35520, sell = 250000 },
	{ itemName = "Makeshift Boots", clientId = 35519, sell = 250000 },
}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
