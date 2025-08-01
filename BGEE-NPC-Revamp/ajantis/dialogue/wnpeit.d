BEGIN WNPEIT

CHAIN IF~GlobalLT("WNAjantisQuest","GLOBAL",10)~THEN WNPEIT UnQuested.00
~Good evenin' to you. Here to gamble? Or just to drink? Either way, if you've troubles to drown, this is the place to do it.~
	END
		IF~~THEN REPLY ~I'm here to win some coin.~ EXTERN WNPEIT UnQuested.01
		IF~~THEN REPLY ~Drinking takes my fancy this eve.~ EXTERN WNPEIT UnQuested.02
		IF~~THEN REPLY ~I was going to look for some alternative entertainment, actually.~ EXTERN WNPEIT UnQuested.03
		IF~~THEN REPLY ~Neither for me. I'm just exploring the area.~ EXTERN WNPEIT UnQuested.04
		IF~~THEN REPLY ~I don't want to talk to you. Goodbye.~ EXTERN WNPEIT UnQuested.05

CHAIN WNPEIT UnQuested.01
~Hah. Well, good luck with that. The bastards here sure know how to string you dry.~ EXIT

CHAIN WNPEIT UnQuested.02
~Aye, you've picked the spot for it. I've been samplin' the bitter black here for a tenday. Cheap, effective, an' not bad on the tongue. You enjoy.~ EXIT

CHAIN WNPEIT UnQuested.03
~Well, whatever suits your fancy. I'm long past the point of bein' able to judge folk for their decisions.~ EXIT

CHAIN WNPEIT UnQuested.04
~Explorin', is it? Well I'd avoid the Undercellar. Gets more an' more lawless as you go down.~ EXIT

CHAIN WNPEIT UnQuested.05
~Helm watch over you.~ EXIT


CHAIN IF WEIGHT #-1 ~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS") Global("WNAjantisQuest","GLOBAL",10)~THEN WNPEIT PeitorQuest.00
~Evenin' to you—oh. Oh no.~
== AJANTJ ~You! You are Peitor, are you not?~
== WNPEIT ~Aye. That I am.~
	END
		IF~~THEN REPLY ~We're here to—~ EXTERN AJANTJ PeitorQuest.01
		IF~~THEN REPLY ~Watcher Teomara sent—~ EXTERN AJANTJ PeitorQuest.01
		IF~~THEN REPLY ~You have—~ EXTERN AJANTJ PeitorQuest.01

CHAIN AJANTJ PeitorQuest.01
~Ugh. By Helm, man! You're practically drowning in ale! 'Tis completely shameful! You cast a poor shadow on your temple. What excuse to do you have for your behavior?~
== WNPEIT ~I—I'm sorry. I just... I couldn't go back. Not after everythin'.~
== AJANTJ ~What do you mean? Explain yourself.~
	END
		IF~~THEN REPLY ~Give the man some space, Ajantis. He's clearly shaken.~ EXTERN AJANTJ PeitorQuest.02
		IF~~THEN REPLY ~You'd better answer his questions, Peitor.~ EXTERN WNPEIT PeitorQuest.03
		IF~~THEN REPLY ~I'll do the talking, Ajantis. Remember who the leader of this party is.~ EXTERN AJANTJ PeitorQuest.02
		IF~~THEN REPLY ~Let me guess. He got lost on the way back and decided the bottom of a tankard was close enough?~ EXTERN AJANTJ PeitorQuest.04

CHAIN AJANTJ PeitorQuest.02
~Fine. I'll not complain about taking a step back.~ EXTERN WNPEIT PeitorQuest.03

CHAIN AJANTJ PeitorQuest.04
~This is no laughing matter, <CHARNAME>. This man is shirking his duty to Helm, and to the people of this city.~
== ELDOTJ IF ~InParty("ELDOTH") IsValidForPartyDialogue("ELDOTH")~ THEN ~On the contrary—what else is there to do but laugh at this so-called symbol strength brought low?~
== WNPEIT ~No, <PRO_HESHE>'s right. You're right. I'm a mess.~ EXTERN WNPEIT PeitorQuest.03

