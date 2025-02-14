local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, "The gods must be praised that I am finally saved. I do not have many worldly possessions, but please accept a small reward, do you?")
	elseif	player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand) >= 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Thanks for saving my life! Should I teleport you out of the Dark Cathedral?")
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "Yes") then
		if player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand) < 1 then
			npcHandler:say("I will tell you a small secret now. My friend Lynda in Thais can create a blessed wand. Greet her from me, maybe she will aid you.", cid)
			player:setStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand, 1)
			player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1) --this for default start of Outfit and Addon Quests
		elseif player:getStorageValue(Storage.OutfitQuest.MageSummoner.AddonWand) >= 1 then
			player:teleportTo(Position(32659, 32340, 7))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return true
end

keywordHandler:addKeyword({'saved'}, StdModule.say, {npcHandler = npcHandler, text = "I'm a priestess and I travelled here to learn about that order of the humble path I heard about. ... But when I started my investigations, this false monk Lorbas thought that I was suspicious and so he ordered his minions to take me as prisoner."})
keywordHandler:addKeyword({'humble path'}, StdModule.say, {npcHandler = npcHandler, text = "There are no records about the foundation of this order, and it is unknown where its 'monks' come from. Yet, travellers told us that they are living near the remains of the dark cathedral."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "There are no records about the foundation of this order, and it is unknown where its 'monks' come from. Yet, travellers told us that they are living near the remains of the dark cathedral."})
keywordHandler:addKeyword({'cathedral'}, StdModule.say, {npcHandler = npcHandler, text = "The cathedral was meant to be a centre of piety and believe. A prayer to the gods that had become solid. ... The construction works started at the height of the order of the Nightmare Knights, right after they had won a major battle near the place where the cathedral was to be built. ... The cathedral was meant to become a monument of the victory of good over evil. ... Sadly it was just not meant to be. ... As the cathedral was nearly finished, most of the monks had already moved in and even a small town for all the workers and suppliers had established itself. ... But then the structure was struck by an earthquake and the work of two generations was destroyed. ... Later the dwarven constructors explained that this was caused by volcanic activities and a massive cave-in. ... Since the gods did not interfere and the setting was close to the notorious Pits of Inferno, it was assumed that this was the work of secret demonic powers."})
keywordHandler:addKeyword({'gods'}, StdModule.say, {npcHandler = npcHandler, text = "I'd love to discuss the teachings of the gods with you but this is neither the time nor the place."})
keywordHandler:addKeyword({'monk'}, StdModule.say, {npcHandler = npcHandler, text = "I learnt that these monks are impostors that use false promises to lure unwary ones into the arms of their strange cult which seems to have more political than religious agendas."})
keywordHandler:addKeyword({'cult'}, StdModule.say, {npcHandler = npcHandler, text = "The cult is secretly looking for the unsatisfied, disgruntled and poor. Its members promise such sad individuals wealth, revenge and a cause. ... They lure them into the cells of their cult. Here they learn how to undermine the authorities of their cities. They are trained as thieves, spies and smugglers first. ... Those who prove themselves as the most promising candidates are recruited to a special hidden circle. There they learn the dark arts of poisoning and murder, or elocution and agitation to become assassins and recruiters for the cult. ... I know nothing about their agenda but I am quite sure there has to be some higher power behind all of this."})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, text = "I've no idea who is the mastermind behind all this, but it seems too big and too well organised to be the work of only a handful of false monks."})
keywordHandler:addKeyword({'prisoner'}, StdModule.say, {npcHandler = npcHandler, text = "I think Lorbas liked the idea to 'convert' me to their twisted cult and saw it as a test for their leaders. Now that the magic symbols are turned off, I will gather my strength within some hours and teleport to safety."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "One day this weapon will be unearthed and then it will be wielded against the servants of the evil."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "He is only one of the many servants of the evil. Eventually he will fall but there will be others to take his place."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = "We all have to help to make this world a better place."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = "The king is a wise ruler but his realm is large and we all need to work hard to make the world a better place."})
keywordHandler:addKeyword({'ab\'dendriel'}, StdModule.say, {npcHandler = npcHandler, text = "The elves have lost their balance and identity. In this unstable state they can easily be misled or might draw the wrong conclusions."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, text = "The elves have lost their balance and identity. In this unstable state they can easily be misled or might draw the wrong conclusions."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, text = "The druids have their own way to interpret the gods' will and this has to be respected."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, text = "The dwarves carry bitterness and pain in their souls. But it is them that have forgotten about the gods and not the other way around."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, text = "The dwarves carry bitterness and pain in their souls. But it is them that have forgotten about the gods and not the other way around."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, text = "The downfall of some of the most noble knights there should serve us as a warning to stay on guard for the evil that wants to lure us on the wrong path."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, text = "I know only little about the teachings of Daraman but as far as I heard they concentrate too much on the single individual instead on the world as a whole."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, text = "A far away continent that will widen our view of the wonders the gods provide us with."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, text = "This city is the best example where godless philosophies might lead to."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = "Many see Thais as a fallen city but it is only the loudness of an ugly minority that gives people this impression."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, text = "Sadly the trade barons care more about wealth than the gods."})


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:setMessage(MESSAGE_GREET, 'The gods must be praised that I am finally saved.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'May the gods bless you.')

npcHandler:addModule(FocusModule:new())
