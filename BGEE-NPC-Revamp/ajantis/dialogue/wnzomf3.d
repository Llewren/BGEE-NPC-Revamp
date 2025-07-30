BEGIN WNZOMF3
BEGIN WNZOMF4

CHAIN IF~GlobalGT("WNAjantisQuest","GLOBAL",14) Global("WNZombiesEncountered","GLOBAL",0)~THEN WNZOMF3 00
~Shouldn't... be... down... here.~
	== WNZOMF4 ~Flaming... Fist... business.~
	== MINSCJ IF ~InParty("MINSC") IsValidForPartyDialogue("MINSC") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~Eh? These men are not right in their heads, <CHARNAME>. Trust me, Boo can tell these things.~
	== AJANTJ IF ~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~I can sense the rot coming off these men just standing here. Have your weapons ready.~
	== JAHEIJ IF ~InParty("JAHEIRA") IsValidForPartyDialogue("JAHEIRA") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~Something deeply unnatural happened to these two, <CHARNAME>. Returning them to mother nature would be a kindness.~
	== FALDOJ IF ~InParty("FALDORN") IsValidForPartyDialogue("FALDORN") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~Disgusting. These city wretches have fallen prey to one who twists a blade in the natural order of things.~
	== EDWINJ IF ~InParty("EDWIN") IsValidForPartyDialogue("EDWIN") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~Impressive magic is at play here. We should find the rogue caster that did this. (And take from him his secrets. Yes...)~
	== XZARJ IF ~InParty("XZAR") IsValidForPartyDialogue("XZAR") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~Necromancy is at work here. Such fine specimens they are, too. Let us remove their limbs and find their creator, quickly.~
	== WNZOMF3 ~Turn... BACK...~
	DO ~
	SetGlobal("WNZombiesEncountered","GLOBAL",1)
	ActionOverride("wnzomf1",Enemy())
	ActionOverride("wnzomf2",Enemy())~ 
	EXIT
	