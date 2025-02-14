local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end

-- Storage IDs --

fhunter        = 22003 
shunter        = 22004 

newaddon    = 'Ah, right! The hooded cloak or winged tiara! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function HunterFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fhunter)
    if addon == -1 then
        if getPlayerItemCount(cid,5947) >= 1 and getPlayerItemCount(cid,5876) >= 100 and getPlayerItemCount(cid,5948) >= 100 and getPlayerItemCount(cid,5891) >= 5 and getPlayerItemCount(cid,5887) >= 1 and getPlayerItemCount(cid,5888) >= 1 and getPlayerItemCount(cid,5889) >= 1 then
        if doPlayerRemoveItem(cid,5947,1) and doPlayerRemoveItem(cid,5876,100) and doPlayerRemoveItem(cid,5948,100) and doPlayerRemoveItem(cid,5891,5) and doPlayerRemoveItem(cid,5887,1) and doPlayerRemoveItem(cid,5888,1) and doPlayerRemoveItem(cid,5889,1) then
            npcHandler:say('Ah, right! The hooded cloak or winged tiara! Here you go.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fhunter,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 129, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 137, 2)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function HunterSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,shunter)
    if addon == -1 then
        if getPlayerItemCount(cid,5875) >= 1 then
        if doPlayerRemoveItem(cid,5875,1) then
            npcHandler:say('Ah, right! The sniper gloves! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,shunter,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 129, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 137, 1)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end


node1 = keywordHandler:addKeyword({'hooded cloak'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get hooded cloak you need give me an engraved crossbow, 100 lizard leathers, 100 red dragon leather, 5 enchanted chicken wings, piece of Royal Steel, piece of hell steel and piece of draconian steel. Do you have them with you?'})
node1:addChildKeyword({'yes'}, HunterFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get hooded cloak you need give me an engraved crossbow, 100 lizard leathers, 100 red dragon leather, 5 enchanted chicken wings, piece of Royal Steel, piece of hell steel and piece of draconian steel. Do you have them with you?'})
node2:addChildKeyword({'yes'}, HunterFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'sniper gloves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get sniper gloves you need give me a pair of sniper gloves. Do you have them with you?'})
node3:addChildKeyword({'yes'}, HunterSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node4 = keywordHandler:addKeyword({'second'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get sniper gloves you need give me a pair of sniper gloves. Do you have them with you?'})
node4:addChildKeyword({'yes'}, HunterSecond, {})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "My name is Elane. I am the famous leader of the Paladins."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = "I am the leader of the Paladins. I help our members."})
keywordHandler:addKeyword({'paladins'}, StdModule.say, {npcHandler = npcHandler, text = "Paladins are great warriors and magicians. Besides that we are excellent missile fighters. Many people in Tibia want to join us."})
keywordHandler:addKeyword({'warriors'}, StdModule.say, {npcHandler = npcHandler, text = "Of course, we aren't as strong as knights, but no druid or sorcerer will ever defeat a paladin with a sword."})
keywordHandler:addKeyword({'magicians'}, StdModule.say, {npcHandler = npcHandler, text = "There are many magic spells and runes paladins can use."})
keywordHandler:addKeyword({'missile'}, StdModule.say, {npcHandler = npcHandler, text = "Paladins are the best missile fighters in Tibia!"})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, text = "I am a paladin, not a storyteller."})
keywordHandler:addKeyword({'members'}, StdModule.say, {npcHandler = npcHandler, text = "Every paladin profits from his vocation. It has many advantages to be a paladin."})
keywordHandler:addKeyword({'advantages'}, StdModule.say, {npcHandler = npcHandler, text = "We will help you to improve your skills. Besides I offer spells for paladins."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, text = "Harkath Bloodblade is the royal general."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, text = "Some paladins serve in the kings army."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, text = "A weapon of myth. I don't believe that this weapon exists."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = "Someday I will slay that bastard!"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Oops. I have forgotten my watch."})
keywordHandler:addKeyword({'baxter'}, StdModule.say, {npcHandler = npcHandler, text = "He has some potential."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, text = "How spineless do you have to be to become a jester?"})
keywordHandler:addKeyword({'mcronald'}, StdModule.say, {npcHandler = npcHandler, text = "The McRonalds are simple farmers."})
keywordHandler:addKeyword({'eclesius'}, StdModule.say, {npcHandler = npcHandler, text = "He must have been skilled before he became the way he is now. Such a pity."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, text = "Yes?"})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, text = "The alcohol he sells shrouds the mind and the eye."})
keywordHandler:addKeyword({'galuna'}, StdModule.say, {npcHandler = npcHandler, text = "One of the most important members of our guild. She makes all the bows and arrows we need."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, text = "He sells a lot of useful equipment."})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, text = "He and his guildfellows lack the grace of a true warrior."})
keywordHandler:addKeyword({'harkath bloodblade'}, StdModule.say, {npcHandler = npcHandler, text = "A fine warrior and a skilled general."})
keywordHandler:addKeyword({'king tibianus'}, StdModule.say, {npcHandler = npcHandler, text = "King Tibianus is a wise ruler."})
keywordHandler:addKeyword({'lugri'}, StdModule.say, {npcHandler = npcHandler, text = "A follower of evil that will get what he deserves one day."})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, text = "Mhm, a little too nice for my taste. Still, it's amazing how she endures all those men stalking her, especially this creepy Oswald."})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, text = "A skilled healer, that's for sure."})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, text = "Just another arrogant sorcerer."})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, text = "If there wouldn't be higher powers to protect him..."})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, text = "A humble monk and a wise man."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, text = "Strong man. But a little shy."})


npcHandler:setMessage(MESSAGE_GREET, 'Welcome to the paladins\' guild, Player! How can I help you?.')

npcHandler:addModule(FocusModule:new())