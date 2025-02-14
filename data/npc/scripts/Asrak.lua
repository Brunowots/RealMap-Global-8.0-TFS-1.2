local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

-- Free Account spells
-- Knight Spells

local node1 = keywordHandler:addKeyword({'great light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn Great Light for 500 gp?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'great light',vocation = 4, price = 500, level = 13})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

local node1 = keywordHandler:addKeyword({'light healing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn Light Healing for 170 gp?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'light healing',vocation = 4, price = 170, level = 8})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

local node1 = keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn Light for 100gp?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'light',vocation = 4, price = 100, level = 8})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

local node1 = keywordHandler:addKeyword({'find person'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn Find Person for 80 gold coins?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'find person',vocation = 4, price = 80, level = 8})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

local node1 = keywordHandler:addKeyword({'antidote'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn Antidote for 150 gold coins?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'antidote',vocation = 4, price = 150, level = 10})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

-- Paladin Spells

local node1 = keywordHandler:addKeyword({'conjure arrow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn Conjure Arrow for 450 gold coins?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'conjure arrow',vocation = 3, price = 450, level = 13})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

local node1 = keywordHandler:addKeyword({'conjure explosive arrow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn Conjure Explosive Arrow for 1000 gold coins?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'conjure explosive arrow',vocation = 3, price = 1000, level = 25})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

local node1 = keywordHandler:addKeyword({'destroy field'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn Destroy Field for 700 gold coins?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'destroy field',vocation = 3, price = 700, level = 17})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})

local node1 = keywordHandler:addKeyword({'intense healing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn Intense Healing for 350 gold coins?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'intense healing',vocation = 3, price = 350, level = 20})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})




keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the overseer of the pits and the trainer of the gladiators."})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the overseer of the pits and the trainer of the gladiators."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known as Asrak the Ironhoof."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I pledge no allegiance to any king, be it human or minotaurean."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I pledge no allegiance to any king, be it human or minotaurean."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The city pays me well and those undisciplined gladiators need my skills and guidance badly."})
keywordHandler:addKeyword({'gladiator'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Those wannabe fighters are weak and most of them are unable to comprehend a higher concept like the Mooh'Tah."})
keywordHandler:addKeyword({'trainer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Those wannabe fighters are weak and most of them are unable to comprehend a higher concept like the Mooh'Tah."})
keywordHandler:addKeyword({'minotaur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In the ancient wars we lost much because of the rage. The one good thing is we lost our trust in the gods, too."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "By them we were imbued with the rage that almost costed our existence. By them we were used as pawns in wars that were not ours."})
keywordHandler:addKeyword({'mintwallin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The city is only a shadow of what we could have accomplished without that curse of rage that the gods bestowed upon us"})
keywordHandler:addKeyword({'rage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Rage is the legacy of Blog, the beast. To overcome it is our primal goal. The Mooh'Tah is our only hope of salvation and perfection."})
keywordHandler:addKeyword({'guidance'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Like all true minotaurean blademasters I am a warrior-philosopher of the Mooh'Tah."})
keywordHandler:addKeyword({"mooh'tah"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Mooh'Tah teaches us control. It provides you with weapon, armor, and shield. It teaches you harmony and focus."})
keywordHandler:addKeyword({'harmony'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There is an elegant harmony in every thing done right. If you feel the harmony of an action you can sing its song."})
keywordHandler:addKeyword({'sing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Each harmonic action has it own song. If you can sing it, you are in harmony with that action. This is where the minotaurean battlesongs come from."})
keywordHandler:addKeyword({'song'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Each harmonic action has it own song. If you can sing it, you are in harmony with that action. This is where the minotaurean battlesongs come from."})
keywordHandler:addKeyword({'battlesongs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Each Mooh'Tah master focuses his skills on the harmony of battle. He is one with the song that he's singing with his voice or at least his heart."})
keywordHandler:addKeyword({"mooh'tah master"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mooh'Tah masters are the epitome of the minotaurean warrior-philosophers. Full in control, free of rage, focused in perfect harmony with their actions."})
keywordHandler:addKeyword({"warrior-philosopher"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mooh'Tah masters are the epitome of the minotaurean warrior-philosophers. Full in control, free of rage, focused in perfect harmony with their actions."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your human generals are like their warriors. They lack the focus to be a true warrior."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your human army might be big, but without skills. They are only sheep to be slaughtered."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To rely on magic is like to cheat fate. All cheaters will find their just punishment one day, and so will he."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If it's truly a weapon to slay gods it might be worth to be sought for."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Focus on your own life, not on that of others."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I teach worthy warriors the way of the knight."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Inferior creatures of rage, driven by their primitive urges. Only worthy to be noticed to test one's skills."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dungeons of your desires and fears are the only ones you really should fear and those you really have to conquer."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hope you learned something."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I offer you the teachings of knighthood and the way of the paladin."})
keywordHandler:addKeyword({'training'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I offer you the teachings of knighthood and the way of the paladin."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not a merchant, but a warrior."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not a merchant, but a warrior."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Make your will your weapon, and your enemies will perish."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Courage is the only armor that shields you against rage and fear, the greatest dangers you will have to face."})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your confidence shall be your shield. Nothing can penetrate that defence. No emotion will let you lose your focus."})
keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell knight spells (Great Light), (Light healing), (Light), (Find Person), and (Antidote) as well as Paladin spells (Conjure Arrow), (Conjure Explosive Arrow), (Destroy Field) and (Intense Healing)!"})

npcHandler:addModule(FocusModule:new())