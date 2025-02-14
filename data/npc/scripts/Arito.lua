local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local AritosTask = player:getStorageValue(Storage.TibiaTales.AritosTask)
		-- START TASK
	if msgcontains(msg, "nomads") then
		if player:getStorageValue(Storage.TibiaTales.AritosTask) <= 0 and player:getItemCount(8267) >= 0 then
			npcHandler:say({
				'What?? My name on a deathlist which you retrieved from a nomad?? Show me!! ...',
				'Oh my god! They found me! You must help me! Please !!!!'
			}, cid)
			if player:getStorageValue(Storage.TibiaTales.DefaultStart) <= 0 then
				player:setStorageValue(Storage.TibiaTales.DefaultStart, 1)
			end
			player:setStorageValue(Storage.TibiaTales.AritosTask, 1)
		-- END TASK
		elseif player:getStorageValue(Storage.TibiaTales.AritosTask) == 2 then
			npcHandler:say({
				'These are great news!! Thank you for your help! I don\'t have much, but without you I wouldn\'t have anything so please take this as a reward.'
			}, cid)
			player:setStorageValue(Storage.TibiaTales.AritosTask, 3)
			player:addItem(2152, 50)
		end
		return true
	end
end

keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, text = "We offer fish, bread, cheese, ham, and meat. If you like to see my offers, ask me for a trade."})
keywordHandler:addKeyword({'drink'}, StdModule.say, {npcHandler = npcHandler, text = "Do you want beer, wine, lemonade, or water? Ask me for a trade to make your choice."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Arito."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm the owner of this tavern."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "It is exactly |TIME|."})
keywordHandler:addKeyword({'tavern'}, StdModule.say, {npcHandler = npcHandler, text = "This tavern is called the 'Old Scarab's Shell'."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, text = "A foolish king who resides over foolish mortals."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, text = "Carlin is the twin sister of Thais. Another city that hasn't found the true path yet."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = "Thais is the capital of an insolent realm. Its people embrace life without understanding the alternative."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = "Why? This is our world of course."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, text = "A city of the lost."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, text = "This is our continent. Ankrahmun is its biggest and most marvellous city."})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, text = "Blessed be our saviour."})
keywordHandler:addKeyword({'rah'}, StdModule.say, {npcHandler = npcHandler, text = "The Rah is our vital force. It is the source of our inner light."})
keywordHandler:addKeyword({'uthun'}, StdModule.say, {npcHandler = npcHandler, text = "The Uthun is what we learn and remember."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "Our Pharaoh does not have any use for such a weapon. As powerful as it may be, it is nothing compared to his divine power."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "This servant of evil won't even dare to enter our city and to call the wrath of our Pharaoh upon him."})

local voices = { {text = 'Come in, have a drink and something to eat.'} }
npcHandler:addModule(VoiceModule:new(voices))

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Be mourned, pilgrim in flesh. Be mourned in my tavern.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Do visit us again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Do visit us again.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Sure, browse through my offers.")
npcHandler:addModule(FocusModule:new())
