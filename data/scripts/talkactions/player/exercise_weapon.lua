local config = {
	{name = "durable exercise sword", itemId = 35279, charges = 1800, storage = 998000},
	{name = "durable exercise axe", itemId = 35280, charges = 1800, storage = 998000},
	{name = "durable exercise club", itemId = 35281, charges = 1800, storage = 998000},
	{name = "durable exercise bow", itemId = 35282, charges = 1800, storage = 998000},
	{name = "durable exercise rod", itemId = 35283, charges = 1800, storage = 998000},
	{name = "durable exercise wand", itemId = 35284, charges = 1800, storage = 998000}
}

local exercise_reward_modal = TalkAction("!reward")
function exercise_reward_modal.onSay(player, words, param)
	local window = ModalWindow {
		title = "Exercise Reward",
		message = 'Choose a item'
	}
	for i, info in pairs(config) do
		window:addChoice(string.format("%s", info.name), function (player, button, choice)
			if button.name ~= "Select" then
				return true
			end
			--player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have selected " .. info.name)

			if player:getStorageValue(info.storage) > 0 then
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You already received your exercise weapon reward!")
				return false
			end
			
			local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
			if inbox and inbox:getEmptySlots() > 0 then
				local item = inbox:addItem(info.itemId, info.charges)
				if item then
					item:setActionId(IMMOVABLE_ACTION_ID)
					player:sendTextMessage(MESSAGE_INFO_DESCR, "Congratulations, you just received a [".. info.name .."].")
					player:setStorageValue(info.storage, 1)
				end
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You need to have capacity and empty slots to receive.")
				return true
			end
		end)
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return false
end
exercise_reward_modal:separator(" ")
exercise_reward_modal:groupType("normal")
exercise_reward_modal:register()
