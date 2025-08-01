BEGIN WNBOA

// WNAjantisQuest = the stage of Ajantis's quest (increments by five)
// FenaFirst = Fenathigrast sought First
// BoaFirst = Boa + shield sought First
// BoaHaggled = price down from 6k to 5k

// Technically AjantisQuest doesn't need to be as checked as often as it is, but for debugging's sake, I have included it even when it is redundant.

CHAIN IF~Global("BoaTalk","GLOBAL",0)~THEN WNBOA 01
~Ah, a potential customer in this dreary hovel. Good. I've many wares that might catch the fancy of one such as you, well equipped as you are—for the discerning eye, my stock might just be the most valuable thing you'll get down here. What say you to a little trade, friend?~
	END
		IF~~THEN REPLY ~You're a merchant? Let's see what you have.~ EXTERN WNBOA 02
		IF~~THEN REPLY ~What kind of person runs a shop out of a brothel?~ EXTERN WNBOA 03
		//BoaFirst line
		IF~Global("WNFenaFirst","GLOBAL",0) GlobalLT("WNBoaFirst","GLOBAL",2)Global("WNAjantisQuest","GLOBAL",15)~THEN REPLY ~Have you obtained any shields recently? Perhaps of the holy variety?~ DO ~SetGlobal("WNBoaFirst","GLOBAL",1)~ EXTERN WNBOA 04
		IF~Global("WNFenaFirst","GLOBAL",0) GlobalLT("WNBoaFirst","GLOBAL",2)Global("WNAjantisQuest","GLOBAL",15)~THEN REPLY ~I'm here about the shield that Peitor sold to you.~ DO ~SetGlobal("WNBoaFirst","GLOBAL",1)~ EXTERN WNBOA 05
		IF~Global("WNFenaFirst","GLOBAL",0) Global("WNBoaFirst","GLOBAL",2)Global("WNBoaHaggled","GLOBAL",1)PartyGoldGT(5000)~ THEN REPLY ~I have 5000 gold for you. Now hand over the shield.~ EXTERN WNBOA 14
		IF~Global("WNFenaFirst","GLOBAL",0) Global("WNBoaFirst","GLOBAL",2)!Global("WNBoaHaggled","GLOBAL",1)PartyGoldGT(6000)~ THEN REPLY ~I have 6000 gold for you. Now hand over the shield.~ EXTERN WNBOA 14
		//FenaFirst line
		IF~Global("WNFenaFirst","GLOBAL",1)Global("WNAjantisQuest","GLOBAL",15)~THEN REPLY ~Have you obtained any shields recently? Perhaps of the holy variety?~ EXTERN WNBOA Second.00
		IF~Global("WNFenaFirst","GLOBAL",1)Global("WNAjantisQuest","GLOBAL",15)~THEN REPLY ~I'm here about the shield that Peitor sold to you.~ EXTERN WNBOA Second.00
		IF~~THEN REPLY ~Nothing, thank you.~ EXIT
	
CHAIN WNBOA 02
~The world runs on gold, and I run on making it. I assure you my prices are all fair. Come take a look at my wares.~
DO ~StartStore("wnboa", LastTalkedToBy)~ EXIT