CHAIN WNPEIT PeitorQuest.03
~I s'pose I can tell you. Not like it'll change anything. *sigh* Watcher Teomara entrusted me with a holy item. A shield, one she used to carry back when she was younger. Special to Helm an' all that.~
== WNPEIT ~I... I sold it.~
== AJANTJ ~You sold a holy relic?! You...!~
== JAHEIJ IF ~InParty("JAHEIRA") IsValidForPartyDialogue("JAHEIRA")~ THEN ~Foolish, but not unexpected. It is common for one so young bend under the weight of duty.~
== SAFANJ IF ~InParty("SAFANA") IsValidForPartyDialogue("SAFANA")~ THEN ~Wish I could say I was surprised. Helmite stuff can fetch a pretty hefty sum... and no man is immune to the allure of gold.~
== BRANWJ IF ~InParty("BRANWEN") IsValidForPartyDialogue("BRANWEN")~ THEN ~To trade away a holy artefact? That is a foul deed—I dare not imagine ever stooping to such treachery in the eyes of Tempus.~
== KAGAIJ IF ~InParty("KAGAIN") IsValidForPartyDialogue("KAGAIN")~ THEN ~You did the smart thing, boy. You're better off with the gold than some religious junk.~
== WNPEIT ~It wasn't just for the coin! I swear, I didn't want to. But there was no other way... my sister was sick—somethin' real bad. She passed, alone an' in pain.~
== CORANJ IF ~InParty("CORAN") IsValidForPartyDialogue("CORAN")~ THEN ~So you sold the shield to get the gold you needed to drown your troubles. Classic.~
== AJANTJ ~That is a tragedy, but what does this have to do with the shield, Peitor? Help me to understand.~
== WNPEIT ~I needed gold. To bring her back, but without the sickness. The healers said the damage was permanent—lethal, even if she was raised. There's always a way, though. At... at least, that's what I thought.~
	END
		IF~~THEN REPLY ~What did you do, Peitor?~ EXTERN WNPEIT PeitorQuest.04
		IF~~THEN REPLY ~I'm sorry for your loss. But some things must be left to rest.~ EXTERN WNPEIT PeitorQuest.05
		IF ~Class(Player1,CLERIC_ALL)~ THEN REPLY ~Such a thing would require powerful magic. Magic that I doubt many in Baldur's Gate, if indeed any at all, possess.~ EXTERN WNPEIT PeitorQuest.06
		IF~~THEN REPLY ~Get to the point, you sniveling wreck.~ EXTERN WNPEIT PeitorQuest.07

CHAIN WNPEIT PeitorQuest.05
~I know. I'm a fool, an' I get that now.~ EXTERN WNPEIT PeitorQuest.04

CHAIN WNPEIT PeitorQuest.06
~You clearly know better than I did.~ EXTERN WNPEIT PeitorQuest.04

CHAIN WNPEIT PeitorQuest.07
~R-right. Sorry.~ EXTERN WNPEIT PeitorQuest.04

CHAIN WNPEIT PeitorQuest.04
~I was approached by a man. Had a hood hidin' his face. He told me he could bring Ollera back, an' make her healthy again—for a price. The shield was all I had, an' I was weak.~
== WNPEIT ~I met with a trader, down in the Undercellar. He was very eager to buy. I couldn't see any other way.~
== WNPEIT ~Once I had the gold, I met with the man again an' handed it over along with Ollera's body. He... he took her away. That was days ago, an' I've not seen him or... or her since.~
	END
		IF~~THEN REPLY ~Peitor, you may be among the most incompetant, idiotic people I have ever met on the whole of the Sword Coast—and that's an accomplishment, because I meet a LOT of people.~ EXTERN WNPEIT PeitorQuest.08
		IF~~THEN REPLY ~You sold a holy relic for the privelege of giving away your sister's corpse?~ EXTERN WNPEIT PeitorQuest.09
		IF~~THEN REPLY ~Is there a chance that the offer was genuine?~ EXTERN WNPEIT PeitorQuest.10
		IF~~THEN REPLY ~I can't make any promises, but we can try to fix this.~ EXTERN WNPEIT PeitorQuest.11

