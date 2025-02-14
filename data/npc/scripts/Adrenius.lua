local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm a priest of Fafnar."})
keywordHandler:addKeyword({'do for you'}, StdModule.say, {npcHandler = npcHandler, text = "I'm a priest of Fafnar."})
keywordHandler:addKeyword({'fafnar'}, StdModule.say, {npcHandler = npcHandler, text = "Fafnar is the stronger one of the two suns above our world."})
keywordHandler:addKeyword({'suon'}, StdModule.say, {npcHandler = npcHandler, text = "Suon is the misguided sibling of the great Fafnar. Suon's light turns pale compared to the brightness of Fafnar."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Adrenius."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Time? What is time? A word? A thing? An object?"})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "Who needs a king? I don't."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = "Yyyyess. Yes, it's the capital city of Tibia I think."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, text = "Carlin? Don't you mean Thais?"})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, text = "Even after the death of this swindler Daraman, the descendants of his followers cling to his ignorant teachings."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, text = "Fafnar may burn this city of evil. Its heretical inhabitants and their blasphemous leader are an insult to the gods. Beware! The day of reckoning is at hand!"})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, text = "The Daramian deserts are much more impressive than this one. Sadly the continent is run over by heretics of all sorts ... Darashia is inhabited by the misguided followers of the so-called prophet Daraman, and Ankrahmun is a melting pot of mad and undeath worshippers."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, text = "Fafnar is the greatest among the gods."})
keywordHandler:addKeyword({'desert'}, StdModule.say, {npcHandler = npcHandler, text = "Sand, sand and again sand. Sand all over. Yes, I'd say: it's truly a desert!"})
keywordHandler:addKeyword({'door'}, StdModule.say, {npcHandler = npcHandler, text = "Who needs doors? Free your mind!"})
keywordHandler:addKeyword({'library'}, StdModule.say, {npcHandler = npcHandler, text = "I heard of the library, but I never was very interested in it."})
keywordHandler:addKeyword({'book'}, StdModule.say, {npcHandler = npcHandler, text = "Read books, it increases your intelligence and, furthermore, it's a great source of inspiration!"})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, text = "I can offer you religion and mysticism."})
keywordHandler:addKeyword({'secret'}, StdModule.say, {npcHandler = npcHandler, text = "Secrets ... What do you mean?"})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, text = "Who needs weapons? I never had and i never will have weapons - what for?"})
keywordHandler:addKeyword({'sword'}, StdModule.say, {npcHandler = npcHandler, text = "Swords? Don't you have something else to do?"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = "Help? Help? Nothing more? Don't we all demand some help?"})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, text = "Leave me alone. I don't want to fight."})
keywordHandler:addKeyword({'tower'}, StdModule.say, {npcHandler = npcHandler, text = "The tower was built and inhabited by the great sage Jakundaf himself. It's a shame that it can be rented nowadays. People have no respect for the past!"})
keywordHandler:addKeyword({'treasure'}, StdModule.say, {npcHandler = npcHandler, text = "Treasures? What is a treasure for you?"})
keywordHandler:addKeyword({'gharonk'}, StdModule.say, {npcHandler = npcHandler, text = "Hmmmm... I don't know much about it."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "What's that? You start annoying me."})
keywordHandler:addKeyword({'jakundaf'}, StdModule.say, {npcHandler = npcHandler, text = "The sage Jakundaf has studied the nature of this desert about a generation ago. For this reason, people started to call it Jakundaf desert after a while ... Before Jakundaf, the desert was just known as the wasteland. This desert isn't a natural one, rather it was created by a magical accident in a long forgotten battle ... Here in the desert, Fafnar's burning eye is strong and powerful!"})
keywordHandler:addKeyword({'priest'}, StdModule.say, {npcHandler = npcHandler, text = "I live a solitary life here to meditate and contemplate."})
keywordHandler:addKeyword({'way'}, StdModule.say, {npcHandler = npcHandler, text = "Way? Which way? I forgot where most ways go to... excuse me."})

npcHandler:setMessage(MESSAGE_GREET, 'Hello, |PLAYERNAME|! What can I do for you?.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye.')

npcHandler:addModule(FocusModule:new())