CHAIN WNBOA 03
~The kind of that enjoys proximity to an indulgent clientele, and the privacy that it affords. Perhaps saying that I "enjoy" it is too strong a declaration—it's vastly preferable than answering to the Flaming Fist on the surface... not that I don't see a few of them in here from time to time. Heh.~
	END
		IF~~THEN REPLY ~I'll happily indulge in your stock if the price suits me. Show me what you've got.~ EXTERN WNBOA 02
		//BoaFirst line
		IF~Global("WNFenaFirst","GLOBAL",0) GlobalLT("WNBoaFirst","GLOBAL",2) Global("WNAjantisQuest","GLOBAL",15)~THEN REPLY ~Have you obtained any shields recently? Perhaps of the holy variety?~ DO ~SetGlobal("WNBoaFirst","GLOBAL",1)~ EXTERN WNBOA 04
		IF~Global("WNFenaFirst","GLOBAL",0) GlobalLT("WNBoaFirst","GLOBAL",2) Global("WNAjantisQuest","GLOBAL",15)~THEN REPLY ~I'm here about the shield that Peitor sold to you.~ DO ~SetGlobal("WNBoaFirst","GLOBAL",1)~ EXTERN WNBOA 05
		IF~Global("WNFenaFirst","GLOBAL",0) Global("WNBoaFirst","GLOBAL",2)Global("WNBoaHaggled","GLOBAL",1)PartyGoldGT(5000)~ THEN REPLY ~I have 5000 gold for you. Now hand over the shield.~ EXTERN WNBOA 14
		IF~Global("WNFenaFirst","GLOBAL",0) Global("WNBoaFirst","GLOBAL",2)!Global("WNBoaHaggled","GLOBAL",1)PartyGoldGT(6000)~ THEN REPLY ~I have 6000 gold for you. Now hand over the shield.~ EXTERN WNBOA 14
		//FenaFirst line
		IF~Global("WNFenaFirst","GLOBAL",1)Global("WNAjantisQuest","GLOBAL",15)~THEN REPLY ~Have you obtained any shields recently? Perhaps of the holy variety?~ EXTERN WNBOA Second.00
		IF~Global("WNFenaFirst","GLOBAL",1)Global("WNAjantisQuest","GLOBAL",15)~THEN REPLY ~I'm here about the shield that Peitor sold to you.~ EXTERN WNBOA Second.00
		IF~~THEN REPLY ~I'd rather not do business with someone like you.~ EXIT
		
CHAIN WNBOA 04
~Ah, you're here about the auction? You should know to... Hm. No, that's not right. The boy sent you, didn't he?~ EXTERN WNBOA 06

CHAIN WNBOA 05
~Peitor? The boy? He doesn't seem to understand that it's already due for auction.~ EXTERN WNBOA 06

CHAIN WNBOA 06
~You some muscle he hired to get it back? I told him that all sales are final, no matter how he feels about it.~
	END
		IF~~THEN REPLY ~We're working for the Church of Helm. It's a holy artifact and must be returned.~ EXTERN WNBOA 07
		IF~~THEN REPLY ~He didn't hire us. We're interested in buying it from you.~ EXTERN WNBOA 08
		IF~~THEN REPLY ~What were you saying about an auction?~ EXTERN WNBOA 09
		
CHAIN WNBOA 07
~I'm quite aware of what it is, and it was well worth my investment. It will fetch a pretty sum at auction, your god aside.~ EXTERN AJANTJ Res.1

CHAIN WNBOA 08
~I thought I sensed a kindred spirit in you. Business is my lifeblood, but as I said, plans are already in motion for the shield.~ EXTERN AJANTJ Res.1

CHAIN WNBOA 09
~A selection of rather enthusiastic Baldurians have expressed their interest in the shield. You are the latest.~ EXTERN AJANTJ Res.1

CHAIN AJANTJ Res.1
~You cannot sell a religious artifact to a collector! It's blasphemous to even suggest it. You still have it—hand it over in the name of Helm, lest you meet my righteous blade.~
== WNBOA ~You, ah, do seem rather upset about it. Please, let's not be barbarians—if it would please you, we could remove the middleman and do business right here... though such a transaction may have consequences that I'll need you to fix.~
	END
		IF~~THEN REPLY ~I'm listening.~ EXTERN WNBOA 11
		IF~~THEN REPLY ~No, I don't think so. Give me the shield, or I'll take it by force.~ EXTERN WNBOA 13

CHAIN WNBOA 11
~Good. I have the boy's shield with me, it's true, but there are a number of people climbing over themselves for this thing that will be displeased if I sell it to you. I was about to go visit them myself, but truth be told they aren't the most pleasant bunch. I don't much care for their feelings on the matter, only their patronage.~ EXTERN WNBOA 12

CHAIN WNBOA 12
~If you buy the shield and go smooth things over with my auction-goers... explain that it was a fake, or that the Fist caught wind of the deal—I frankly don't care what you tell them, so long as they understand that it's not my fault that it's out of their grubby paws—then I'll offer you the shield for 6000 gold pieces.~
	END
		IF~PartyGoldGT(6000)~THEN REPLY ~Done. Give it to me, and I'll see what I can do about your auction-goers.~ EXTERN WNBOA 14
		IF~~THEN REPLY ~6000 gold? Are you insane?~ EXTERN WNBOA 15
		IF~~THEN REPLY ~I don't think so. Lower the price otherwise you'll be getting a visit from the Fist soon.~ EXTERN WNBOA 16
		IF~~THEN REPLY ~No. Give me the shield or I'll flay you within an inch of your life.~ EXTERN WNBOA 17
		IF~~THEN REPLY ~I'll be back when I have the gold.~ EXTERN WNBOA 18
		
