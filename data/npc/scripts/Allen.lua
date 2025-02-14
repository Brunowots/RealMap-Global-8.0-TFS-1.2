local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'wooden chair'}, 					Cfwoodenchair, 15)
shopModule:addBuyableItem({'sofa chair'}, 					Cfsofachair, 55)
shopModule:addBuyableItem({'red cushioned chair'}, 					Cfredcushionedchair, 40)
shopModule:addBuyableItem({'green cushioned chair'}, 					Cfgreencushionedchair, 40)

keywordHandler:addKeyword({'chair'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell wooden, sofa, red cushioned and green cushioned chairs."})

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Allen Richardson. I am the owner of this market."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I run this market and sell furniture."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, no time to chat, let's trade."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this counter you can buy chairs. What do you need?"})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this counter you can buy chairs. What do you need?"})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this counter you can buy chairs. What do you need?"})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this counter you can buy chairs. What do you need?"})
keywordHandler:addKeyword({'furniture'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this counter you can buy chairs. What do you need?"})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this counter you can buy chairs. What do you need?"})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, text = "This bunch of scheming women proves Thais's weakness best."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = "This city is somewhat outdated."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, text = "This is the best city in the whole world! We don't care about greedy kings or ambitious priests and the like ... One fine day our leaders will declare Venore's independence!"})
keywordHandler:addKeyword({'leaders'}, StdModule.say, {npcHandler = npcHandler, text = "Venore's wealth is based on wise decisions and transactions made by the traders union. They know what people actually want and need, unlike some magistrates or civil servants."})
keywordHandler:addKeyword({'abran ironeye'}, StdModule.say, {npcHandler = npcHandler, text = "Well, that's what I call a real man. This man is a hero! A fighter! A general! If we had an army, he'd be the right man to lead it!"})
keywordHandler:addKeyword({'leeland'}, StdModule.say, {npcHandler = npcHandler, text = "Mr. Slim sold me the legendary screwdriver of Kurik! All I had to do was play a small prank on grumpy Aldo. I told him his wife had actually cooked something for lunch ... He had tears in his eyes when he was running home. Hehe! Guess what? Some criminal stole the screwdriver shortly after and replaced it with an old toothbrush!"})

npcHandler:addModule(FocusModule:new())