local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local condition = Condition(CONDITION_FIRE)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(10, 1000, -10)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if isInArray({"fuck", "idiot", "asshole", "ass", "fag", "stupid", "tyrant", "shit", "lunatic"}, msg) then
		npcHandler:say("Take this!", cid)
		local player = Player(cid)
		player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
		player:addCondition(condition)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am a protector of the people of Venore."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, text = "The harbour is to the north, the weapon market in the south, the general market to the west, and the bank to the east. You will find other shops and the Hard Rock Tavern in the center."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "Tibianus III is our beloved king!"})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, text = "Tibianus III is our beloved king!"})
keywordHandler:addKeyword({'swamp'}, StdModule.say, {npcHandler = npcHandler, text = "The swamp is a dangerous place and full of monsters, not to mention all those swampelves living at shadowthorn, amazons, and swamptrolls."})
keywordHandler:addKeyword({'monsters'}, StdModule.say, {npcHandler = npcHandler, text = "The swamp is full of nasty snakes and there's a dragon breeding ground somewhere in the swamps."})
keywordHandler:addKeyword({'amazons'}, StdModule.say, {npcHandler = npcHandler, text = "They are the best example for the results of the Carlin madness."})
keywordHandler:addKeyword({'swamptroll'}, StdModule.say, {npcHandler = npcHandler, text = "This hideous creatures are even more ugly than the normal trolls. They are treacherous and use several poisons."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
