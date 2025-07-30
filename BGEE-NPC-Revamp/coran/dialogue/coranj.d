// Post-Wyvern Reward Talk

CHAIN IF ~Global("wn_coran_wyvern_talk","GLOBAL",1)~ THEN CORANJ CoranTalk.01x00
~You've proven yourself a reliable hunter, <CHARNAME>, and we're all the wealthier for it. I'd be happy to keep enjoying your company—it's been a while since I've had traveling companions, what with my deluge in the forest.~
	END
		IF~~THEN REPLY ~How did you end up hunting wyverns in Cloakwood, anyway?~ EXTERN CORANJ CoranTalk.01x01
		IF~~THEN REPLY ~You must have been brave or stupid to take such a job alone.~ EXTERN CORANJ CoranTalk.01x02
		IF~~THEN REPLY ~Even the best hunters need someone to watch their back.~ EXTERN CORANJ CoranTalk.01x03
		IF~~THEN REPLY ~We don't have time to talk now, Coran.~ EXTERN CORANJ CoranTalk.01xExit
		
CHAIN CORANJ CoranTalk.01x01
~What, a man can't simply do a good deed for nothing more than it being the right thing to do?~ EXTERN CORANJ CoranTalk.01x04

CHAIN CORANJ CoranTalk.01x02
~A little bit of both is what keeps the realms afloat, don't you think?~ EXTERN CORANJ CoranTalk.01x04

CHAIN CORANJ CoranTalk.01x03
~You're right, but I'm no hunter of beasts. Not truly.~ EXTERN CORANJ CoranTalk.01x04

CHAIN CORANJ CoranTalk.01x04
~The wyvern hunt was but a distraction. A lucrative distraction, but one nonetheless. Occasionally my exploits in the Gate have me, ah, less than welcome—so it's good for my health to lay low from time to time. Wouldn't want my legend getting out of hand, eh?~
== CORANJ ~I'll not make it your problem. Our partnership has proven entertaining enough thus far, so I think I'll stick with it for now. If such an arrangement suits you, of course.~
	END
		IF~!Gender(player1,FEMALE)~THEN REPLY ~I'd be pleased to continue having you by my side, Coran.~ EXTERN CORANJ CoranTalk.01x05
		IF~Gender(player1,FEMALE)~THEN REPLY ~I'd be pleased to continue having you by my side, Coran.~ EXTERN CORANJ CoranTalk.01xFem.05
		IF~!Gender(player1,FEMALE)~THEN REPLY ~Likewise. Your skills are too useful to pass up.~ EXTERN CORANJ CoranTalk.01x06
		IF~Gender(player1,FEMALE)~THEN REPLY ~Likewise. Your skills are too useful to pass up.~ EXTERN CORANJ CoranTalk.01xFem.06
		IF~~THEN REPLY ~What do you mean by your 'exploits'? Are you not welcome in Baldur's Gate?~ EXTERN CORANJ CoranTalk.01x07
		IF~~THEN REPLY ~I'm afraid this is where we part ways.~ EXTERN CORANJ CoranTalk.01xLeave

CHAIN CORANJ CoranTalk.01x05
~Excellent! I trust you'll lead us to gold and glory and so on.~ EXTERN CORANJ CoranTalk.01x08

CHAIN CORANJ CoranTalk.01xFem.05
~I had hoped you'd say that. I can imagine little finer than traveling the road with such a woman as yourself.~ EXTERN CORANJ CoranTalk.01x08

CHAIN CORANJ CoranTalk.01x06
~Ah, such warm words of appreciation will no doubt lead to a long and lasting friendship.~ EXTERN CORANJ CoranTalk.01x08

CHAIN CORANJ CoranTalk.01xFem.06
~I'll endeavour not to take your coldness personally. I've cracked tough nuts before.~ EXTERN CORANJ CoranTalk.01x08

