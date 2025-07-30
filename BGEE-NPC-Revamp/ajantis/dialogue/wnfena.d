BEGIN WNFENA
BEGIN WNOLLE

// FenaFirst

CHAIN IF~GlobalGT("WNAjantisQuest","GLOBAL",14) Global("WNBoaFirst","GLOBAL",0) NumTimesTalkedTo(0)~THEN WNFENA First.00
~Patience, my friend, patience. Just a short while more. Perfection is within reach, if only—eh? What is this? Who are you?~
~Who dares—! No, not now, not when I’m this close! Do you have any idea how delicate this is? I will NOT have intruders! My work is simply too important for distractions.~
== WNFENA ~WELL? What have you to say for yourself? You no doubt had to slay or sneak past my guards to get here—neither is of any consequence, as you shall not be leaving this place alive.~
	END
		IF~~THEN REPLY ~What in the hells are you doing down here?~ DO ~SetGlobal("WNFenaFirst","GLOBAL",1)~ EXTERN WNFENA First.01
		IF~~THEN REPLY ~Are you the one who took Peitor's sister?~ DO ~SetGlobal("WNFenaFirst","GLOBAL",1)~ EXTERN WNFENA First.02
		IF~~THEN REPLY ~You should have locked the sewer grate if you didn't want visitors.~ DO ~SetGlobal("WNFenaFirst","GLOBAL",1)~ EXTERN WNFENA First.03
		IF~~THEN REPLY ~Foul necromancer! You die here today.~ DO ~SetGlobal("WNFenaFirst","GLOBAL",1)~ EXTERN WNFENA First.04
		
CHAIN WNFENA First.01 ~I am crafting beauteous creations beyond your meager understanding! It is no surprise that you do not recognize true art when you see it... though you have arrived before my true magnum opus could be completed.~ EXTERN WNFENA First.04

CHAIN WNFENA First.02 ~Took? TOOK? No, he GAVE her to me, of his own free will. He supplied the body for my greatest piece yet—and now there are snivelling intruders holding up my work.~ EXTERN WNFENA First.04

CHAIN WNFENA First.03 ~Most people know better than to go poking where they don't belong. It's a proven way to go missing in this city, don't you know? Just like my little friends here did.~ EXTERN WNFENA First.04
 
CHAIN WNFENA First.04 ~Do you have any idea what it takes to create such fine monstrosities from the rabble that inhabit these filthy streets? I will be considered a master craftsman when the masses see what marvelous things I have made from the insipid and the meek.~
	== YESLIJ IF ~InParty("YESLICK") IsValidForPartyDialogue("YESLICK")~ THEN ~Ye be sick in the head if ye call that craftsmanship. Better for all that we destroy these ghouls.~
	== AJANTJ IF ~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS")~ THEN ~You sicken me. Such evil will not go unpunished under the eye of Helm, despoiler.~
	== NEERAJ IF ~InParty("NEERA") IsValidForPartyDialogue("NEERA")~ THEN ~Gross. Gross!~
	== MINSCJ IF ~InParty("MINSC") IsValidForPartyDialogue("MINSC")~ THEN ~It is a good thing that I wear my butt-kicking boots every day, otherwise Boo would do the kicking, and I would have wet feet!~
	== DYNAHJ IF ~InParty("DYNAHEIR") IsValidForPartyDialogue("DYNAHEIR")~ THEN ~Thou hast yoked art to horror, and stained the Weave itself with thy ambition, villain.~
	== WNFENA ~No matter. I will finish my work here once I have destroyed you!~
	DO ~
    Shout(1)
    ActionOverride("wnfena",Enemy())~
	EXIT
	
// BoaFirst

CHAIN IF~GlobalGT("WNAjantisQuest","GLOBAL",14) GlobalGT("WNBoaFirst","GLOBAL",1) NumTimesTalkedTo(0)~THEN WNFENA 00
~No, no, no—lift your head, keep the jaw slack. Not like that! Must I do everything myself? Excellent… now speak.~
	== WNOLLE ~Guuugh...~
	== WNFENA ~WORDS, you impudent creature. What use do I have for you if you can't—oh?~
	== WNFENA ~Well, it would seem we have guests. Chin UP, Ollera! You've taken a wrong turn, <PRO_GIRLBOY>. I presume you either bypassed or slaughtered my guards—neither is of any consequence, as you shall not be leaving this festering pit alive.~
		END
			IF~~THEN REPLY ~These undead beings are your creation?~ EXTERN WNFENA 01
			IF~~THEN REPLY ~Did you call that horrible creature Ollera? As in, Peitor's sister?~ EXTERN WNFENA 02
			IF~~THEN REPLY ~Does it stink in here, or is it just you? I'm joking, of course. It's obviously you.~ EXTERN WNFENA 03
			IF~~THEN REPLY ~I've met enough people like you to know how this goes. Let's just skip straight to the killing, you deranged little man.~ EXIT

CHAIN WNFENA 01
~Indeed! Aren't they wonderful? The amount of gold I had to spend to get such fine specimens... well, it's no matter.~ EXTERN WNFENA 05

CHAIN WNFENA 02
~She WAS his sister, but now she's part of a new family. And she should be SETTING A GOOD EXAMPLE in front of the others.~ EXTERN WNFENA 05

CHAIN WNFENA 03
~Curb your impudence, lest you make my sweethearts even duller for the hearing of it.~ EXTERN WNFENA 05

CHAIN WNFENA 05
~Ollera here is my greatest work yet. It's a good thing I took those sewing lessons when I was a young man, I'll tell you that much. Is the craftsmanship not magnificent?~
	== YESLIJ IF ~InParty("YESLICK") IsValidForPartyDialogue("YESLICK")~ ~Ye be sick in the head if ye call that craftsmanship. Better for all that we destroy these ghouls.~
	== NEERAJ IF ~InParty("NEERA") IsValidForPartyDialogue("NEERA")~ ~Gross. Gross!~
	== AJANTJ IF ~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS")~ ~You sicken me. Such evil will not go unpunished under the eye of Helm, despoiler.~
	== MINSCJ IF ~InParty("MINSC") IsValidForPartyDialogue("MINSC")~ ~It is a good thing that I wear my butt-kicking boots every day, otherwise Boo would do the kicking, and I would have wet feet!~
	== DYNAHJ IF ~InParty("DYNAHEIR") IsValidForPartyDialogue("DYNAHEIR")~ ~Thou hast yoked art to horror, and stained the Weave itself with thy ambition, villain.~
	== WNOLLE ~Hgh. Guuugh.~
	== WNFENA ~Well said, my dear. Some people just have no appreciation for the arts. Let's get to it, shall we?~
	DO ~
    Shout(1)
    ActionOverride("wnfena",Enemy())
    ActionOverride("wnolle",Enemy())~
EXIT
	
	
// — EM DASH FOR USAGE
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






CHAIN WNFENA 04
~If you are so eager to join our family, be my guest!~
EXIT
