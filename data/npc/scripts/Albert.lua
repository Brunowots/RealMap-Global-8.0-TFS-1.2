local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

-- Healing
local function addHealKeyword(text, condition, effect)
	keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = text},
		function(player) return player:getCondition(condition) ~= nil end,
		function(player)
			player:removeCondition(condition)
			player:getPosition():sendMagicEffect(effect)
		end
	)
end

addHealKeyword('You are burning. Let me quench those flames.', CONDITION_FIRE, CONST_ME_MAGIC_GREEN)
addHealKeyword('You are poisoned. Let me soothe your pain.', CONDITION_POISON, CONST_ME_MAGIC_RED)
addHealKeyword('You are electrified, my child. Let me help you to stop trembling.', CONDITION_ENERGY, CONST_ME_MAGIC_GREEN)

keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = 'You are hurt, my child. I will heal your wounds.'},
	function(player) return player:getHealth() < 40 end,
	function(player)
		local health = player:getHealth()
		if health < 40 then player:addHealth(40 - health) end
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
)
keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = 'You aren\'t looking that bad. Sorry, I can\'t help you. But if you are looking for additional protection you should go on the {pilgrimage} of ashes or get the protection of the here.'})

keywordHandler:addKeyword({'humble hut'}, StdModule.say, {npcHandler = npcHandler, text = "The sinful city of Thais is a monument of corruption and murder. I'm glad I left for Edron and thank the gods every day for this isle."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = "The sinful city of Thais is a monument of corruption and murder. I'm glad I left for Edron and thank the gods every day for this isle."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, text = "The sinful city of Thais is a monument of corruption and murder. I'm glad I left for Edron and thank the gods every day for this isle."})
keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = "You aren't looking really bad. Sorry, I can't help you."})
keywordHandler:addKeyword({'healer'}, StdModule.say, {npcHandler = npcHandler, text = "I'm gifted with the ability to heal the wounded and sick ones. Yet, there are wounds of the soul that even the most powerful magic can't cure."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My Name is Albert Fibulanian."})
keywordHandler:addKeyword({'fibula'}, StdModule.say, {npcHandler = npcHandler, text = "My family used to live on the isle of Fibula. At this time it wasn't overrun by soldiers of fortune. Later, I was sent to Thais to learn the art of healing, while my family was amongst the first settlers of Edron."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm a healer."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = "Tibia is a world big enough for everyone. I wish people would realise that."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "The king does much to enhance the life of his people, but he could do more."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, text = "The gods of good take care of us."})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, text = "I mourn the fallen god as I mourn all sinners who have lost their path and live their lives in darkness."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, text = "I dream of times which see no need for armies or warriors."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, text = "I dream of times which see no need for armies or warriors."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "The fallen one is a perfect example where evil leads us to."})
keywordHandler:addKeyword({'orshabaal'}, StdModule.say, {npcHandler = npcHandler, text = "I praise the brave heroes that risk their lives to defy that unholy beast! Even if the creature is not always defeated, their efforts did stop him from invading the town."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "It's only another instrument of pain and destruction."})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, text = "I've only got news about weather, taxes, and harvests. I heard nothing that would interest a traveller like you."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Now, it is |TIME| am."})
keywordHandler:addKeyword({'daniel'}, StdModule.say, {npcHandler = npcHandler, text = "I healed his wounds, but nothing can heal his soul after the betrayal of some of his knightly brethren."})
keywordHandler:addKeyword({'betrayal'}, StdModule.say, {npcHandler = npcHandler, text = "Oh better ask the knights about that issue. I know only little about that tragic story. Some knights betrayed their order and joined some sinister cult in the northern ruins."})
keywordHandler:addKeyword({'kaine'}, StdModule.say, {npcHandler = npcHandler, text = "Another victim of his own ambitions. I mourn for his soul."})

npcHandler:setMessage(MESSAGE_GREET, 'Feel welcome in my humble hut, |PLAYERNAME|. If you are heavily wounded or poisoned, I can heal you.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, |PLAYERNAME|!')

npcHandler:addModule(FocusModule:new())