CHAIN WNPEIT PeitorQuest.08
~You can't say anythin' I haven't told myself.~ EXTERN AJANTJ PeitorQuest.12

CHAIN WNPEIT PeitorQuest.09
~W-well, when you put it like that...~ EXTERN AJANTJ PeitorQuest.12

CHAIN WNPEIT PeitorQuest.10
~I've given up hope. I'm a damned fool.~ EXTERN AJANTJ PeitorQuest.12

CHAIN WNPEIT PeitorQuest.11
~Nothin' can fix this as long as Ollera's gone.~ EXTERN AJANTJ PeitorQuest.12

CHAIN AJANTJ PeitorQuest.12
~I can see your pain, Peitor, and I question not its magnitude, but we must reclaim the relic that you, in your desperation, cast away. Tell us everything so that we may right your foolish wrong.~
== WNPEIT ~What d'you want t' know?~
	END
		IF~~THEN REPLY ~Who was the trader that you sold the shield to?~ EXTERN WNPEIT PeitorQuest.13
		IF~~THEN REPLY ~Tell me about the man who took your sister's body.~ EXTERN WNPEIT PeitorQuest.14
		IF~~THEN REPLY ~On second thought, this isn't worth my time.~ EXTERN WNPEIT PeitorQuest.16

CHAIN WNPEIT PeitorQuest.13
~He's a dwarf named Boa. I don't know much about him, but he operates out of the Undercellar—that's, uh, the basement of this tavern. I showed him the shield an' he bought it off me on the spot. Barely gave me a moment to think about it.~ EXTERN WNPEIT PeitorQuest.17

CHAIN WNPEIT PeitorQuest.14
~I was approached after I left Ollera's house. He said he was some kind of special healer, and that he could bring her back healthy an' happy. I... I was a fool.~
== WNPEIT ~He told me to meet him east of the Blade and Stars, some tavern in the lower city. I took Ollera to him there, and he disappeared with her. I just... watched as he faded into the shadows, carrying her body. I've been here since then.~ EXTERN WNPEIT PeitorQuest.17

CHAIN WNPEIT PeitorQuest.15
~They won't let me back into the Undercellar. I guess Boa has some pull an' got the guards to stop me if I tried to come back. As for the man... nay. Like I said—I've given up. He told me he'd meet me where I gave him Ollera's body, but I've been back there twice now and both times there are Flamin' Fist that send me away.~ EXTERN WNPEIT PeitorQuest.17

CHAIN WNPEIT PeitorQuest.17
~What else d'you need?~
	END
		IF~~THEN REPLY ~I've heard enough. We'll help you, Peitor.~ EXTERN AJANTJ PeitorQuest.18
		IF~~THEN REPLY ~Who was the trader that you sold the shield to?~ EXTERN WNPEIT PeitorQuest.13
		IF~~THEN REPLY ~Tell me about the man who took your sister's body.~ EXTERN WNPEIT PeitorQuest.14
		IF~~THEN REPLY ~Have you gone looking for either the man or the shield?~ EXTERN WNPEIT PeitorQuest.15
		IF~~THEN REPLY ~On second thought, this isn't worth my time.~ EXTERN WNPEIT PeitorQuest.16