CHAIN WNBOA 13
~You don't want to rough me up. It's not a threat, my friend, just an observation. I've many goods and services you might find to your liking, and my guards are no hired goons.~ EXTERN WNBOA 12

CHAIN WNBOA 15
~Quite. Poaching such an item from the auction block for a pittance and a favor at the last moment is not standard practice, but I get the sense that you are not a standard customer.~ EXTERN WNBOA 12

CHAIN WNBOA 16
~The Flaming Fist are my loyal customers! You'll find that many among their number will be more or less reluctant to see me brought to 'justice', and I'm sure they would no more like the things I've learned of them down here revealed to their spouses.~
END
IF ~OR(2) CheckStatGT(Player1,15,STR) CheckStatGT(Player1,15,CHR)~ THEN DO ~AddJournalEntry(@107, QUEST)~ EXTERN WNBOA Intimidated
IF ~OR(2) !CheckStatGT(Player1,15,STR) !CheckStatGT(Player1,15,CHR)~ THEN DO ~AddJournalEntry(@106, QUEST)~ EXTERN WNBOA Steadfast
	
CHAIN WNBOA Intimidated
~I can tell you don't play about, though. For that, I'll offer you the shield for 5000 gold—and no less! That's a generous bit of business you'll not see the likes of elsewhere.~ DO ~SetGlobal("WNBoaHaggled","GLOBAL",1)~ EXTERN WNBOA Return

CHAIN WNBOA Steadfast
~I'm afraid it's the full 6000 or nothing, my friend. It's simply the way business works.~ EXTERN WNBOA Return

CHAIN WNBOA Return
~So what will it be?~
	END
		IF~!Global("WNBoaHaggled","GLOBAL",1)PartyGoldGT(6000)~THEN REPLY ~Fine. Give it to me, and I'll see what I can do about your auction-goers.~ EXTERN WNBOA 14
		IF~Global("WNBoaHaggled","GLOBAL",1)PartyGoldGT(5000)~THEN REPLY ~Very well. 5000 gold it is, and I'll see what I can do about your auction-goers.~ EXTERN WNBOA 14
		IF~~THEN REPLY ~This is the way I do business: I'm going to get violent now if you don't give me the shield.~ EXTERN WNBOA 17
		IF~~THEN REPLY ~I'll be back with the gold.~ EXTERN WNBOA 18
		
CHAIN WNBOA 14
~A good deal, if I do say so myself. Here's your shield—the auction is taking place shortly on the top floor of the Three Old Kegs, in one of the fancy rooms. If I hear things went smoothly, I'll throw in a gift next I see you, eh? Enjoy yourself, my friend.~
== AJANTJ IF ~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS")~ THEN ~No gift will make up for the indignity of buying our way through to the shield's recovery. At least we have it in our possession, now... and what a fine piece it is, too.~
END
IF ~!Global("WNBoaHaggled","GLOBAL",1)~ THEN EXTERN WNBOA GetShield
IF ~Global("WNBoaHaggled","GLOBAL",1)~ THEN EXTERN WNBOA GetShieldCheap

CHAIN WNBOA GetShield
~Chin up. You got what you came here for. Now, please excuse me. I've some business to attend to.~
DO ~GiveItem("WNAJSH",player1)
	TakePartyGold(6000)
	SetGlobal("WNBoaFirst","GLOBAL",5)
	AddJournalEntry(@108, QUEST)
	AddJournalEntry(@117, INFO)~
EXIT

CHAIN WNBOA GetShieldCheap
~Chin up. You got what you came here for. Now, please excuse me. I've some business to attend to.~
DO ~GiveItem("WNAJSH",player1)
	TakePartyGold(5000)
	SetGlobal("WNBoaFirst","GLOBAL",5)
	AddJournalEntry(@108, QUEST)
	AddJournalEntry(@117, INFO)~
