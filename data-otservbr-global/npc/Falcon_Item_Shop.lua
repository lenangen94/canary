local internalNpcName = "Falcon Item Shop"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 1072,
    lookHead = 21,
    lookBody = 96,
    lookLegs = 21,
    lookFeet = 105,
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
npcConfig.currency = 6551 -- Blue Powder
npcConfig.shop = {
		{ itemName = "Falcon Plate", clientId = 28719, buy = 2, sell = 1 },
    { itemName = "Falcon Bow", clientId = 28718, buy = 2, sell = 1 },
    { itemName = "Falcon Coif", clientId = 28715, buy = 2, sell = 1 },
    { itemName = "Falcon Shield", clientId = 28721, buy = 2, sell = 1 },
    { itemName = "Falcon Greaves", clientId = 28720, buy = 2, sell = 1 },
    { itemName = "Falcon Wand", clientId = 28717, buy = 2, sell = 1 },
		{ itemName = "Falcon Mace", clientId = 28725, buy = 2, sell = 1 },
		{ itemName = "Falcon Longsword", clientId = 28723, buy = 2, sell = 1 },
		{ itemName = "Falcon Circlet", clientId = 28714, buy = 2, sell = 1 },
		{ itemName = "Falcon Rod", clientId = 28716, buy = 2, sell = 1 },
		{ itemName = "Falcon Battleaxe", clientId = 28724, buy = 2, sell = 1 },


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
