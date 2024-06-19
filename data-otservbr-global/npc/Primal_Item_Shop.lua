local internalNpcName = "Primal Item Shop"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 1413,
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
npcConfig.currency = 6547 --Yellow Powder
npcConfig.shop = {
		{ itemName = "Spiritthorn Armor", clientId = 39147, buy = 3, sell = 1 },
    { itemName = "Spiritthorn Helmet", clientId = 39148, buy = 3, sell = 1 },
    { itemName = "Charged Spiritthorn Ring", clientId = 39177, buy = 3, sell = 1 },
    { itemName = "Alicorn Headguard", clientId = 39149, buy = 3, sell = 1 },
    { itemName = "Alicorn Quiver", clientId = 39150, buy = 3, sell = 1 },
    { itemName = "Charged Alicorn Ring", clientId = 39180, buy = 3, sell = 1 },
		{ itemName = "Arcanomancer Regalia", clientId = 39151, buy = 3, sell = 1 },
		{ itemName = "Arcanomancer Folio", clientId = 39152, buy = 3, sell = 1 },
		{ itemName = "Charged Arcanomancer Sigil", clientId = 39183, buy = 3, sell = 1 },
		{ itemName = "Arboreal Crown", clientId = 39153, buy = 3, sell = 1 },
		{ itemName = "Arboreal Tome", clientId = 39154, buy = 3, sell = 1 },
		{ itemName = "Charged Arboreal Ring", clientId = 39186, buy = 3, sell = 1 },

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
