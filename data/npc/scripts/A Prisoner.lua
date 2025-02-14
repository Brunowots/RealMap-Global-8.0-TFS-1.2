local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "riddle") then
		if player:getStorageValue(Storage.madMageQuest) ~= 1 then
			npcHandler:say("Great riddle, isn´t it? If you can tell me the correct answer, I will give you something. Hehehe!", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "PD-D-KS-P-PD") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Hurray! For that I will give you my key for - hmm - let´s say ... some apples. Interested?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "Sell Rune") then
		npcHandler:say("You want to sell me blank runes! I will give you 50000 gold for each rune! Interested?", cid)
		npcHandler.topic[cid] = 6
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then
			if player:removeItem(2674, 1) then
				npcHandler:say("Mnjam - excellent apples. Now - about that key. You are sure want it?", cid)
				npcHandler.topic[cid] = 3
			else
				npcHandler:say("Do you want to trick me? You don't have one lousy apple!", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say("Really, really?", cid)
			npcHandler.topic[cid] = 4
		elseif npcHandler.topic[cid] == 4 then
			npcHandler:say("Really, really, really, really?", cid)
			npcHandler.topic[cid] = 5
		elseif npcHandler.topic[cid] == 5 then
			player:setStorageValue(Storage.madMageQuest, 1)
			npcHandler:say("Then take it and get happy - or die, hehe.", cid)
			local key = player:addItem(2088, 1)
			if key then
				key:setActionId(3666)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 6 then
			if player:removeItem(2260, 1) then
				npcHandler:say("Ok. Take my money. I can summon new money anytime - hehehe", cid)
				player:addItem(2148, 10)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Do you want to trick me? You don't have any blank runes!", cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, "no") then
		npcHandler:say("Then go away!", cid)
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Wait! Don't leave! I want to tell you about my surreal numbers.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Next time we should talk about my surreal numbers.")
npcHandler:setMessage(MESSAGE_GREET, "Huh? What? I can see! Wow! A non-mino. Did they {capture} you as well?")

keywordHandler:addKeyword({'capture'}, StdModule.say, {npcHandler = npcHandler, text = "Yes, they capture people. I guess that's their job."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Job? JOB? Hey man - I am in prison! But you know - once upon a time - I was a powerful mage! A mage ... come to think of it .., what is that - a mage?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is - uhm - hang on? I knew it yesterday, didn't I? Doesn't matter!"})
keywordHandler:addKeyword({'mad mage'}, StdModule.say, {npcHandler = npcHandler, text = "Hey! That's me! You got it! Thanks mate - now I remember my name!"})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, text = "I am the mightiest sorcerer from here to there! Yeah!"})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, text = "Power. Hmmm. Once while we were crossing the mountains together a man named Aureus said to me that parcels are equal to power. Any idea what that meant?"})
keywordHandler:addKeyword({'books'}, StdModule.say, {npcHandler = npcHandler, text = "I have many books in my home. But only powerful people can read them. I bet you will only see three dots after the headline! Hehehe! Hahaha! Excellent!"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Better save time than comitting a crime. I am a poet and I know it!"})
keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, text = "Sure I have the key! Hehehe! Perhaps I will give it to you. IF you can solve my riddle."})
keywordHandler:addKeyword({'riddle'}, StdModule.say, {npcHandler = npcHandler, text = "Great riddle, isn´t it? If you can tell me the correct answer, I will give you something. Hehehe!"})
keywordHandler:addKeyword({'something'}, StdModule.say, {npcHandler = npcHandler, text = "No! I won't tell you. Shame coz it would be useful for you - hehehe."})
keywordHandler:addKeyword({'escape'}, StdModule.say, {npcHandler = npcHandler, text = "How could I escape? They only give me rotten food here. I can´t regain my powers because I have no mana!"})
keywordHandler:addKeyword({'labyrinth'}, StdModule.say, {npcHandler = npcHandler, text = "It´s easy to find your way through it! Just follow the pools of mud. Hehe - useful hint, isn´t it?"})
keywordHandler:addKeyword({'way'}, StdModule.say, {npcHandler = npcHandler, text = "It´s easy to find your way through it! Just follow the pools of mud. Hehe - useful hint, isn´t it?"})
keywordHandler:addKeyword({'mino'}, StdModule.say, {npcHandler = npcHandler, text = "They are trying to capture me! Or hang on! Haven't they already captured me? Hmmm - I will have to think about this."})
keywordHandler:addKeyword({'markwin'}, StdModule.say, {npcHandler = npcHandler, text = "He is the worst of them all! He is the king of the minos! May he burn in hell!"})
keywordHandler:addKeyword({'palkar'}, StdModule.say, {npcHandler = npcHandler, text = "He is the leader of the outcasts. I hope he will never conquer the city of Mintwallin. That would be the end of me!"})
keywordHandler:addKeyword({'karl'}, StdModule.say, {npcHandler = npcHandler, text = "Tataah!"})
keywordHandler:addKeyword({'demon'}, StdModule.say, {npcHandler = npcHandler, text = "The only monster I cannot conjure. But soon I will be powerful enough!"})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})
keywordHandler:addKeyword({'conjure'}, StdModule.say, {npcHandler = npcHandler, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})
keywordHandler:addKeyword({'home'}, StdModule.say, {npcHandler = npcHandler, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
