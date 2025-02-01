 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'runes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell: animate dead, blank rune, desintegrate, energy bomb, fireball, magic wall, paralyze, poison bomb, soulfire, stone shower, wild growth, antidote, chamaleon, convince creature, destroy field, energy field, energy wall, explosion, fire bomb, fire field, greate fireball, light magic missile, heavy magic missile, intense healing, poison field, poison wall, stalagmite, ultimate healing and sudden death.'})
keywordHandler:addKeyword({'potions'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell: mana fluid and life fluid.'})
keywordHandler:addKeyword({'wands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell: wand of vortex, wand of dragonbreath, wand of plague, wand of cosmic energy and wand of inferno..'})
keywordHandler:addKeyword({'rods'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell: snakebite rod, moonlight rod, volcanic rod, quagmire rod and tempest rod'})


shopModule:addBuyableItem({'spellbook'}, 2175, 150, 'spellbook')
shopModule:addBuyableItem({'magic lightwand'}, 2163, 400, 'magic lightwand')

shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 2006, 100, 7, 'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 2006, 60, 2, 'life fluid')

shopModule:addBuyableItemContainer({'bp mf'}, 2001, 2006, 1000, 7, 'backpack of mana fluids')
shopModule:addBuyableItemContainer({'bp lf'}, 2000, 2006, 1000, 2, 'backpack of life fluids')

shopModule:addBuyableItem({'animate dead'}, 2316, 750, 1, 'animate dead rune')
shopModule:addBuyableItem({'blank rune'}, 2260, 10, 1, 'blank rune')
shopModule:addBuyableItem({'desintegrate'}, 2310, 160, 3, 'desintegrate rune')
shopModule:addBuyableItem({'energy bomb'}, 2262, 650, 2, 'energy bomb rune')
shopModule:addBuyableItem({'great fireball rune'}, 2304, 360, 2, 'great fireball rune')
shopModule:addBuyableItem({'fireball rune'}, 2302, 190, 3, 'fireball rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 700, 3, 'magic wall rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 1400, 1, 'paralyze rune')
shopModule:addBuyableItem({'poison bomb'}, 2286, 340, 2, 'poison bomb rune')
shopModule:addBuyableItem({'soulfire'}, 2308, 420, 2, 'soulfire rune')
shopModule:addBuyableItem({'wild growth'}, 2269, 160, 1, 'wild growth rune')

shopModule:addSellableItem({'vial', 'flask'}, 7490, 5, 'empty vial', 0)

shopModule:addBuyableItem({'antidote'}, 2266, 130, 1, 'antidote rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 420, 1, 'chameleon rune')
shopModule:addBuyableItem({'convince creature'}, 2290, 160, 1, 'convince creature rune')
shopModule:addBuyableItem({'destroy field'}, 2261, 90, 3, 'destroy field rune')
shopModule:addBuyableItem({'energy field'}, 2277, 250, 3, 'energy field rune')
shopModule:addBuyableItem({'energy wall'}, 2279, 680, 4, 'energy wall rune')
shopModule:addBuyableItem({'explosion'}, 2313, 500, 3, 'explosion rune')
shopModule:addBuyableItem({'fire bomb'}, 2305, 470, 2, 'fire bomb rune')
shopModule:addBuyableItem({'fire field'}, 2301, 170, 3, 'fire field rune')
shopModule:addBuyableItem({'fire wall'}, 2303, 490, 4, 'fire wall rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 250, 5, 'heavy magic missile rune')
shopModule:addBuyableItem({'intense healing'}, 2265, 190, 1, 'intense healing rune')
shopModule:addBuyableItem({'light magic missile'}, 2287, 80, 5, 'light magic missile rune')
shopModule:addBuyableItem({'poison field'}, 2285, 130, 3, 'poison field rune')
shopModule:addBuyableItem({'poison wall'}, 2289, 420, 4, 'poison wall rune')
shopModule:addBuyableItem({'stalagmite'}, 2292, 125, 1, 'stalagmite rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 650, 1, 'sudden death rune')
shopModule:addBuyableItemContainer({'bp sd'}, 2003, 2268, 6500, 1, 'backpack of sudden death rune')
shopModule:addBuyableItem({'ultimate healing'}, 2273, 350, 1, 'ultimate healing rune')
shopModule:addBuyableItemContainer({'bp uh'}, 2002, 2273, 3500, 1, 'backpack of healing rune')
shopModule:addBuyableItemContainer({'bp gfb'}, 2000, 2304, 3600, 1, 'backpack of great fireball rune')

shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 500, 'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of plague', 'plague'}, 2188, 5000, 'wand of plague')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 15000, 'wand of inferno')

shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'volcanic rod', 'volcanic'}, 2185, 1000, 'volcanic rod')
shopModule:addBuyableItem({'quagmire rod', 'quagmire'}, 2181, 2000, 'quagmire rod')
shopModule:addBuyableItem({'tempest rod', 'tempest'}, 2183, 3000, 'tempest rod')



npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())