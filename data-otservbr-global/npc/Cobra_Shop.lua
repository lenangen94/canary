local internalNpcName = "Cobra and Lion"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 1201,
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
npcConfig.currency = 6549 -- Green Powder
npcConfig.shop = {
	{ itemName = "Cobra Wand", clientId = 30399, buy = 2, sell = 1 },
 	{ itemName = "Cobra Rod", clientId = 30400, buy = 2, sell = 1 },
 	{ itemName = "Cobra Club", clientId = 30395, buy = 2, sell = 1 },
 	{ itemName = "Cobra Sword", clientId = 30398, buy = 2, sell = 1 },
 	{ itemName = "Cobra Axe", clientId = 30396, buy = 2, sell = 1 },
 	{ itemName = "Cobra Crossbow", clientId = 30393, buy = 2, sell = 1 },
	{ itemName = "Cobra Boots", clientId = 30394, buy = 2, sell = 1 },
	{ itemName = "Cobra Hood", clientId = 30397, buy = 2, sell = 1 },
	{ itemName = "Cobra Amulet", clientId = 31631, buy = 2, sell = 1 },
	{ itemName = "Lion Spellbook", clientId = 34153, buy = 2, sell = 1 },
	{ itemName = "Lion Spangenhelm", clientId = 34156, buy = 2, sell = 1 },
	{ itemName = "Lion Shield", clientId = 34154, buy = 2, sell = 1 },
	{ itemName = "Lion Hammer", clientId = 34254, buy = 2, sell = 1 },
	{ itemName = "Lion Longbow", clientId = 34150, buy = 2, sell = 1 },
	{ itemName = "Lion Axe", clientId = 34253, buy = 2, sell = 1 },
	{ itemName = "Lion Longsword", clientId = 34155, buy = 2, sell = 1 },
	{ itemName = "Lion Plate", clientId = 34157, buy = 2, sell = 1 },
	{ itemName = "Lion Rod", clientId = 34151, buy = 2, sell = 1 },
	{ itemName = "Lion Wand", clientId = 34152, buy = 2, sell = 1 },




}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
    npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
    player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i green powder.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