CHAIN CORANJ CoranTalk.01x07
~Oh, not in every circle, but I doubt it will prove problematic. A few dalliances with a lass here and there left a few bitter feelings among those with nothing better to worry about, that's all. Like I said—it won't be a problem, so shall we get on with it?~
	END
		IF~~THEN REPLY ~I'd be pleased to continue having you by my side, Coran.~ EXTERN CORANJ CoranTalk.01x05
		IF~~THEN REPLY ~I'd be pleased to continue having you by my side, Coran.~ EXTERN CORANJ CoranTalk.01xFem.05
		IF~~THEN REPLY ~Fine. Just don't cause any trouble.~ EXTERN CORANJ CoranTalk.01x06
		IF~~THEN REPLY ~Fine. Just don't cause any trouble.~ EXTERN CORANJ CoranTalk.01xFem.06
		IF~~THEN REPLY ~I don't think so. You sound like a liability.~ EXTERN CORANJ CoranTalk.01xLeave

CHAIN CORANJ CoranTalk.01x08
~Shall we go and avail ourselves to whatever it is the Sword Coast has to offer us this <DAYNIGHT>?~
DO ~SetGlobal("wn_coran_wyvern_talk","GLOBAL",2)~ EXIT

CHAIN CORANJ CoranTalk.01xExit
~As you wish, my brooding friend. Let us avail ourselves to whatever it is the Sword Coast has to offer us this <DAYNIGHT>, shall we?~
DO ~SetGlobal("wn_coran_wyvern_talk","GLOBAL",2)~ EXIT

CHAIN CORANJ CoranTalk.01xLeave
~If that's how it must be, then I accept your decision. Should you change your mind or simply wish to say hello, I'll be at the Friendly Arm for a time.~
DO ~SetGlobal("wn_coran_wyvern_talk","GLOBAL",2)
ActionOverride("CORAN",ChangeAIScript("",DEFAULT))
ActionOverride("CORAN",LeaveParty())
ActionOverride("CORAN",EscapeArea())
SetGlobal("%KICKED_OUT%","LOCALS",1) 
LeaveParty()
EscapeAreaMove("AR2301",627,941,SE)~ 
EXIT

// Brielbara Talk 1

CHAIN IF ~Global("wn_brielcoran_talk","GLOBAL",1)~ THEN CORANJ CoranQuest1.00
~Sorry, <CHARNAME>. I know I said I wasn't going to turn my problems into yours but it appears that things here have gotten... a little out of hand. We should pay Yago a visit, quickly. I've met the man only once and he certainly seemed like the sort of fellow to curse a child to certain death.~
DO ~SetGlobal("wn_brielcoran_talk","GLOBAL",2)~
EXIT

// Brielbara Talk 2

CHAIN IF ~Global("wn_coranquest_end","GLOBAL",1)~ THEN CORANJ CoranQuest2.00
~I'm glad that mess is done with. As little interest as I have in being a... parent, Yago was a bitter old man and Baldur's Gate is a better place without him. What say you, shall we hit the road?~
	END
		IF~~THEN REPLY ~Really? Your daughter means that little to you?~ EXTERN CORANJ CoranQuest2.01
		IF~~THEN REPLY ~Good. We've spent enough time on family drama—we should be focusing on our real quest.~ EXTERN CORANJ CoranQuest2.02
		IF~~THEN REPLY ~Yes, let's go.~ EXTERN CORANJ CoranQuest2.02
		
CHAIN CORANJ CoranQuest2.01
~Do you really think that I'm the parenting type, <CHARNAME>? I did all that I could be expected to do, so don't try to spin this as some moral failing on my part. Children grow up without fathers all over Faerûn.~
	END
		IF~~THEN REPLY ~If you can't handle the consequences of your actions, then you shouldn't have taken them.~ EXTERN CORANJ CoranQuest2.03
		IF~~THEN REPLY ~A child isn't a burden, Coran. You might find there's joy in being a father—if you gave it a chance.~ EXTERN CORANJ CoranQuest2.04
		IF~~THEN REPLY ~You're right. You would be a dreadful father.~ EXTERN CORANJ CoranQuest2.05
		IF~~THEN REPLY ~If you're certain in your decision, I'll respect it.~ EXTERN CORANJ CoranQuest2.06

CHAIN CORANJ CoranQuest2.03
~You just witnessed me dealing with the consequences. I dealt with them. Now I can move on.~ EXTERN CORANJ CoranQuest2.07
		