CHAIN AJANTJ PeitorQuest.18
~Whatever scoundrel took advantage of Peitor’s grief can be dealt with later. Perhaps it was a mere sick joke in order to get some coin. The shield is a relic of Helm, and must be reclaimed now before it is lost to us forever.~
== WNPEIT ~But if... if Ollera's body really is in the hands of some... some lunatic, then you have to go after him! What if it's already too late?~
== JAHEIJ IF ~InParty("JAHEIRA") IsValidForPartyDialogue("JAHEIRA")~ THEN ~If there is someone buying bodies from the grieving, then it is likely for some unnatural purpose and it warrants our attention.~
== KHALIJ IF ~InParty("KHALID") IsValidForPartyDialogue("KHALID")~ THEN ~H-how disturbing. We ought t-t-to look into this body collector, <CHARNAME>.~
== KAGAIJ IF ~InParty("KAGAIN") IsValidForPartyDialogue("KAGAIN")~ THEN ~Let's go find this black market dealer and stick an axe in him!~
== MINSCJ IF ~InParty("MINSC") IsValidForPartyDialogue("MINSC")~ THEN ~Even the dead must be protected from evil-doers! But... this shield could be dangerous in a villain's hands. Boo says he trusts your judgment.~
== XZARJ IF ~InParty("XZAR") IsValidForPartyDialogue("XZAR")~ THEN ~Buying bodies in the street is an... intriguing hobby. Very intriguing indeed.~
== AJANTJ ~The shield is a holy relic—its recovery is a duty I cannot ignore. Whatever villain holds it must be dealt with swiftly. This man who took your sister’s body... if he is truly mad, then his schemes can be unraveled after we secure the relic.~
== WNPEIT ~The man said he’d meet me by the sewer entrance a ways east of the Blade and Stars. But... the Flamin' Fist men just kept pushin’ me away whenever I got close. Maybe you could get through to them, get them to help. Or else, you could talk to Boa about the shield, but I don't know how much luck you'll have.~
== WNPEIT ~Either way, you're doin' me a favor. I'm sittin' with the two biggest mistakes of my life right now and my only comfort's been the bottom of a tankard. An' I'll keep sittin' here till you come back.~
DO ~SetGlobal("WNAjantisQuest","GLOBAL",15) AddJournalEntry(@105, QUEST)~ EXIT

CHAIN WNPEIT PeitorQuest.16
~So be it. I've already given up hope, anyway. I'll find some other place t' drink my days away, if you'll excuse me.~
DO ~SetGlobal("WNAjantisQuest","GLOBAL",2) AddJournalEntry(@115, QUEST_DONE)~ EXIT

// Returning

CHAIN IF WEIGHT #-1 ~GlobalGT("WNAjantisQuest","GLOBAL",10)GlobalLT("WNAjantisQuest","GLOBAL",21) !Global("WNPeitRet","GLOBAL",1)~ THEN WNPEIT PeitorReturn.00
~You're back. Do you have any news?~
	END
		IF~~THEN REPLY ~Not yet. I'll let you know when I do.~ EXTERN WNPEIT PeitorReturn.01
		IF~PartyHasItem("wnajsh")~THEN REPLY ~I've recovered the shield.~ EXTERN WNPEIT PeitorReturn.02
		IF~PartyHasItem("wnbody1")~THEN REPLY ~I found your sister's body. It doesn't seem to have been tampered with.~ EXTERN WNPEIT PeitorReturn.03
		IF~PartyHasItem("wnbody2")~THEN REPLY ~I found your sister... I think.~ EXTERN WNPEIT PeitorReturn.04
		IF~~THEN REPLY ~I don't have time to talk right now.~ EXIT

CHAIN WNPEIT PeitorReturn.01
~Please, if you can find anything about Ollera's body, I would be forever in your debt. The only lead I can give you is that I met the man on a street next to the Blade and Stars.~ EXIT

