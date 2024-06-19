local dust = Action()

function dust.onUse(player, item, fromPosition, target, toPosition, isHotkey)
local amount = 20 -- dust amount
local totalDusts = player:getForgeDusts()
local limitDusts = 225 -- dust limit

		if (totalDusts + amount) < limitDusts then
				player:addForgeDusts(amount)

				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Recieved "..amount.." dusts")
				item:remove(1)
				return true
		else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Not possible to have more than 225 dust!")
		end
end

dust:id(37109) -- silver raid token
dust:register()
