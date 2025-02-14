local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'The passage to the afterlife is filled with obstacles, but I can help you with my wares.'} }

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'amphora'}, 					2008, 4)
shopModule:addBuyableItem({'vase'}, 						2023, 3)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I consider myself as a guide, a guardian for the souls who transcend the border to another world."})
keywordHandler:addKeyword({'wanderer'}, StdModule.say, {npcHandler = npcHandler, text = "I consider myself as a guide, a guardian for the souls who transcend the border to another world."})
keywordHandler:addKeyword({'another world'}, StdModule.say, {npcHandler = npcHandler, text = "Does it mean anything than losing your weak physical shell? And isn't the true power in the universe rather mental than physical?"})
keywordHandler:addKeyword({'death'}, StdModule.say, {npcHandler = npcHandler, text = "Does it mean anything than losing your weak physical shell? And isn't the true power in the universe rather mental than physical?"})
keywordHandler:addKeyword({'soul'}, StdModule.say, {npcHandler = npcHandler, text = "The essence of life, source of your very self. While the body is in space and time, the soul exists in time only."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "It's |TIME| now, but the true question is: How much time is left?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "What's a name worth in your eyes? And more important: Does the choice of your name decide your fate? Perhaps we will never know."})
keywordHandler:addKeyword({'guide'}, StdModule.say, {npcHandler = npcHandler, text = "You seem exceptionally healthy. It will still take many years until you'll need my guidance."})
keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, text = "The purging force of fire ... it helps to free souls and its smoke helps them to find their way to another world."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, text = "You come to this world naked, and you leave it this way. So there's no need to save your money, especially in a place like Venore."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = "Thais needs to be cleansed by fire just like Venore!"})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, text = "It seems less rotten than most other cities, but still purification would do no harm."})
keywordHandler:addKeyword({'dwarfs'}, StdModule.say, {npcHandler = npcHandler, text = "Dwarfs live unhealthily long and its difficult to burn them to ashes. This is suspicious."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, text = "Dwarfs live unhealthily long and its difficult to burn them to ashes. This is suspicious."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, text = "Elves have a strange relation to death. I don't know what they are up to but we should stay wary."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "Kings, queens ... I've seen them come and go. Everything fades, even the glory and wealth of the richest."})
keywordHandler:addKeyword({'birth'}, StdModule.say, {npcHandler = npcHandler, text = "Birth might be the beginning but death is certainly not the end."})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, text = "Life is nothing but a pre-stage for the eternity of death."})
keywordHandler:addKeyword({'gods'}, StdModule.say, {npcHandler = npcHandler, text = "Once you leave your mortal shell, you'll become one with the gods."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, text = "Oh yes, monsters can grant you a passage to the afterlife also, but it's not a comfortable trip. <chuckles>"})
keywordHandler:addKeyword({'body'}, StdModule.say, {npcHandler = npcHandler, text = "Is the mind a creation of the body, or the body an invention of the mind?"})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, text = "I'm offering vases and amphoras, the perfect vessel for all kinds of dusty remains."})
keywordHandler:addKeyword({'afterlife'}, StdModule.say, {npcHandler = npcHandler, text = "No one really knows what awaits us beyond. Although there are some old stories about the Netherworld."})
keywordHandler:addKeyword({'netherworld'}, StdModule.say, {npcHandler = npcHandler, text = "It is the place where the dead end up. Some sages believe, that it is located below the world of the living. ..."})
keywordHandler:addKeyword({'slime'}, StdModule.say, {npcHandler = npcHandler, text = "This man is so old and looks so unhealthy that I expect him to become my customer every day."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	
	if msgcontains(msg, "help") then
		npcHandler:say("What help could I offer apart from guidance? Would you like me to help you to transcend the border to the afterlife?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		npcHandler:say("Are you sure? You might not be able to come back, consider that!", cid)
		npcHandler.topic[cid] = 2
	elseif npcHandler.topic[cid] > 0 then
		npcHandler:say("Hmm... seems you are not ready yet to let go.", cid)
		npcHandler.topic[cid] = 0
	return true
	end
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(VoiceModule:new(voices))
npcHandler:addModule(FocusModule:new())
