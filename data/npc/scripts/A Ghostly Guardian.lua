local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

npcHandler:addModule(FocusModule:new())

keywordHandler:addKeyword({'hi'}, StdModule.say, {npcHandler = npcHandler, text = "Player, it is you. I knew you'd be coming someday. The guardian greets you."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Once I was a guardian in these halls. It was my duty to welcome those who braved the challenge. But the Brotherhood infiltrated this place using stolen knowledge and their evil seed took root."})
keywordHandler:addKeyword({'nightmare knights'}, StdModule.say, {npcHandler = npcHandler, text = "Once the Dream Challenge was a test to find out who was worthy to talk to the Dream Master. Worthy to become a Nightmare Knight. Now ... I am not sure ... I don't know if there are any Dream Masters left. Perhaps you might find one of them like in the days of old. Before the evil came."})
keywordHandler:addKeyword({'brotherhood of bones'}, StdModule.say, {npcHandler = npcHandler, text = "The Brotherhood intruded these halls that are made of dreams. They defiled them to suit their needs. Beware of taking the wrong path ... It will lead you to a powerful master of evil and I fear that he may try luring someone as powerful as you to his side. He will urge you to join his order of evil ... Resist the temptation of power! Stick to the virtues and seek out the Dream Master for spiritual guidance."})
keywordHandler:addKeyword({'dream master'}, StdModule.say, {npcHandler = npcHandler, text = "The Dream Master is perhaps the last living member of the Nightmare Knights. He used to be a teacher of young aspiring knights. So mighty was his power that even the Bone Master did not dare to challenge him."})
keywordHandler:addKeyword({'bone master'}, StdModule.say, {npcHandler = npcHandler, text = "By using stolen secrets from our order as well as dark magic one of the last remaining bone masters found his way to this place ..., He did not dare to challenge the Dream Master in fair combat. Instead, he decided to hide here and to poison the minds of those who sought the Master's guidance, luring them to the side of evil."})
keywordHandler:addKeyword({'bye'}, StdModule.say, {npcHandler = npcHandler, text = "I am guarding this place ... forever."})
