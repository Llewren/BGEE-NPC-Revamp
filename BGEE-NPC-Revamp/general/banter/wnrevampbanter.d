	///////////////////////////////
	/////////// AJANTIS ///////////
	///////////////////////////////
	
// Voiced lines now available:
// - Your actions fly in the face of everything Helm holds sacred! [AJANT27]
// - There is naught but good and evil. I suspect you are of the latter. [AJANT28]
// - Evil must be purged wherever it is found, even among companions! [AJANT29]
// - The stench of evil clings to you in the most vile manner. [AJANT30]
// - I can bear no more. Raise your weapon and defend yourself! [AJANT31]
// - I may yet still be a squire, but I possess more integrity than you could ever hope for. [AJANT32]
// - You will watch your mouth around the fairer sex. [AJANT33]

// With Xan:
// Xan: It seems our resident suicide monger, Ajantis, lives in a black and white world. [XANNN31]
//~Die, cur!~ [DNR219A]

// Ajantis / Alora
CHAIN IF ~Global("WNAjantisAlora","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("ALORA")
          See("ALORA")
          !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisAlora01
~Do not wander far during battle, Alora. Luck will only take you so far on the battlefield. We face many powerful combatants daily, and it is my duty as protector to ensure your safety.~
DO ~SetGlobal("WNAjantisAlora","GLOBAL",1)~
== BALORA ~Oh, cheer up, Ajantis! I may not be as strong as you, but I can look after myself, and I'm plenty skilled enough to do so without relying on you OR the fates.~
== BAJANT ~I did not mean to insult your honor, my lady. I merely wish to fulfill the role expected of me in this party.~
== BALORA ~Well, we ALL have our roles to fill, and if you're busy babying me then you'll be preventing me from fulfilling mine!~
== BAJANT ~I see... Well, I will think on your words, Alora.~
EXIT
 
// Ajantis / Branwen
 
CHAIN IF ~Global("WNAjantisBranwen","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("BRANWEN")
          See("BRANWEN")
          !StateCheck("BRANWEN",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisBranwen01
~Lady Branwen, I feel I must apologize, for I... I don't exactly know how to speak to you.~
DO ~SetGlobal("WNAjantisBranwen","GLOBAL",1)~
== BBRANW ~Well, that much is clear already.~
== BAJANT ~As I said— I apologize. I have simply never met a woman of such... fierce personality. You are blunt where others may be tactful, and you are... vulgar when, perhaps, it is uncalled for.~
== BBRANW ~Hah! I am a northlander through and through, Ajantis. Even my own people struggle to see past that I am a woman, but I do not hold it against them. Nor do I to you. My actions speak for me, and they may be judged only by Tempus.~
== BAJANT ~I did not mean to offend. You are a warrior well worthy of this group, Branwen.~
== BBRANW ~As are you.~
EXIT 
  
CHAIN IF ~Global("WNAjantisBranwen","GLOBAL",1)
          CombatCounter(0)
          !StateCheck("BRANWEN",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BBRANW WNAjantisBranwen02
~Why do you fight, Ajantis?~
  DO ~SetGlobal("WNAjantisBranwen","GLOBAL",2)~
  == BAJANT ~What kind of question is that? I fight because... because I must— Because I can! There are many in this world who do not possess the means to fight, so I am their sword and their shield both.~
  == BBRANW ~A noble answer. Tempus smiles on those for whom battle is a way of life, and doubly so on those that fight with honor and bravery. To many, battle is just a means to an end, whether that end be selfish or honorable in nature. For people like you and I, however... We are destined for battle. Some days, I feel as though Tempus himself built me from the ground up, made for war.~
  == BAJANT ~I feel the same. Helm has graced me with his power so that I may deliver his will. I only hope that I do so adequately enough for Sir Keldorn and the rest of the Order.~
  == BBRANW ~I wouldn't worry myself too much about that, Ajantis.~
  EXIT 
  
 // Ajantis / Coran
 
CHAIN IF ~Global("WNAjantisCoran","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BCORAN WNAjantisCoran
~Come now, Ajantis. You can't tell me you've never been swayed by the allure of a woman. Surely a knight such as yourself would have ladies all over him!~
  DO ~SetGlobal("WNAjantisCoran","GLOBAL",1)~
  == BAJANT ~I am no knight yet, Coran. While I hope to one day have a wife and family of my own, the Order must come first.~
  == BCORAN ~Wife? Family? My friend, you would do best to put these silly notions out of your head and have some *fun*. There's a whole world of women out there waiting for you— Dallying with a few won't kill you.~
  == BAJANT ~I am no philanderer. You would do well to hold more respect for the fairer sex, rogue.~
  == BSAFAN IF ~InParty("SAFANA")~ ~Perhaps you should try listening to him, Coran. It might be better for your health.~
EXIT

CHAIN IF ~Global("wn_coranquest_end","GLOBAL",2)
		  Global("WNAjantisCoran_Brielbara","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("CORAN")
          See("CORAN")
          !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisCoran_Brielbara.01
~I do not understand how a man can shrug off fatherhood as though it were an ill-fitting cloak.~
  DO ~SetGlobal("WNAjantisCoran_Brielbara","GLOBAL",1)~
  == BCORAN ~I'm sure you'd understand better if you lived it yourself, instead of judging from atop your pedestal of moral superiority.~
  == BAJANT ~You chose comfort over responsibility, and now a girl will grow up without a father. The simplest truth is the only one worth considering.~
  == BCORAN ~I’ve left her in the loving arms of Helm. Isn’t that your lot’s whole purpose?~
  == BAJANT ~You've no right to speak of purpose. I'll waste no more words on one such as you.~
EXIT
 

  // Ajantis / Dorn -- this will only trigger if Dorn is invited into the party before Ajantis. If Ajantis is present during Dorn's recruitment, then he will turn hostile. No need for banter.
  
CHAIN IF ~Global("WNAjantisDorn","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("DORN")
          See("DORN")
          !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisDorn
~Why has <CHARNAME> permitted you to travel amidst this group, half-orc? Every further minute I spend in your company reveals to me further depths of your fiendish nature.~
  DO ~SetGlobal("WNAjantisDorn","GLOBAL",1)~
  == BDORN ~My presence in this group is not a luxury afforded upon me, holy warrior. It is an arrangement of mutual benefit, and for as long as you travel with <CHARNAME>, you benefit from my presence as well—whether you like it or not.~
  == BAJANT ~You are evil, and a plague upon this party. Were it not for <CHARNAME>’s mercy in allowing you to remain, I would have ended your wickedness here and now.~
  == BDORN ~Then let your mercy rot you, paladin. I’ll be here when you’ve grown the spine to follow your own convictions.~
EXIT
  
// Ajantis / Edwin
  
CHAIN IF ~Global("WNAjantisEdwin","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("EDWIN")
          See("EDWIN")
          !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisEdwin.01
~The stench of the Red Wizards surrounds you like a foul wind, Edwin.~
  DO ~SetGlobal("WNAjantisEdwin","GLOBAL",1)~
  == BEDWIN ~Eh? You are addressing me, tin head? (I am surprised that he is capable of forming even basic speech.)~
  == BAJANT ~You cannot hide behind ignorance. Thayan pride coils through your words like a viper through brush.~
  == BEDWIN ~Agh, stop! Must every sentence you utter be some child's meandering simile? ('Tis enough to drive one insane.)~
  == BAJANT ~Just know that I am watching you, wizard.~
EXIT
  
 // Ajantis / Eldoth
 
CHAIN IF ~Global("WNAjantisEldoth","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("ELDOTH")
          See("ELDOTH")
          !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisEldoth
~Eldoth, I would have words with you.~
  DO ~SetGlobal("WNAjantisEldoth","GLOBAL",1)~
  == BELDOT ~Oh? What does our resident holy warrior wish of me?~
  == BAJANT ~Your manner towards me—and the rest of the group—is unnacceptable. You are a dishonorable snake, and I would be a fool to allow you to jeopardize our quest any longer!~
  == BELDOT ~How quaint. Who is it truly that puts our... 'quest', as you put it, at risk— The man who, as any reasonable person would, has his own interests beyond that of the group and isn't afraid to speak his mind, or the man who is willing to slay any ally that does not meet his impossible standards?~
  == BAJANT ~You... you...!~
  == BSKIE IF ~InParty("SKIE")~ ~Please, Ajantis, he's just playing about. You don't need to do anything rash!~
  == BAJANT IF ~InParty("SKIE")~ ~Lady Skie, this man is an affront to all that is good and respectful in this world! He is a cad, and he is no more deserving of your company than a petty criminal is!~
  == BSKIE IF ~InParty("SKIE")~ ~Oh, nobody's perfect. Just... just try and calm down, okay?~
  == BELDOT ~As amusing as this has been, I am trying to work on my latest ballad. Try to keep it down, will you?~
EXIT
  
  
 // Ajantis / Faldorn
 
CHAIN IF ~Global("WNAjantisFaldorn","GLOBAL",0)
          CombatCounter(0)
		  AreaType(FOREST)
          !StateCheck("FALDORN",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BFALDO WNAjantisFaldorn
~Cease your stampeding, buffoon. You are in nature's house, and I'd have half a mind to let her take you were you not assisting <CHARNAME> against the Iron Throne.~
  DO ~SetGlobal("WNAjantisFaldorn","GLOBAL",1)~
  == BAJANT ~You'll not bully me, Shadow Druid. I see your organization for what it is: a congregation of evil zealots, more likely to kill and abuse than help.~
  == BFALDO ~Evil? Don't bore me with your metal-cursed ideas of morality. You are as a child stumbling through the thicket, capable only of destruction. Speak to me no more, lest your voice sully the air.~
EXIT
  
// Ajantis / Garrick

CHAIN IF ~Global("WNAjantisGarrick","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("GARRICK")
          See("GARRICK")
          !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisGarrick
~...And I said to him, "Your reign of villainy ends here!" Then we fought, for two days and two nights, we... Are you listening?~
  DO ~SetGlobal("WNAjantisGarrick","GLOBAL",1)~
  == BGARRI ~Hm? Ah, I'm sorry, Ajantis. I must have drifted off somewhere during your story. You know how the creative mind can be. Or, uh, maybe you don't...~
  == BAJANT ~Not to worry, fair bard! We shall return to the beginning of my tale, so that you may devote it to page as we walk.~
  == BGARRI ~*sigh* Very well.~
EXIT

// Ajantis / Imoen

CHAIN IF ~Global("WNAjantisImoen","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("IMOEN")
          See("IMOEN")
          !StateCheck("IMOEN",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisImoen
~Imoen, your resourcefulness on the battlefield and beyond is most appreciated, but don't you think it may be better to have a more... regimented approach?~
  DO ~SetGlobal("WNAjantisImoen","GLOBAL",1)~
  == BIMOEN ~A what now?~
  == BAJANT ~Structure. Discipline. Between the meals you cook and your strategy on the field, you are rather... sporadic.~
  == BIMOEN ~Y'know, that's what Gorion used to say to me! "Imoen, you're too sporadic for the library. Go and run around outside for an hour." Well, here I am, running around outside all day, every day.~
  == BAJANT ~Right... Well, there's something to be said for a well organized, disciplined approach to both combat and life itself. It instills security and safety in— Imoen? Are you alright?~
  == BIMOEN ~Yeah. *sniff* Yeah, sorry. I'm alright. I just got thinking about Gorion, that's all. I know <CHARNAME>'s probably more broken up about it than I am, but still... It's not easy losing someone.~
  == BAJANT ~I know that all too well. I vow to you, I will do all I can to get justice for your loss. We will hunt down the evil that has caused you this pain and vanquish it!~
  == BIMOEN ~Mm. *sniff* I could vanquish a hot meal right now, to be honest with you. D'ya know the next time we're stopping?~
EXIT

// Ajantis / Jaheira

CHAIN IF ~Global("WNAjantisJaheira","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BJAHEI WNAjantisJaheira1
~So, noble squire, do you find the real world to be as black and white as it seems from within the halls of the Radiant Heart?~
  DO ~SetGlobal("WNAjantisJaheira","GLOBAL",1)~
  == BAJANT ~You will not goad me with your misguided attempt to sway my convictions, Jaheira. There is naught but good and evil in this world, and while one deserves to thrive, the other is destined to perish.~
  == BJAHEI ~Egh... A firmer 'yes' I could not ask for. You are young yet, Ajantis. I do hope that our journey proves a learning experience for you, and that you go forth into knighthood a better man.~
  == BAJANT ~What lessons Helm chooses to bestow upon me, I will accept with courage and grace.~
  == BJAHEI ~I suppose that's a start.~
EXIT

CHAIN IF ~Global("WNAjantisJaheiraQuest","GLOBAL",0)
		  GlobalGT("WNAjantisJaheira","GLOBAL",0)
		  Global("WNAjantisQuestDone","GLOBAL",1)
          CombatCounter(0)
          !StateCheck("JAHEIRA",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BJAHEI WNAjantisJaheiraQuest1
~Do you feel as though you have gained guidance from your god recently, Ajantis?~
  DO ~SetGlobal("WNAjantisJaheiraQuest","GLOBAL",1)~
  == BAJANT ~Helm guides me always, but I sense that I know why you are asking.~
  == BJAHEI ~Your faith is strong, yes, but faith does not always equate wisdom. I simply hope that recent events have given you perspective on that which faith alone cannot solve.~
  == BAJANT ~You speak of blind faith. My convictions remain strong as ever, but I vow to keep my eyes open, just as Helm himself would.~
EXIT

// Ajantis / Kagain 
  
CHAIN IF ~Global("WNAjantisKagain","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("KAGAIN",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BKAGAI WNAjantisKagain
~Say, Ajantis. What do ya plan on doin' if that order of yours doesn't accept ya into their fold after all this?~
  DO ~SetGlobal("WNAjantisKagain","GLOBAL",1)~
  == BAJANT ~I wouldn't even entertain such a possibility. Helm has blessed me with his power because I am worthy. Under his gaze, I will not fail on my quest, and I shall be knighted.~
  == BKAGAI ~Yeah, yeah. But what if—~
  == BAJANT ~You waste insult my dignity and my patience with this line of questioning. We shall speak of it no more.~
EXIT

CHAIN IF ~Global("WNAjantisKagain","GLOBAL",1)
          CombatCounter(0)
          !StateCheck("KAGAIN",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BKAGAI WNAjantisKagain
~Nothing better than gettin' paid after a hard day's work. Eh, Ajantis?~
  DO ~SetGlobal("WNAjantisKagain","GLOBAL",2)~
  == BAJANT ~The only payment I need is the knowledge that I have done good in the world. Beyond that, everything else is fleeting.~
  == BKAGAI ~Sure, but just 'cause somethin's fleeting doesn't make it worthless. Some of the best things in life are fleeting. Don't say to my face that ya don't enjoy a hot meal or a warm bed better than sleepin' on the ground and eatin' grool.~
  == BAJANT ~You make a fine point, Kagain. Luxuries have their place in everyone's life, and I fight so that people can experience such things, rather than suffer in the grip of evil.~
  == BKAGAI ~Erm... Alright, then.~
EXIT
  
CHAIN IF ~Global("WNAjantisKagain","GLOBAL",2)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("KAGAIN")
          See("KAGAIN")
          !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisKagain
~You're looking at me again, Kagain. If there is something you wish to say to me, do so. If not, remain focused on the task at hand.~
  DO ~SetGlobal("WNAjantisKagain","GLOBAL",3)~
  == BKAGAI ~Don't get scruffy with me, boy. I'll make ya regret it. I've just been thinkin', ya see...~
  == BKAGAI ~I run a mercenary company. Protectin' caravans and the like along the trade routes. Makes decent coin if ya do it right, and better coin if ya have a good sword arm. I'd be darned if any of my men are half as good with a blade as you are. Just gets me wonderin' if you'd consider workin' for me.~
  == BAJANT ~As we have discussed, my blade belongs to Helm and the Order of the Radiant Heart. I do not denigrate myself by working merely for gold.~
  == BKAGAI ~Fine, fine. You don't know what you're missin'.~
EXIT
  
// Ajantis / Khalid 
  
CHAIN IF ~Global("WNAjantisKhalid","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("KHALID")
          See("KHALID")
          !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisKhalid
~By whom were you trained, Khalid? Your skill with a blade is on par with many of my fellow paladins in the Order.~
  DO ~SetGlobal("WNAjantisKhalid","GLOBAL",1)~
  == BKHALI ~I t-thank you for the c-compliment, Ajantis. I trained many l-long hours with my city militia in Calimshan, and have had the honor of f-fighting and learning beside many s-skilled swordsmen since then—y-yourself included.~
  == BAJANT ~The honor is mine. I cannot think of a better companion to fight side by side with on this righteous quest!~
  == BKHALI ~Your enthusiasm is m-most welcome, though p-perhaps you could try to keep it d-down a bit.~
EXIT

// Ajantis / Kivan

CHAIN IF ~Global("WNAjantisKivan","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("KIVAN")
          See("KIVAN")
          !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisKivan
~'A man who seeks to balance the scales with anger will find that they tip ever more heavily against him.'~
  DO ~SetGlobal("WNAjantisKivan","GLOBAL",1)~
  == BKIVAN ~What nonsense are you spewing?~
  == BAJANT ~It is something that my mentor, Sir Keldorn, taught me many years ago. Vengeance is a path that leads only to despair, for it is incapable of creating—only destroying.~
  == BKIVAN ~I am already destroyed, without my Deheriana. There is no deeper despair for me to find myself in. Keep your preaching to yourself, paladin.~
EXIT

// Ajantis / Minsc

CHAIN IF ~Global("WNAjantisMinsc","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("MINSC")
          See("MINSC")
          !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisMinsc
~Tell me about the berserker lodges of your homeland, Minsc. I hear that they are great warriors!~
  DO ~SetGlobal("WNAjantisMinsc","GLOBAL",1)~
  == BMINSC ~You wish to hear of the berserker lodges? Are you thinking of joining, Ajantis? I think you would be a great fit, but Boo seems to disagree.~
  == BAJANT ~I already belong to an order, one I hold dearly in my heart. I merely wish to learn more of your culture— I must admit that my tutors in Waterdeep were not experts in all histories of Faerûn.~
  == BMINSC ~Well, in that case, I will tell you of the mightiest lodge of all! The ice dragon berserker lodge, led by Ygvarri the Dark. Do not let his name fool you—he is no evildoer to be defeated, but the greatest of the Rashemaar berserkers! The ice dragon lodge is the largest in all of Thasunta, and one day I shall sit within it. I will return from my dajemma when my witch—and Boo, of course—deem it time.~
  == BMINSC ~As part of the lodge... Boo and I will be one of Rashemen's great defenders! I dream of the day that I see him jump at the eyes of a white dragon. It makes me teary-eyed just thinking about it... Move aside! Weeping ranger coming through!~
  EXIT

// Ajantis / Montaron. Rest in peace Earl Boen. It's an honor and a pleasure to write and hear your words in my head as I do.

CHAIN IF ~Global("WNAjantisMontaron","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("MONTARON",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BMONTA WNAjantisMontaron
~It be bad enough that we travel the roads in broad daylight, but to put up with the blasted tinhead? It be damned near insufferable.~
  DO ~SetGlobal("WNAjantisMontaron","GLOBAL",1)~
  == BAJANT ~Watch your mouth, scum, lest I be inclined to rid the world of another villain.~
  == BMONTA ~Go on, then! Give it yer best shot— I could do with an excuse for some slaughterin'. Not that I be needing one.~
  == BAJANT ~A brigand of your ilk is poorly befitting our righteous quest. Consider this your only warning.~
  EXIT
  
// Ajantis / Neera

CHAIN IF ~Global("WNAjantisNeera","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("NEERA")
          See("NEERA")
          !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisNeera
~My lady Neera, may I enquire as to what you were doing rummaging through my pack earlier?~
  DO ~SetGlobal("WNAjantisNeera","GLOBAL",1)~
  == BNEERA ~Ah, Ajantis! I, uh... You saw that, huh?~
  == BAJANT ~I did indeed. I presumed that you had a good reason for it, for nothing was missing nor out of place.~
  == BNEERA ~Oh, this is... really quite embarrassing.~
  == BAJANT ~Do not be afraid to confide in me, my lady. I can tell that you do not hold me in contempt.~
  == BNEERA ~Okay, well first off— You've GOT to stop calling me that. It's giving me shivers, and not in the good way. As for what I was doing with your pack... I accidentally translocated my favorite pair of socks into it.~
  == BAJANT ~You... what?~
  == BNEERA ~Translocated. My socks. Into your pack. Not intentionally! It just happened, and I SWEAR I looked everywhere else first. I even looked in <CHARNAME>'s pack!~
  == BNEERA ~Anyway, sorry for alarming you, Ajantis. Next time I'll, uh, ask first.~
  EXIT

// Ajantis / Quayle

CHAIN IF ~Global("WNAjantisQuayle","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("QUAYLE",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BQUAYL WNAjantisQuayle
~Hey! HEY!~
  DO ~SetGlobal("WNAjantisQuayle","GLOBAL",1)~
  == BAJANT ~Is it me that you're yelling at, little man?~
  == BQUAYL ~Little? The outrage! I should expect no less from one jealous of my intelligence, but alas, here I am—still apalled!~
  == BAJANT ~*sigh* You interrupted me in a moment of prayer, you insufferable gnome. What was it that you WANTED?~
  == BQUAYL ~I—well, I... um... I've deigned you too stupid to comprehend. Good day to you!~
  EXIT
  
// Ajantis / Rasaad

CHAIN IF ~Global("WNAjantisRasaad","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("RASAAD",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BRASAAD WNAjantisRasaad.01
~How does one decide what shape justice takes, Ajantis?~
  DO ~SetGlobal("WNAjantisRasaad","GLOBAL",1)~
  == BAJANT ~Justice is not shaped by our design, for it is a divine constant. I rely on Helm to guide me true so that I may serve his law.~
  == BRASAAD ~I have seen law used to break men's spirits, and mercy cast out in its name. Just as the light of the moon changes each night, so too must our understanding of right and wrong, lest our eyes begin to whisper lies to our hearts.~
  == BAJANT ~I am steadfast in my duty. Helm's watch is constant, and so must be the will of those who bear his symbol. Doubt may visit the heart, but duty will always battle it away.~
  EXIT


// Ajantis / Safana

CHAIN IF ~Global("WNAjantisSafana","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("SAFANA",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BSAFAN WNAjantisSafana
~Would you care to explain, Ajantis, why it is that every time I've met someone from your 'Order of the Radiant Heart'—or whatever it is that you call yourselves—they turn out to be one of the most unbearably uptight, rude, contemptable people I've ever met?~
  DO ~SetGlobal("WNAjantisSafana","GLOBAL",1)~
  == BAJANT ~I— I was not expecting such vitriol from you, Safana! The Order is a holy organization devoted to doing good in the world, not the den of vipers you make it out to be.~
  == BSAFAN ~Come now, Ajantis. Do you really believe that every member of your order is wholey good and righteous? There are many evils considered decent by our society, and many more harmless activities that are punished. In a world so contradictory, how do you think your purity stays intact? Let me spoil it for you: it doesn't.~
  == BAJANT ~I know not what troubles you have faced from members of the Order, but I assure you that if you were wronged, then their actions do not represent us all—nor do they represent me.~
  == BSAFAN ~Let's leave it at this, shall we? I don't like paladins. So stay away from me. Now let's go... I feel a headache coming on.~
  EXIT
  
// Ajantis / Shar-Teel
// This triggers if Shart is injured. I can't believe they named her shart.

CHAIN IF ~Global("WNAjantisSharTeel","GLOBAL",0)
		  HPLT("SHARTEEL",8)
          CombatCounter(0)
          !StateCheck("SHARTEEL",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BSHART WNAjantisSharTeel
~Get away from me! *huff* Never... NEVER step so close to me again, or I will gut you where you stand.~
  DO ~SetGlobal("WNAjantisSharTeel","GLOBAL",1)~
  == BAJANT ~I merely intended to examine your wounds, Shar-Teel. If you wish to be so contemptuous as to deny my help, then so be it!~
  == BSHART ~I would rather bleed out than allow you to lay your hands upon me, fool.~
  EXIT

// Ajantis / Skie

CHAIN IF ~Global("WNAjantisSkie","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("SKIE")
          See("SKIE")
          !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisSkie
~You possess a noble name, Skie. To fight beside a Silvershield is a rare honor, and one I do not take for granted.~
  DO ~SetGlobal("WNAjantisSkie","GLOBAL",1)~
  == BSKIE ~Ugh, don't remind me. The last thing I want right now is to feel like some pampered noble.~
  == BAJANT ~To the contrary, my lady. The Silvershields are renowned for being respectable and virtuous adventuring folk. It is not hard to see that these qualities have passed themselves on to you.~
  == BSKIE ~I don't know about VIRTUOUS, but thank you, Ajantis. That means a lot to me.~
  == BELDOT IF ~InParty("ELDOTH")~ ~Skie, come away from the knight-errant. Who knows what nonsense he could fill your head with.~
  == BSKIE IF ~InParty("ELDOTH")~ ~He's being NICE to me, Eldoth! It's NOT nonsense.~
  == BELDOT IF ~InParty("ELDOTH")~ ~Whatever you say, dear. Now come back over here so I can tell you of the time I vanquished a ship full of pirates all on my lonesome...~
  EXIT
  
// Ajantis / Tiax

CHAIN IF ~Global("WNAjantisTiax","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("TIAX")
          See("TIAX")
          !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisTiax
~If I did not know any better, then I would say that your insanity has rendered you harmless, gnome. He who knows nothing, however, can be just as dangerous as he who knows all.~
  DO ~SetGlobal("WNAjantisTiax","GLOBAL",1)~
  == BTIAX ~Eh? You... you...~
  == BTIAX ~You venerate Tiax as you should! Of course you do, for one day he will rule all. You will see, and when the time comes... you will follow.~
  == BAJANT ~Despicable. I follow none but Helm.~
  == BTIAX ~Then you fear! Yes, you will fear.~
  EXIT
  
// Ajantis / Viconia

CHAIN IF ~Global("WNAjantisViccy","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("VICONIA")
          See("VICONIA")
          !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisViccy
~Stand away from me, drow. Your foul presence despoils the very air I breathe.~
  DO ~SetGlobal("WNAjantisViccy","GLOBAL",1)~
  == BVICON ~Even in this group, where I have experienced some modicum of acceptance, the blind fools persist.~
  == BAJANT ~You are drow, and you are a Shar worshipper. A more troublesome pair of evils I dare not imagine. Continue your insults, and you will find yourself at the end of my blade.~
EXIT

// Ajantis / Xan

CHAIN IF ~Global("WNAjantisXan","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("XAN",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BXANNN WNAjantisXan.01
~Ajantis, do you ever get tired of utterly dull your worldview is?~
  DO ~SetGlobal("WNAjantisXan","GLOBAL",1)~
  == BAJANT ~You are one to talk, elf. At least I believe that there is good in this world. I truly wonder when the last time you felt joy was.~
  == BXANNN ~And I truly wonder how you've managed to survive thus far, considering the lethal situations I am stuck ever pulling you from.~
EXIT

CHAIN IF ~Global("WNAjantisXan","GLOBAL",1)
          CombatCounter(0)
          !StateCheck("XAN",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BXANNN WNAjantisXan.02
~Have you ever wondered how hollow your convictions sound, Ajantis?~ [XANNN30]
  DO ~SetGlobal("WNAjantisXan","GLOBAL",2)~
  == BAJANT ~Evil must be purged wherever it is found. Do you disagree?~ [WNAJA01]
  == BXANNN ~It is not a question of agreement, but of how quick you are to see evil in every shadow we come across.~
  == BAJANT ~We stand upon the Sword Coast, my Evereskan compatriot. Shadows are rarely cast by anything else.~
EXIT

// Ajantis / Xzar

CHAIN IF ~Global("WNAjantisXzar","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("XZAR",CD_STATE_NOTVALID)
          InParty("AJANTIS")
          See("AJANTIS")
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN BXZAR WNAjantisXzar
~Gah! Look at me not, paladin. Your very gaze sears my flesh.~
  DO ~SetGlobal("WNAjantisXzar","GLOBAL",1)~
  == BAJANT ~I keep watch over you to ensure the safety of my compatriots, necromancer! Helm condemn me if I allow you to lay your hands upon even one innocent.~
  == BXZAR ~What would I wish with the innocent? They're disgustingly unpalatable.~
EXIT

// Ajantis / Yeslick

CHAIN IF ~Global("WNAjantisYeslick","GLOBAL",0)
          CombatCounter(0)
		  AreaType(FOREST)
          !StateCheck("AJANTIS",CD_STATE_NOTVALID)
          InParty("YESLICK")
          See("YESLICK")
          !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN BAJANT WNAjantisYeslick
~A nobler battle-priest I've not had the pleasure of fighting beside, Yeslick. It does my heart good that we are on this quest together!~
  DO ~SetGlobal("WNAjantisYeslick","GLOBAL",1)~
  == BYESLI ~I thank ye, comrade. I've spent too long cooped up in the mines—it's about time I got out there and did some good in the world.~
  == BAJANT ~Indeed! There is nothing greater than fresh air absent of evil. Come now, my friend. Let us move onwards!~
EXIT


	/////////////////////////////
	/////////// CORAN ///////////
	/////////////////////////////

// Coran / Dynaheir

CHAIN IF ~Global("WNCoranDynaheir","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("DYNAHEIR")
          See("DYNAHEIR")
          !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranDynaheir1
~How blessed I am to find myself traveling alongside such a beautiful and powerful wychlaran. You, my dear Dynaheir, are a diamond in the rough.~
DO ~SetGlobal("WNCoranDynaheir","GLOBAL",1)~ 
== BDYNAH ~Yes, I am well aware. Thou need not remind me.~
== BCORAN ~Of course, a woman like yourself would would not muddy her mind with insecurities or doubts. Though I know for a fact that everyone needs a... distraction once in a while.~
== BDYNAH ~If thy knowledge of me is so comprehensive, then what do thou think I would say to such a brazen advance?~
== BCORAN ~A fair point adroitly made. I shall admire from afar.~
EXIT


// Coran / Edwin

CHAIN IF ~Global("WNCoranEdwin","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("EDWIN",CD_STATE_NOTVALID)
          InParty("CORAN")
          See("CORAN")
          !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN BEDWIN WNCoranEdwin1
~Egh, would you apply those foul bottled odors of yours when I am NOT in your immediate vicinity? (They smell ridiculous, anyhow.)~
DO ~SetGlobal("WNCoranEdwin","GLOBAL",1)~ 
== BCORAN ~I fear your nose simply may be too sensitive, Edwin. The ladies certainly don't take issue with it—besides, as part of the same adventuring troupe, when are we not in each other’s company?~
== BEDWIN ~No part of me is *too* anything, you imbecile, save for the very simple requirements that I have of your company—requirements that seem *too* complex for you to understand.~
== BCORAN ~Sensitive fellow, aren’t you? I’ll see what I can do to soothe your poor nose.~
EXIT

// Coran / Eldoth

CHAIN IF ~Global("WNCoranEldoth","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("ELDOTH")
          See("ELDOTH") 
          !StateCheck("ELDOTH",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranEldoth1
~Say, Eldoth, would I have heard of any of your ballads? I do fancy myself as a patron of the arts.~
DO ~SetGlobal("WNCoranEldoth","GLOBAL",1)~ 
== BELDOT ~Unless you have spent any time in Waterdeep as of late, I would expect not. I wouldn’t demean myself by performing in Baldur’s Gate.~
== BCORAN ~A shame. The Gate has plenty to offer... but the finest of them all is, unequivocally, the women.~
== BELDOT ~Yes, I’m rather inclined to agree.~
EXIT

// Coran / Faldorn

CHAIN IF ~Global("WNCoranFaldorn","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("FALDORN",CD_STATE_NOTVALID)
          InParty("CORAN")
          See("CORAN")
          !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN BFALDO WNCoranFaldorn1
~Where do you hail from, Coran? You walk with a surprising delicacy considering your city-dweller disposition.~
DO ~SetGlobal("WNCoranFaldorn","GLOBAL",1)~ 
== BCORAN ~City-dweller disposition? You wound me, Faldorn. I once called the Forest of Tethyr home, but I have since travelled far and wide. For as much time as I spend in Baldur’s Gate, I always find myself forced to leave. Perhaps the forest just calls to me.~
== BFALDO ~Cities are like snakes attempting to consume their own tails. They will inevitably spit out or excrete anything that doesn’t serve their purpose.~
== BCORAN ~What a... lovely metaphor.~
EXIT

// Coran / Garrick

CHAIN IF ~Global("WNCoranGarrick","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("GARRICK")
          See("GARRICK")
          !StateCheck("GARRICK",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranGarrick1
~What’s your specialty, Garrick? I do love the arts, but every half-decent theatre around has ostensibly banned me for life for dallying with the actresses backstage.~
DO ~SetGlobal("WNCoranGarrick","GLOBAL",1)~ 
== BGARRI ~I have found the greatest success in my modest career when I am performing accompanying pieces to plays and epic poems. Now, though, I prefer to simply play around a campfire.~
== BCORAN ~Both are worthy pursuits, my friend. It is a joy that I can experience your playing on the road. Trust me when I say that it would be far more dull without it.~
== BGARRI ~Thank you for your kind words, Coran!~
EXIT

// Coran / Imoen

CHAIN IF ~Global("WNCoranImoen","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("IMOEN")
          See("IMOEN")
          !StateCheck("IMOEN",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranImoen1
~How was life in Candlekeep, Imoen? I used to gaze at it on occasion from the edge of the forests nearby, thinking about all the work that must have gone into constructing such a grand place. I think it dreadfully boring myself, but it would please me to know that you had a good life there.~
DO ~SetGlobal("WNCoranImoen","GLOBAL",1)~ 
== BIMOEN ~How surprisingly sentimental of you, Coran. I don’t have to tell you that living in a library can be dull, but for the most part it was pretty good. <CHARNAME> and I always found little ways to have fun. Sometimes big ways—but those usually ended up with a scolding to match!~
== BCORAN ~I suppose that means that all those men and women that labored to build such a grand fortress did so for a worthwhile purpose, for without them, I would not have been graced by your lovely presence.~
== BIMOEN ~Ah, there’s the Coran I expected.~
EXIT

// Coran / Jaheira (if in Baldur's Gate)

CHAIN IF ~Global("WNCoranJaheira","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("JAHEIRA")
          See("JAHEIRA")
		  OR(10)
			AreaCheck("AR0100") // North-West BG
			AreaCheck("AR0200") // North BG
			AreaCheck("AR0300") // North-East BG
			AreaCheck("AR0600") // West BG
			AreaCheck("AR0700") // Central BG
			AreaCheck("AR0800") // East BG
			AreaCheck("AR0900") // Wyrm's Crossing
			AreaCheck("AR1100") // South-West BG
			AreaCheck("AR1200") // South BG
			AreaCheck("AR1300") // South-East BG
          !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranJaheira1
~Ah, ‘tis a fine <DAYNIGHT> indeed. The city gleams with potential, ripe for the picking. <CHARNAME>, what would you say to throwing Jaheira into the Chionthar?~
DO ~SetGlobal("WNCoranJaheira","GLOBAL",1)~ 
== BJAHEI ~You will have to pick me up first, rogue. Not an easy task when I can turn into a bear, no?~
== BCORAN ~During the night, then. Your transformations are not reflexive, are they?~
== BJAHEI ~Do you wish to find out?~
== BCORAN ~A fine point. Very well, our ornery druid remains on land for the foreseeable future.~
EXIT

// Coran / Khalid

CHAIN IF ~Global("WNCoranKhalid","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("KHALID")
          See("KHALID")
          !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranKhalid1
~How did a fellow like you snag a fiery woman like Jaheira, pray tell?~
DO ~SetGlobal("WNCoranKhalid","GLOBAL",1)~ 
== BKHALI ~It is not a tale I am t-terribly fond of recounting, I’m a-afraid. I think you’ll find Jaheira to feel m-much the same. We b-b-both prefer to focus on the present, and that’s what m-matters.~
== BCORAN ~I like to live in the moment too. Though my past seems to have a way of worming its way back to me. Perhaps I ought to leave the Sword Coast...~
== BKHALI ~There is a great d-difference between running from the past and m-making peace with it, though I get the feeling that such a sentiment will f-fall on deaf ears.~
EXIT

// Coran / Kagain

CHAIN IF ~Global("WNCoranKagain","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("KAGAIN")
          See("KAGAIN")
          !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranKagain1
~So, Kagain…~
DO ~SetGlobal("WNCoranKagain","GLOBAL",1)~ 
== BKAGAI ~Get outta my face, elf. I got things to do and none of ‘em involve you.~
== BCORAN ~About what I expected.~
EXIT

// Coran / Kivan

CHAIN IF ~Global("WNCoranKivan","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("KAGAIN")
          See("KAGAIN")
          !StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranKivan1
~This Deheriana of yours must have been some woman to have you so wrapped up in yourself about her passing.~
DO ~SetGlobal("WNCoranKivan","GLOBAL",1)~ 
== BKIVAN ~Do not dare to invoke her name so flippantly. The least she deserves from a man like you is silence.~
== BCORAN ~*sigh* As you wish it. Gods forbid I strike up a conversation.~
EXIT

// Coran / Minsc

CHAIN IF ~Global("WNCoranMinsc","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("MINSC",CD_STATE_NOTVALID)
          InParty("CORAN")
          See("CORAN")
          !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN BMINSC WNCoranMinsc1
~Your skill with a bow is impressive, Coran. Boo believes you could pinpoint a singular whisker with an arrow if you tried. I try not to encourage such speculative thoughts, but he has such a creative mind.~
DO ~SetGlobal("WNCoranMinsc","GLOBAL",1)~ 
== BCORAN ~I don’t know about a single whisker, my large friend, but I could certainly pin a rabbit the moment it leaves its den, or a hawk as it flies through the sky.~
== BMINSC ~These sound like impressive feats. Eh… How long has it been since we had a rabbit stew? A Rashemaar needs to eat!~
EXIT

// Coran / Montaron

CHAIN IF ~Global("WNCoranMontaron","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("MONTARON")
          See("MONTARON")
          !StateCheck("MONTARON",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranMontaron1
~Whom do you call your employer, Montaron? I could swear that I recall seeing you in passing before, perhaps near Iriaebor. Am I mistaken?~
DO ~SetGlobal("WNCoranMontaron","GLOBAL",1)~ 
== BMONTA ~It be none of yer business who I work for, elf, and ye would be sorely mistaken if ye think I’ve been walkin’ the roads in recent history. Go ahead and ask more questions. I'll not need another excuse to gut ye.~
== BCORAN ~Touchy, aren't you? Very well, I shall find something more productive to do with my time.~
EXIT


// Coran / Neera

CHAIN IF ~Global("WNCoranNeera","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("NEERA")
          See("NEERA")
          !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranNeera1
~Why Neera, you look positively radiant today. Have you applied anything to your skin? You—~
DO ~SetGlobal("WNCoranNeera","GLOBAL",1)~ 
== BNEERA ~Oh hells, am I glowing again? I can't see my face. Does anyone have a mirror?~
== BCORAN ~Ah—no. You are indeed glowing, but not in the magical sense. I merely wished to express my admiration of your... vibrancy.~
== BNEERA ~Oh... OH. Nope, I'm not buying it. Sorry!~
EXIT

// Coran / Quayle

CHAIN IF ~Global("WNCoranQuayle","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("QUAYLE")
          See("QUAYLE")
          !StateCheck("QUAYLE",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranQuayle1
~Do try to stand away from me, Quayle. The thought that I could be perceived to be your companion by any passer-by is most disturbing to me.~
DO ~SetGlobal("WNCoranQuayle","GLOBAL",1)~ 
== BQUAYL ~Pfeh. No one with a brain is going to be perceiving you at all!~
== BCORAN ~But Quayle, you're looking right at me.~
== BQUAYL ~I'm looking *through* you. There's a big difference.~
EXIT

// Coran / Rasaad

CHAIN IF ~Global("WNCoranRasaad","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("RASAAD")
          See("RASAAD")
          !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranRasaad1
~You’re an enigma to me, my friend. How is one able to look at a feast and choose fasting instead?~
DO ~SetGlobal("WNCoranQuayle","GLOBAL",1)~ 
== BRASAAD ~I have had much time in my life for indulgence, when it felt like there was nothing greater to be gained than momentary relief, but such times are as distant to me now as the new moon on a cloudy night.~
== BCORAN ~What is life if not an endless stream of moments? It seems to me that filling each of them with joy is a worthwhile endeavor.~
== BRASAAD ~An interesting perspective. erhaps there is wisdom in it, even if I do not yet see it. Thank you, Coran.~
== BCORAN ~That may be the first time a monk has ever spoken those words to me. It may be the first time I've spoken to a monk regardless, but who's to say?~
EXIT
 
// Coran / Safana

CHAIN IF ~Global("WNCoranSafana","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("SAFANA",CD_STATE_NOTVALID)
          InParty("CORAN")
          See("CORAN")
          !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN BSAFAN WNCoranSafana1
~There are few men in the world that make me feel so many emotions as you do, Coran. Unfortunately for you, they're all negative emotions.~
DO ~SetGlobal("WNCoranSafana","GLOBAL",1)~ 
== BCORAN ~You wound me, Safana. If I have you right, that means you like me.~
== BSAFAN ~Keep dreaming, elf.~
EXIT

// Coran / Shar-Teel

CHAIN IF ~Global("WNCoranSharTeel","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("SHARTEEL",CD_STATE_NOTVALID)
          InParty("CORAN")
          See("CORAN")
          !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN BSHART WNCoranSharTeel1
~You would do well to quit your drooling every time you turn your gaze upon me, elf. You wouldn't want to lose anything... important.~
DO ~SetGlobal("WNCoranSharTeel","GLOBAL",1)~ 
== BCORAN ~Don't think too highly of yourself, Shar-Teel—you hardly make the top five most dangerous women I’ve fancied.~
== BSHART ~You're disgusting. I pity every woman who didn't see fit to spurn your advances.~
== BCORAN ~A sword through my chest from you would be as a rose from any other woman.~
== BSHART ~Don't tempt me.~
EXIT

// Coran / Skie

CHAIN IF ~Global("WNCoranSkie","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("SKIE")
          See("SKIE")
          !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranSkie1
~Skie, my dear, how is it that I've never seen that pretty face of yours till now? I'm not an infrequent visitor of Baldur's Gate, and I'm certainly well connected.~
DO ~SetGlobal("WNCoranSkie","GLOBAL",1)~ 
== BSKIE ~Maybe you're just not looking in the right places. I sneak out a LOT. My parents don't know just how many parties I go to. Even if you have seen me, you probably wouldn't know—I'm REALLY good at disguises.~
== BCORAN ~Ah, how debonaire of you. You do seem to have a way with your appearance. It's hard not to notice.~
== BSKIE ~Thanks, Coran! Mm... I do miss having all my products and makeup. *sigh* I want a bath.~
EXIT

// Coran / Tiax

CHAIN IF ~Global("WNCoranTiax","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("TIAX")
          See("TIAX")
          !StateCheck("TIAX",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranTiax1
~*sigh* I must have angered Beshaba herself to have ended up traveling with this little maniac...~
DO ~SetGlobal("WNCoranTiax","GLOBAL",1)~ 
== BTIAX ~Eh? Is that a whisper that falls upon my ears? Surely you do not besmirch the almighty Tiax's name. Such a thing will have great consequences!~
== BCORAN ~I ought not to feed into this, but— Oh no, mighty Tiax! I would never dare let an untrue word of your character pass my lips. Whatever you heard was surely the wind.~
== BTIAX ~The wind, yes... Bah! Such things will not exist when Tiax rules.~
== BCORAN ~The... wind? How do you intend to rid our world of the wind, oh great Tiax?~
== BTIAX ~Don't ask stupid questions! Now, leave me! I need to have this basilisk head shaved by dawn!~
EXIT

// Coran / Viconia

CHAIN IF ~Global("WNCoranViccy","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("VICONIA")
          See("VICONIA")
          !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranViccy1
~Why Viconia... I am enamored by your beauty this <DAYNIGHTALL>. It fills me with a great appreciation to see your face unobscured by hood nor helm. Would that it could remain so.~
DO ~SetGlobal("WNCoranViccy","GLOBAL",1)~ 
== BVICON ~Do not get used to it, Coran. The sunlight of this place is unbearable at times— I do not expect to ever truly become accustomed to it.~
== BCORAN ~If you ever do, I can only hope that I am nearby so that I may gaze upon you fully.~
== BVICON ~You are not the first slavering darthiir to verbally debase themselves before me, but you are certainly the least appealing. Now get away from me.~
== BCORAN ~If it must be so, I shall admire your beauty from afar.~
EXIT

// Coran / Xan

CHAIN IF ~Global("WNCoranXan","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("XAN",CD_STATE_NOTVALID)
          InParty("CORAN")
          See("CORAN")
          !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN BXANNN WNCoranXan1
~Coran, could I ask you to be a little more cautious on the battlefield? Risky maneuvers like the ones you attempt are bound to hasten our demise.~
DO ~SetGlobal("WNCoranXan","GLOBAL",1)~ 
== BCORAN ~What is life without a little risk, my gloomy friend? I am confident in my skill— You ought to be, as well.~
== BXANNN ~The only thing I am confident about is the unavoidable fact that we are, as unfortunate as such a truth is, in incredible danger almost every day of our lives. The party does not need you endangering it further.~
== BCORAN ~I am... speechless before your endless defeatism. If it makes you happy, though, I will *try* not to shoot any of our allies.~
== BXANNN ~If the bare minimum was enough to make me happy, I'd... well, I'd still feel the same way, to be perfectly honest with you.~
EXIT

// Coran / Xzar

CHAIN IF ~Global("WNCoranXzar","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("CORAN",CD_STATE_NOTVALID)
          InParty("XZAR")
          See("XZAR")
          !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN BCORAN WNCoranXzar1
~You’re an unsettling man, Xzar, but unsettling men often have fascinating stories. Care to share one?~
DO ~SetGlobal("WNCoranXzar","GLOBAL",1)~ 
== BXZAR ~Stories are dangerous things. They have a tendency to stick to the listener, like… flesh on bone. Are you sure you want one of mine clinging to you?~
== BCORAN ~When you put it like that, perhaps not. Can't blame a man for testing the waters.~
EXIT

// Coran / Yeslick

CHAIN IF ~Global("WNCoranYeslick","GLOBAL",0)
          CombatCounter(0)
          !StateCheck("YESLICK",CD_STATE_NOTVALID)
          InParty("CORAN")
          See("CORAN")
          !StateCheck("CORAN",CD_STATE_NOTVALID)~ THEN BYESLI WNCoranYeslick1
~Aye, Coran— Ye be a bounty hunter, no? What with ye after those wyverns of yours.~
DO ~SetGlobal("WNCoranYeslick","GLOBAL",1)~ 
== BCORAN ~An occasional collector of bounties, yes—but a bounty hunter? Not quite.~
== BYESLI ~I nae much see the difference, and I nae like bounty hunters— As long as ye don't run up after an innocent man for a pittance of gold in ye pocket, perhaps you and I won't have any problems.~
== BCORAN ~There are no truly innocent men in this world, Yeslick. I'm sure you know that better than most.~
== BYESLI ~*huff* There's that elven charm of yours. Already I'm getting tired of ye.~
EXIT


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