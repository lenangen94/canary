local commands = TalkAction("!forge")

function commands.onSay(player, words, param)
	player:openForge()
	return true
end

commands:groupType("normal")
commands:register()