CHAIN CORANJ CoranQuest2.04
~Ah, I think not. You're trying to appeal to something within me that simply isn't there, I'm afraid.~ EXTERN CORANJ CoranQuest2.07

CHAIN CORANJ CoranQuest2.05
~I'm glad you see it my way.~ EXTERN CORANJ CoranQuest2.07

CHAIN CORANJ CoranQuest2.06
~I appreciate that. I've no need for moral platitudes.~ EXTERN CORANJ CoranQuest2.07

CHAIN CORANJ CoranQuest2.07
~I'm not about to change my entire life for the sake of a child I've never met. I've done my part—she will live free of the blasted curse. That will have to be enough.~
== SAFANJ IF~InParty("SAFANA")IsValidForPartyDialogue("SAFANA")~THEN ~How utterly typical. A shrug and a wave is all it takes to clear a man's conscience. At least you're consistent, Coran.~
== DYNAHJ IF~InParty("DYNAHEIR")IsValidForPartyDialogue("DYNAHEIR")~THEN ~*sigh* And another child will grow up without a father. 'Tis unfortunate, but I do question Coran's qualifications in the matter.~
== QUAYLJ IF~InParty("QUAYLE")IsValidForPartyDialogue("QUAYLE")~THEN ~You're just abandoning her? That... that doesn't seem right at all.~
== CORANJ ~I'm quite sure we've more important matters to attend to, so let's see to them.~
	END
		IF~~THEN REPLY ~Yes, let's go.~ EXTERN CORANJ CoranQuest2.02
		IF~Gender(player1,FEMALE)~THEN REPLY ~Fine, though I think you're a bastard.~ EXTERN CORANJ CoranQuest2.Fem.08
		IF~!Gender(player1,FEMALE)~THEN REPLY ~Fine, though I think you're a bastard.~ EXTERN CORANJ CoranQuest2.08
		
CHAIN CORANJ CoranQuest2.08
~And I shall hence value your opinion less than I did the day before. Do you feel better now?~
DO ~SetGlobal("wn_coranquest_end","GLOBAL",2)~ EXIT	

CHAIN CORANJ CoranQuest2.Fem.08
~Had I a gold piece for every woman who has told me that, I could buy Waterdeep.~
DO ~SetGlobal("wn_coranquest_end","GLOBAL",2)~ EXIT	

CHAIN CORANJ CoranQuest2.02
~Let's keep this fine little operation of yours moving.~
DO ~SetGlobal("wn_coranquest_end","GLOBAL",2)~ EXIT		




	////////////////////////////
	// Corans's Interjections //
	////////////////////////////
	
	// 52
/// — EM DASH FOR USAGE
// Ajantis
// Alora
// Branwen
// Coran
// Dorn
// Dynaheir
// Edwin
// Eldoth
// Faldorn
// Garrick
// Imoen
// Jaheira
// Khalid
// Kagain
// Kivan
// Minsc
// Montaron
// Neera
// Quayle
// Rasaad
// Safana
// Shar-Teel
// Skie
// Tiax
// Viconia
// Xan
// Xzar
// Yeslick 

I_C_T2 ~CORANJ~ 0 wn_wyvernhunt
== MINSCJ IF ~InParty("MINSC")IsValidForPartyDialogue("MINSC")~ THEN ~Battling these flying creatures was its own reward! Never has Boo faced such fearsome birds. I am sure it is good life experience for him.~
== DYNAHJ IF ~InParty("DYNAHEIR")IsValidForPartyDialogue("DYNAHEIR") InParty("MINSC")IsValidForPartyDialogue("MINSC")~ THEN ~Please remove thy hamster from the wyvern carcass, Minsc. I shan't allow the smell of this rancid cave to follow thee out.~
END

