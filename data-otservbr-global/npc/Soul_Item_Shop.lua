local internalNpcName = "Soul Item Shop"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 1308,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,

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

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
npcConfig.currency = 6548 -- Purple Powder
npcConfig.shop = {
		{ itemName = "Soulcutter", clientId = 34082, buy = 3, sell = 1 },
    { itemName = "Soulshredder", clientId = 34083, buy = 3, sell = 1 },
    { itemName = "Soulbiter", clientId = 34084, buy = 3, sell = 1 },
    { itemName = "Souleater", clientId = 34085, buy = 3, sell = 1 },
    { itemName = "Soulcrusher", clientId = 34086, buy = 3, sell = 1 },
    { itemName = "Soulmaimer", clientId = 34087, buy = 3, sell = 1 },
		{ itemName = "Pair of Soulwalkers", clientId = 34097, buy = 3, sell = 1 },
		{ itemName = "Soulbastion", clientId = 34099, buy = 3, sell = 1 },
		{ itemName = "Soulbleeder", clientId = 34088, buy = 3, sell = 1 },
		{ itemName = "Soulpiercer", clientId = 34089, buy = 3, sell = 1 },
		{ itemName = "Soulshell", clientId = 34094, buy = 3, sell = 1 },
		{ itemName = "Pair of Soulstalkers", clientId = 34098, buy = 3, sell = 1 },
		{ itemName = "Soultainter", clientId = 34090, buy = 3, sell = 1 },
		{ itemName = "Soulshanks", clientId = 34092, buy = 3, sell = 1 },
		{ itemName = "Soulmantle", clientId = 34095, buy = 3, sell = 1 },
		{ itemName = "Soulhexer", clientId = 34091, buy = 3, sell = 1 },
		{ itemName = "Soulstrider", clientId = 34093, buy = 3, sell = 1 },
		{ itemName = "Soulshroud", clientId = 34096, buy = 3, sell = 1 },


}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
    npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
    player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i blue powder.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