CHAIN WNPEIT PeitorReturn.02
~That's... you did? That's... I don't know how you managed that, but I'm grateful. It doesn't much clean my conscience, but it's certainly a weight off my shoulders. Have... have you found anything on my sister?~
	END
		IF~~THEN REPLY ~I haven't found anything yet.~ EXTERN WNPEIT PeitorReturn.01
		IF~PartyHasItem("wnbody1")~THEN REPLY ~I found your sister's body, Peitor. You can rest easy.~ EXTERN WNPEIT PeitorReturn.03
		IF~PartyHasItem("wnbody2")~THEN REPLY ~I'm sorry, Peitor. Your sister's body... it was tampered with.~ EXTERN WNPEIT PeitorReturn.04
		IF~PartyHasItem("wnbody2")~THEN REPLY ~I found her. Or at least, what's left of her.~ EXTERN WNPEIT PeitorReturn.04
		IF~~THEN REPLY ~I don't have time to talk right now.~ EXIT

// Body safe
CHAIN WNPEIT PeitorReturn.03
~Gods, that's her. She looks like she's sleepin'. What a fool I've been. What a damned fool...~
== JAHEIJ IF ~InParty("JAHEIRA") IsValidForPartyDialogue("JAHEIRA")~ THEN ~On that much we can agree.~
== WNPEIT ~I... I got no excuse now. Ollera wouldn't want me to hide from my duty. My church.~ EXTERN WNPEIT BestPathMenu

CHAIN WNPEIT BestPathMenu
~I ought t' go back and face Watcher Teomara. Helm will be seein' all anyway—even the drink doesn't help me to be forgettin' that. But... I don't know how I'll face her if I don't have the shield.~
	END
		IF~PartyHasItem("wnajsh")~THEN REPLY ~I have the shield. I'll meet you there with it. Go.~ DO ~SetGlobal("WNAjantisQuest","GLOBAL",20)~ EXTERN WNPEIT PeitorReturn.05
		IF~GlobalGT("WNAuctionDone","GLOBAL",0)!PartyHasItem("wnajsh")~THEN REPLY ~I couldn't get the shield, Peitor. There's nothing more to do but go back.~ DO ~SetGlobal("WNAjantisQuest","GLOBAL",20)~ EXTERN WNPEIT PeitorReturn.05
		IF~!PartyHasItem("wnajsh")~THEN REPLY ~Forget the shield. Go and take your punishment.~ DO ~SetGlobal("WNAjantisQuest","GLOBAL",20)~ EXTERN WNPEIT PeitorReturn.05
		IF~!PartyHasItem("wnajsh")~THEN REPLY ~Very well, Peitor. I will do my best to retrieve the holy shield.~ EXTERN WNPEIT PeitorReturn.11
		IF~PartyHasItem("wnajsh")~THEN REPLY ~I'll return to you shortly, there are some things I must take care of.~ EXTERN WNPEIT PeitorReturn.12

CHAIN WNPEIT PeitorReturn.05
~Very well. You've done more for me than I could rightly say. I'll see you back at the temple... whatever my fate may be.~
DO ~AddJournalEntry(@113, QUEST) TakePartyItem("wnbody1") SetGlobal("WNPeitorLeft","GLOBAL",1) EscapeArea()~
	EXIT

// Body defiled
CHAIN WNPEIT PeitorReturn.04
~Eh?! Nay, that's not my sister. That's not Ollera. I... wait—~
== WNPEIT ~It IS her. By Helm, this is all my fault. What happened?~
	END
		IF~~THEN REPLY ~The man you gave the body to was a necromancer. It seems he performed some kind of ritual on her.~ EXTERN WNPEIT PeitorReturn.06
		IF~~THEN REPLY ~She became some kind of zombie, and I had to strike her down. It was a tough battle.~ EXTERN WNPEIT PeitorReturn.07
		IF~~THEN REPLY ~It's best if you don't know.~ EXTERN WNPEIT PeitorReturn.08

CHAIN WNPEIT PeitorReturn.06
~I hope you made sure he's dead an' gone, then. Good for nothin' bastard.~ EXTERN WNPEIT PeitorReturn.09