// Turning in the head to Kelddath
I_C_T ~KELDDA~ 6 wn_wyvhead
== CORANJ IF ~InParty("CORAN")IsValidForPartyDialogue("CORAN")~ THEN ~You are a most generous man, Kelddath. The wyvern was a formidable foe, but we felled it and are none worse for wear. I'll be sure this gold goes to... good use.~
== KHALIJ IF ~InParty("KHALID")IsValidForPartyDialogue("KHALID")~ THEN ~I'll be p-pleased to not see another of those b-beasts for some time. Fighting in its l-lair was unpleasant to s-say the least.~
== IMOEN2 IF ~InParty("IMOEN")IsValidForPartyDialogue("IMOEN")~ THEN ~I hope the gold is worth trudging around in that disgusting cave. I hadn't realized that wyverns were so... gruesome.~
== KAGAIJ IF ~InParty("KAGAIN")IsValidForPartyDialogue("KAGAIN")~ THEN ~The gold is appreciated, but I could give or take bein' knee deep in lizard gunk to get it.~
== FALDOJ IF ~InParty("FALDORN")IsValidForPartyDialogue("FALDORN")~ THEN ~It was an unfortunate but necessary culling. Not that I should expect city dwellers to look beyond the material reward.~
== JAHEIJ IF ~InParty("JAHEIRA")IsValidForPartyDialogue("JAHEIRA")~ THEN ~It is the way of things that some creatures must be hunted to preserve the balance. Left unchecked, they could have done much harm.~
== KELDDA ~Be well on your travels, friends.~
END

// Brielbara
I_C_T ~BRIELB~ 0 wn_briel_1
== CORANJ IF ~InParty("CORAN")IsValidForPartyDialogue("CORAN")~ THEN ~I'm sorry, do I...? Briel? Brielbara? Oh, it's good to see you again, my dear. And I... I—~
END

I_C_T2 ~BRIELB~ 11 wn_briel_2
== CORANJ IF ~InParty("CORAN")IsValidForPartyDialogue("CORAN") Global("bd_briel_coran","GLOBAL",1)~ THEN ~Briel, no! Damnit, I can't be a part of this. You're on your own, <CHARNAME>.~
DO ~EscapeArea()~
END

// Yago
I_C_T ~YAGO~ 1 wn_yago_1
== CORANJ IF ~InParty("CORAN")IsValidForPartyDialogue("CORAN")~ THEN ~Bold words from a man not up to the task of pleasing even his own wife.~
== YAGO ~You... You are the one that sullied my Brielbara! Elven bastard! I'll see you cursed to the deepest depth of the hells along with the blasted child!~
== CORANJ ~You're not the first berieved husband to tell me as much, and I sincerely doubt you'll be the last. Be a good man and hand over that spellbook of yours, will you?~
== YAGO ~Die, simpleton!~
END

I_C_T ~YAGO~ 2 wn_yago_2
== CORANJ IF ~InParty("CORAN")IsValidForPartyDialogue("CORAN") Global("bd_briel_coran","GLOBAL",1)~ THEN ~Not assassins, just the folks here to pull your spellbook from your cold, dead hands.~
== YAGO ~You... You are the one that sullied my Brielbara! Elven bastard! I'll see you cursed to the deepest depth of the hells along with the blasted child!~
== CORANJ ~You're not the first berieved husband to tell me as much, and I sincerely doubt you'll be the last. Be a good man and hand over the book, will you?~
== YAGO ~Die, simpleton!~
END

I_C_T ~YAGO~ 3 wn_yago_3
== CORANJ IF ~InParty("CORAN")IsValidForPartyDialogue("CORAN") Global("bd_briel_coran","GLOBAL",1)~ THEN ~Ah well, it was worth a shot. We'll just pull it from your cold, dead hands, then.~
== YAGO ~You... You are the one that sullied my Brielbara! Elven bastard! I'll see you cursed to the deepest depth of the hells along with the blasted child! Stand ready to be eviscerated!~
END

I_C_T2 ~YAGO~ 5 wn_yago_4
== CORANJ IF ~InParty("CORAN")IsValidForPartyDialogue("CORAN") Global("bd_briel_coran","GLOBAL",1)~ THEN ~You're a kinder soul than I, <CHARNAME>. Actually, given that Yago is just going to go and make the life of some other woman a living terror, perhaps you're not. Let's not stand around debating morals and just bring the spellbook back to Brielbara.~
END