EXIT

CHAIN WNBOA 17
~That's a shame. I always aspire to do business like a gentleman my ma would be proud of, but some fools are just asking for a stabbing!~
DO ~Enemy()~ EXIT

CHAIN WNBOA 18
~I'll be waiting for it. Perhaps you could score some extra gold selling me some of that fancy adventuring gear you're carrying around. No? Ah, well. See you soon, my friend.~
DO ~SetGlobal("WNBoaFirst","GLOBAL",2)~
EXIT

// FenaFirst dialogue

CHAIN WNBOA Second.00
~Eh... you don't look like one of my usuals. The boy send you? Unfortunately, you're a mite late—the blasted thing was just sent to auction.~
== AJANTJ IF ~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS")~ THEN ~Auction?! Unbelievable.~
== WNBOA ~Don't look at me like that, I'm tellin' the truth! If you're not an on-duty member of the Flaming Fist or some such, I'll tell you where to go if you're that keen to get your hands on it.~
	END
		IF~~THEN REPLY ~Fine. Where's the auction happening?~ EXTERN WNBOA Second.01
		IF~~THEN REPLY ~Do I have to wring the information out of you? Tell me, damn it!~ EXTERN WNBOA Second.02
		IF~~THEN REPLY ~Flaming Fist? Us? Don't make me laugh.~ EXTERN WNBOA Second.03
		
CHAIN WNBOA Second.01 ~Top floor of the Three Old Kegs—one of the rooms up there is hosting the auction. Knock on doors till you find it. Don’t go scaring the silk-wrapped types too much, or they’ll call the Fist and we’ll both be in it deep. Go on, and don’t say Boa never helped ya out. Now scram!~
	DO ~SetGlobal("WNAjantisQuest","GLOBAL",16) AddJournalEntry(@111, QUEST)~ EXIT
	
CHAIN WNBOA Second.02 ~Only if you want to be thrown head first into the sewers! Haw! Now settle down.~ EXTERN WNBOA Second.01

CHAIN WNBOA Second.03 ~I've not seen you 'round here much, so I'm inclined to believe you. I keep tabs on all the off duty mercs down here, heh.~ EXTERN WNBOA Second.01



// First time returning to Boa after the BoaFirst auction

CHAIN IF WEIGHT #-1 ~Global("WNAuctionCrashed","GLOBAL",1)~ THEN WNBOA HappyAuc.00
~Well, I’ll be damned. You actually managed to walk the shield out and smooth those vultures’ ruffled feathers. I was half-expecting to see your corpse thrown out a window, though I'm glad to see you're a capable business<PRO_MANWOMAN>. Here—take these. Consider it a token of appreciation from one professional to another. If you ever need good prices, you know where to find me.~
DO ~SetGlobal("WNAuctionCrashed","GLOBAL",4)
	GiveItemCreate("potn07",LastTalkedToBy,1,0,0)
	GiveItemCreate("potn42",LastTalkedToBy,1,0,0)
	GiveItemCreate("scrl5a",LastTalkedToBy,1,0,0)
	GiveItemCreate("scrl5k",LastTalkedToBy,1,0,0)~
	EXIT

//Give player reward

CHAIN IF WEIGHT #-1 ~Global("WNAuctionCrashed","GLOBAL",2)~ THEN WNBOA BadAuc.00
~That was a gods-damned fiasco. You call that smoothing things over? I'd have had better luck asking a gnoll to sort that out. If the Fist start poking around, I’ll know who to thank. Now get out before I decide you’re more trouble than you’re worth.~
DO ~SetGlobal("WNAuctionCrashed","GLOBAL",4)~ EXIT // Nothing

CHAIN IF WEIGHT #-1 ~Global("WNAuctionCrashed","GLOBAL",3)~ THEN WNBOA DeadAuc.00
~You really couldn’t leave well enough alone, could you? Word’s already spreading—Boa can’t keep his house in order, his deals end with blood staining the rugs. You expect me to thank you for what you did? I'll show you just how appreciative I am.~
DO ~SetGlobal("WNAuctionCrashed","GLOBAL",4) Shout(1) Enemy()~ EXIT