CHAIN WNPEIT PeitorReturn.07
~Zombie? May Helm forgive me for the wrongness that I have caused...~ EXTERN WNPEIT PeitorReturn.09

CHAIN WNPEIT PeitorReturn.08
~I... if you say so.~ EXTERN WNPEIT PeitorReturn.09

CHAIN WNPEIT PeitorReturn.09
~I... I got no excuse now. Ollera wouldn't want me to hide from my duty. My church. I ought t' go back and face Watcher Teomara. Helm will be seein' all anyway—even the drink doesn't help me to be forgettin' that. But... I don't know how I'll face her if I don't have the shield.~
	END
		IF~PartyHasItem("wnajsh")~THEN REPLY ~I have the shield. I'll meet you there with it. Go.~ DO ~SetGlobal("WNAjantisQuest","GLOBAL",30)~ EXTERN WNPEIT PeitorReturn.10
		IF~GlobalGT("WNAuctionDone","GLOBAL",0)!PartyHasItem("wnajsh")~THEN REPLY ~I couldn't get the shield, Peitor. There's nothing more to do but go back.~ DO ~SetGlobal("WNAjantisQuest","GLOBAL",30)~ EXTERN WNPEIT PeitorReturn.10
		IF~!PartyHasItem("wnajsh")~THEN REPLY ~Forget the shield. Go and take your punishment.~ DO ~SetGlobal("WNAjantisQuest","GLOBAL",30)~ EXTERN WNPEIT PeitorReturn.10
		IF~!PartyHasItem("wnajsh")~THEN REPLY ~Very well, Peitor. I will do my best to retrieve the holy shield.~ EXTERN WNPEIT PeitorReturn.11
		IF~PartyHasItem("wnajsh")~THEN REPLY ~I'll return to you shortly, there are some things I must take care of.~ EXTERN WNPEIT PeitorReturn.12

CHAIN WNPEIT PeitorReturn.10
~Very well. I will face my wrongdoings as one befitting my order... regardless of whether or not I am allowed to remain a part of it.~
DO ~AddJournalEntry(@113, QUEST) TakePartyItem("wnbody2") SetGlobal("WNPeitorLeft","GLOBAL",1) EscapeArea()~
	EXIT

CHAIN WNPEIT PeitorReturn.11
~I sold it to Boa in the Undercellar. I don't know if he still has it, but that's all I can offer you.~
DO ~SetGlobal("WNPeitRet","GLOBAL",1)~ EXIT

CHAIN WNPEIT PeitorReturn.12
~As you wish. I'll be here, just don't be takin' too long, alright?~
DO ~SetGlobal("WNPeitRet","GLOBAL",1)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("WNPeitRet","GLOBAL",1)~ THEN WNPEIT Return.13
			~You're back. I've just been... sittin' here, thinking.~ DO ~SetGlobal("WNPeitRet","GLOBAL",0)~
			END
			IF ~PartyHasItem("wnbody1")~ THEN EXTERN WNPEIT BestPathMenu
			IF ~PartyHasItem("wnbody2")~ THEN EXTERN WNPEIT PeitorReturn.09


// In the temple

CHAIN IF WEIGHT #-1 ~OR(2)
		Global("WNAjantisQuest","GLOBAL",20)
		Global("WNAjantisQuest","GLOBAL",30)
		!Global("WNAjantisQuestDone","GLOBAL",1)
		AreaCheck("ar0002")~ THEN WNPEIT Temple.00
~I'm awaitin' judgement, just as we all are. Teomara's been wantin' t' talk with you.~
EXIT

CHAIN IF WEIGHT #-1 ~Global("WNAjantisQuestDone","GLOBAL",1)~ THEN WNPEIT Final.00
~Thanks for helpin' me out. If you ever need help, just come callin', and I'll be there to return the favor.~
EXIT
