BEGIN WNZOMF5

CHAIN IF~GlobalGT("WNAjantisQuest","GLOBAL",14) Global("WNZombiesEncountered","GLOBAL",0)~THEN WNZOMF5 00
~Turn... back...~
	== MINSCJ IF ~InParty("MINSC") IsValidForPartyDialogue("MINSC") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~Eh? This man is not right in his head, <CHARNAME>. Trust me, Boo can tell these things.~
	== AJANTJ IF ~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~I can sense the rot coming off this man just standing here. Have your weapons ready.~
	== JAHEIJ IF ~InParty("JAHEIRA") IsValidForPartyDialogue("JAHEIRA") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~Something deeply unnatural happened to this man, <CHARNAME>. Returning him to mother nature would be a kindness.~
	== FALDOJ IF ~InParty("FALDORN") IsValidForPartyDialogue("FALDORN") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~Disgusting. This city wretch has fallen prey to one who twists a blade in the natural order of things.~
	== EDWINJ IF ~InParty("EDWIN") IsValidForPartyDialogue("EDWIN") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~Impressive magic is at play here. We should find the rogue caster that did this. (And take from him his secrets. Yes...)~
	== XZARJ IF ~InParty("XZAR") IsValidForPartyDialogue("XZAR") Global("WNZombiesEncountered","GLOBAL",0)~ THEN ~Necromancy is at work here. Such a fine specimen it is, too. Let us remove its limbs and find the creator, quickly.~
	== WNZOMF3 ~Turn... BACK...~
	DO ~
	SetGlobal("WNZombiesEncountered","GLOBAL",1)
	ActionOverride("wnzomf5",Enemy())~ 
	EXIT