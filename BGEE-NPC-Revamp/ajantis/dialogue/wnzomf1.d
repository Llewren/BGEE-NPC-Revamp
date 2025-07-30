BEGIN WNZOMF1
BEGIN WNZOMF2

CHAIN IF~GlobalGT("WNAjantisQuest","GLOBAL",14) NumTimesTalkedTo(0)~THEN WNZOMF1 00
~Turn... back... Flaming... Fist... business...~
	== WNZOMF2 ~Turn... back. Turn... back.~
	== MINSCJ IF ~InParty("MINSC") IsValidForPartyDialogue("MINSC")~ THEN ~Eh? These men are not right in their heads, <CHARNAME>. Trust me, Boo can tell these things.~
	== AJANTJ IF ~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS")~ THEN ~I can sense the rot coming off these men just standing here. Have your weapons ready.~
	== JAHEIJ IF ~InParty("JAHEIRA") IsValidForPartyDialogue("JAHEIRA")~ THEN ~Something deeply unnatural happened to these two, <CHARNAME>. Returning them to mother nature would be a kindness.~
	== FALDOJ IF ~InParty("FALDORN") IsValidForPartyDialogue("FALDORN")~ THEN ~Disgusting. These city wretches have fallen prey to one who twists a blade in the natural order of things.~
	== EDWINJ IF ~InParty("EDWIN") IsValidForPartyDialogue("EDWIN")~ THEN ~Impressive magic is at play here. We should find the rogue caster that did this. (And take from him his secrets. Yes...)~
	== XZARJ IF ~InParty("XZAR") IsValidForPartyDialogue("XZAR")~ THEN ~Necromancy is at work here. Such fine specimens they are, too. Let us remove their limbs and find their creator, quickly.~
	== WNZOMF1 ~Fist... business...~
		END
			IF~~THEN REPLY ~I'm looking for a mage, supposedly a diviner. Seemed really interested in dead bodies.~ EXTERN WNZOMF1 01
			IF~Class(player1,MAGE)~THEN REPLY ~I recognize this magic. Necromancy, it must be—these men are undead.~ EXTERN WNZOMF1 02
			IF~~THEN REPLY ~That's great, but I really need to get into the sewer here.~ EXTERN WNZOMF2 03
			IF~~THEN REPLY ~Very well, if you insist.~ EXTERN WNZOMF2 03
			
CHAIN WNZOMF1 01
~No... mage. Fist... business.~ EXTERN WNZOMF2 03

CHAIN WNZOMF1 02
~No... magic.~ EXTERN WNZOMF2 03

CHAIN WNZOMF2 03
~No... one... enters.~
	== TIAXJ IF ~InParty("TIAX") IsValidForPartyDialogue("TIAX")~ THEN ~Listen to me, zombies! It is I, Tiax! You will step aside or be crushed by the RULER OF ALL!~
	== WNZOMF1 ~I... am... the... law.~
	DO ~
	ActionOverride("wnzomf1",Enemy())
	ActionOverride("wnzomf2",Enemy())~ 
	EXIT