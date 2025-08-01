BEGIN WNTEO

CHAIN IF~Global("TempleTalk","GLOBAL",0)~THEN WNTEO Talk.01
~Greetings, traveler. You stand within the everseeing sight of Helm, the Vigilant One. This temple is a safe haven to all those who would seek protection, so long as their hearts are just. Tell me, what can we do for you?~
END
IF~~THEN REPLY ~Who are you?~  EXTERN WNTEO Talk.02
IF ~Global("WNAjantisQuest","GLOBAL",5) InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS")~ THEN REPLY ~My companion, Ajantis, has come to seek out Helm's blessing on our quest.~ EXTERN AJANTJ Quest.01
IF~~THEN REPLY ~Tell me about your religion.~ EXTERN WNTEO Talk.03
IF~~THEN REPLY ~This temple seems to be hidden away. Why is that?~ EXTERN WNTEO Talk.04
IF~~THEN REPLY ~I would like to make use of your temple services.~ EXTERN WNTEO Talk.05
IF~~THEN REPLY ~Do you have any items for sale?~ EXTERN WNTEO Talk.06
IF~~THEN REPLY ~Nothing for now.~ EXTERN WNTEO Talk.07

CHAIN WNTEO Talk.02
~I am Watcher Teomara, loyal servant of Helm and the head of our clergy here in Baldur's Gate, as small as it is. You may simply refer to me as Teomara— I find titles to be rather undemonstrative, and it is important to me that this temple remains a welcoming place in this oft unforgiving city.~
END
IF ~ReputationGT(Player1, 15)~ THEN EXTERN WNTEO HighReputation
IF ~ReputationLT(Player1, 7)~ THEN EXTERN WNTEO LowReputation
IF ~ReputationGT(Player1, 6) ReputationLT(Player1, 16)~ THEN EXTERN WNTEO NeutralReputation

// Dialogue State: HighReputation
CHAIN WNTEO HighReputation
~I needn't ask who you are. Your virtuous deeds have not gone unnoticed nor unappreciated, <CHARNAME>. Helm looks fondly on those who uphold righteousness and protect the people.~ EXTERN WNTEO Talk.08

// Dialogue State: LowReputation
CHAIN WNTEO LowReputation
~I needn't ask who you are. Your reputation in this city precedes you, and it does not speak kindly. Know that Helm sees all, <CHARNAME>, and while I believe that there is room in the hearts of all mortals for redemption, there are many others that do not see things the same way. Walk safely in the streets of Baldur's Gate.~ EXTERN WNTEO Talk.08

// Dialogue State: NeutralReputation
CHAIN WNTEO NeutralReputation
~I needn't ask who you are. Your actions along the Sword Coast have caused quite a stir among those who are willing to pay attention, <CHARNAME>.~ EXTERN WNTEO Talk.08

CHAIN WNTEO Talk.03
~Gladly! Helm is the god of protectors and guardians, and we seek to exemplify these virtues by acting as the shield of any who would wish it. Our faith teaches us the importance of duty and honor, compelling us to defend the innocent and maintain order under Helm's vigilant watch.~
== WNTEO ~Many branches of Helm's church operate in a military capacity, but in Baldur's Gate the Flaming Fist have our blessing. Nonetheless, we are fine warriors when called upon.~EXTERN WNTEO Talk.08

CHAIN WNTEO Talk.04
~The worship of Helm is, regrettably, not prominent in Baldur's Gate. Many folk are disillusioned by the Vigilant One's actions during the Time of Troubles, and our primary goal here is not to operate as a military installation nor a place of congregation, but to provide those in need with our services. For that purpose, our location is entirely adequate.~ EXTERN WNTEO Talk.08

CHAIN WNTEO Talk.05
~You are welcome to utilize our temple services at any time. Our priest can assist you with any healing or blessings you may require.~ EXTERN WNTEO Talk.08

CHAIN WNTEO Talk.08
~How else can I assist you?~
END
IF~~THEN REPLY ~Who are you?~  EXTERN WNTEO Talk.02
IF ~Global("WNAjantisQuest","GLOBAL",5) InParty("AJANTIS")~ THEN REPLY ~My companion, Ajantis, has come to seek out Helm's blessing on our quest.~ EXTERN AJANTJ Quest.01
IF~~THEN REPLY ~Tell me about your religion.~ EXTERN WNTEO Talk.03
IF~~THEN REPLY ~This temple seems rather hidden away. Why is that?~ EXTERN WNTEO Talk.04
IF~~THEN REPLY ~I would like to make use of your temple services.~ EXTERN WNTEO Talk.05
IF~~THEN REPLY ~Do you have any items for sale?~ EXTERN WNTEO Talk.06
IF~~THEN REPLY ~Nothing for now.~ EXTERN WNTEO Talk.07

CHAIN WNTEO Talk.06
~Indeed, we have several protective artifacts that you may find use of!~
DO ~StartStore("wnhelm", LastTalkedToBy)~ EXIT

CHAIN WNTEO Talk.07
~May the Vigilant One protect you on your journeys.~
EXIT

// Ajantis Quest

CHAIN AJANTJ Quest.01
~<CHARNAME> speaks truly, Watcher. My name is Ajantis Ilvastarr, squire paladin of Helm. My companions and I are on a righteous quest, seeking to deliver justice to the villains behind the iron crisis. We seek Helm's blessing on this task.~
== WNTEO ~Well met, Squire Ilvastarr. Your cause is indeed a noble one, and I have no doubt Helm will smile on you. I believe that your coming here on this day was not a coincidence—there is a matter that troubles me deeply... one that only Helm’s faithful might resolve.~
== AJANTJ ~I could do no less than help you. <CHARNAME>?~
END
IF~~THEN REPLY ~Speak on, and we will see what we can do.~ DO ~AddJournalEntry(@102, QUEST_DONE)~ EXTERN WNTEO Quest.02
IF~~THEN REPLY ~I am afraid that we are too busy to take on additional work.~ DO ~AddJournalEntry(@102, QUEST_DONE)~ EXTERN AJANTJ Quest.03

CHAIN WNTEO Quest.02
~I am gladdened to hear this. The matter concerns a member of our clergy—a young paladin named Peitor, who was entrusted to carry an artifact of some import to us. He has not returned to the temple in some time, which is most uncharacteristic of him, and I have it on good authority that he has been spending his eves in a local tavern named the Blushing Mermaid. It is a... worrisome set of circumstances, I am sure you will agree.~
== CORANJ IF ~InParty("CORAN") IsValidForPartyDialogue("CORAN")~ THEN ~Sounds like the chap has decided to let loose a bit. Can't blame him, what with this bunch.~
== SKIEJ IF ~InParty("SKIE") IsValidForPartyDialogue("SKIE")~ THEN ~Not exactly the sort of place I'd expect to find a knight...~
== AJANTJ ~If this Peitor is spurning his prayers and frequenting unsavory places, then I call to question his worthiness in the eyes of the church.~
== WNTEO ~Understandably so, but it is important not to rush to your conclusions. I would bid you seek Peitor out and speak with him—if possible, see him and the relic returned safely to the temple.~
END
IF~~THEN REPLY ~We will do this task for you, Watcher.~ EXTERN WNTEO Quest.04
IF~~THEN REPLY ~I have a few questions before I agree to anything.~ EXTERN WNTEO Quest.05
IF~~THEN REPLY ~I'm afraid we will not have time for this.~ EXTERN WNTEO Quest.06

CHAIN WNTEO Quest.04
~That is most gratifying. I, along with this temple, will be in your debt.~
== WNTEO ~Squire Ajantis, I trust that you will handle this matter as one befitting a knight of your Order. We are in hard times already—we need not make them harder.~
== AJANTJ ~You need not doubt us, Watcher. We can well handle whatever comes our way.~
== WNTEO ~Mm. I wish you luck, and hope that you return with good tidings. Farewell.~
DO ~SetGlobal("WNAjantisQuest","GLOBAL",10) AddJournalEntry(@104, QUEST)~ EXIT

CHAIN WNTEO Quest.05
~I would be glad to answer any questions you may have.~
END
IF~~THEN REPLY ~What exactly is the artifact that Peitor was entrusted with?~ EXTERN WNTEO Quest.07
IF~~THEN REPLY ~Was Peitor acting out of character before he stopped visiting the temple?~ EXTERN WNTEO Quest.08
IF~~THEN REPLY ~Do you suspect someone might be influencing him?~ EXTERN WNTEO Quest.09
IF~~THEN REPLY ~I've made my decision. We will return Peitor to the church.~ EXTERN WNTEO Quest.04
IF~~THEN REPLY ~On second thought, this sounds like it will take more time than we have.~ EXTERN WNTEO Quest.06

CHAIN WNTEO Quest.07
~A shield, once ceremonial and held within this chamber. A few decades past we decided that it was no longer serving Helm's purpose, gathering dust in this hall. It has been entrusted to several men and women of good character throughout the years—myself included. Peitor was handed the shield a month ago.~ EXTERN WNTEO Quest.10

CHAIN WNTEO Quest.08
~Not to my knowledge. Peitor has always been an anxious young man—somewhat flighty. He always found great comfort in his worship of Helm. When I see him, he is usually in prayer or focused on his duties, so it is hard to say for certain.~
== EDWINJ IF ~InParty("EDWIN") IsValidForPartyDialogue("EDWIN")~ THEN ~A cowardly knight. How amusing.~
== WNTEO ~To have Peitor suddenly stop attending the temple... There must be something heavy weighing on his mind, something that he feels he cannot admit in this chamber.~ EXTERN WNTEO Quest.10

CHAIN WNTEO Quest.09
~If there is foul play involved, then it is almost certainly from an outside source. I do not know enough to speculate, however.~ EXTERN WNTEO Quest.10

CHAIN WNTEO Quest.10
~Is there anything else you wish to know?~
END
IF~~THEN REPLY ~What exactly is the artifact that Peitor was entrusted with?~ EXTERN WNTEO Quest.07
IF~~THEN REPLY ~Was Peitor acting out of character before he stopped visiting the temple?~ EXTERN WNTEO Quest.08
IF~~THEN REPLY ~Do you suspect someone might be influencing him?~ EXTERN WNTEO Quest.09
IF~~THEN REPLY ~I've made my decision. We will return Peitor to the church.~ EXTERN WNTEO Quest.04
IF~~THEN REPLY ~On second thought, this sounds like it will take more time than we have.~ EXTERN WNTEO Quest.06

CHAIN AJANTJ Quest.03
~Loathe as I am to admit, Watcher, I am afraid <CHARNAME> is correct. We are merely passing through on our quest.~
== WNTEO ~I see. No matter, as Helm will see all returned as it must. I wish you well on your quest, Ajantis.~
DO ~SetGlobal("WNAjantisQuest","GLOBAL",2)~ EXIT

CHAIN WNTEO Quest.06
~I see. We can only hope that Peitor returns of his own volition, then. I wish you well on your travels, my friends, but I must take my leave for now. There is much to be done.~
DO ~SetGlobal("WNAjantisQuest","GLOBAL",2)~ EXIT

// Quest DONE!

// Variables:
//1. SHIELD RECOVERED: PartyHasItem("wnajsh")
//2. BODY DEFILED: Global("WNAjantisQuest","GLOBAL",20)
//3: BODY RESCUED: Global("WNAjantisQuest","GLOBAL",30)


CHAIN IF WEIGHT #-1~OR(2)
Global("WNAjantisQuest","GLOBAL",20)
Global("WNAjantisQuest","GLOBAL",30)
!Global("WNAjantisQuestDone","GLOBAL",1)
InParty("AJANTIS")
IsValidForPartyDialogue("AJANTIS")~THEN WNTEO AjantisQuestFin.00
~Welcome back, <CHARNAME>. Ajantis. It is good to see you both, just as it is to have Peitor under our roof once more. I understand that we have you to thank for this.~
	== AJANTJ ~It was nothing, Watcher. Just the duty that you assigned my companions and I.~
	END
		IF~~THEN REPLY ~Indeed. I am glad to see Peitor returned safely.~ EXTERN WNTEO AjantisQuestFin.01
		IF~~THEN REPLY ~Sure, sure. What he said.~ EXTERN WNTEO AjantisQuestFin.01
		IF~~THEN REPLY ~Let's just skip to the bit where we get rewarded.~ EXTERN WNTEO AjantisQuestFin.02

CHAIN WNTEO AjantisQuestFin.01
~It is as the teachings of Helm dictate. We are protectors first, and warriors second.~ EXTERN WNTEO AjantisQuestFin.03

CHAIN WNTEO AjantisQuestFin.02
~In due time. First, Peitor must face judgement for his actions.~ EXTERN WNTEO AjantisQuestFin.03

CHAIN WNTEO AjantisQuestFin.03
~Helm's everseeing eye has borne witness to the events unfolding around you, Peitor. The truth is undeniable: you sold a holy relic of this church and gave away sweet Ollera's body once she had passed, not merely in the hopes of seeing her once again, but in order to set right what you saw as a failure of your duty.~
	== WNTEO ~While we do all we can to protect those in need, sometimes the fates must take their dues. Life and death is not ours to meddle with in such ways.~
	== WNPEIT ~Yes, Watcher. I see that now. I... I am sorry.~
	END
	IF ~PartyHasItem("wnajsh") Global("WNAjantisQuest","GLOBAL",20)~ THEN EXTERN WNTEO Ending1	// Has Shield + Ollera Saved
	IF ~!PartyHasItem("wnajsh") Global("WNAjantisQuest","GLOBAL",20)~ THEN EXTERN WNTEO Ending2	// No Shield + Ollera Saved
	IF ~PartyHasItem("wnajsh") Global("WNAjantisQuest","GLOBAL",30)~ THEN EXTERN WNTEO Ending3	// Has Shield + Ollera Defiled
	IF ~!PartyHasItem("wnajsh") Global("WNAjantisQuest","GLOBAL",30)~ THEN EXTERN WNTEO Ending4	// No Shield + Ollera Defiled

CHAIN WNTEO Ending1
~You are forgiven, Peitor, but do not mistake that for absolution. Both your sister's body and the shield lie safe within our grasp, thanks only to your newfound friends.~
	== WNTEO ~There will not always be others to catch you should you slip. As followers of Helm, it is our duty to protect those that lack the means to protect themselves, and you must be fully prepared for that responsibility. The temple welcomes you back, for I see this courage in you still—even if you yet do not.~
	== WNPEIT ~Thank you, Watcher. I will do my best not t' squander this chance.~
	== WNTEO ~As for you, Ajantis, you and your companions pathed the road that brought Peitor back to us, though I suspect the task was not an easy one. The choices made reflect on us all. Tell me, did you hold to Helm’s path, even in the mire?~
	== AJANTJ ~I believe so, Watcher, though perhaps I would have struggled without <CHARNAME>'s judgement to temper me.~
	== WNTEO ~Then you have learned a valuable lesson in trust and restraint both. May it serve you well, Ajantis, for there will be darker days with fewer answers, and it is then that Helm will watch you most closely.~ EXTERN WNTEO BestReward

CHAIN WNTEO Ending2
~You have squandered my faith in you, Peitor. Though your sister's body lies safe, the shield you so foolishly pawned is lost to us. The item itself is of less consequence than your faith, and it has been found wanting.~
	== WNTEO ~That being said, you have returned before Helm's gaze with humility and an understanding of your wrongs. I have no doubt that the company of your own conscience will prove as sufficient punishment before Helm. The temple welcomes you back, though only time will tell if this gift of grace is misplaced.~
	== WNPEIT ~I understand, Watcher. Thank you.~
	== WNTEO ~As for you, Ajantis, you and your companions pathed the road that brought Peitor back to us, though I suspect the task was not an easy one. The choices made reflect on us all. Tell me, did you hold to Helm’s path, even in the mire?~
	== AJANTJ ~I know not, in truth. May Helm vindicate me if it is so—but I carry frustration over our inability to recover the shield.~
	== WNTEO ~Even without it, you ensured Ollera's body returned safely, and in the process put a stop to an evil preying on the defenseless. This is Helm's duty to us, and you fulfilled it admirably.~ EXTERN WNTEO LessGoodReward

CHAIN WNTEO Ending3
~You are forgiven, Peitor, though not lightly—nor are you yet excused. The shield you so foolishly pawned is safe within our grasp, but your actions led to the desecration of your sister's body.~
	== WNTEO ~I have no doubt that the company of your own conscience will prove as sufficient punishment before Helm. The temple welcomes you back, and I hope that you may work your way back to your former standing and beyond with this gift of grace.~
	== WNPEIT ~I understand, Watcher. Thank you.~
	== WNTEO ~As for you, Ajantis, you and your companions pathed the road that brought Peitor back to us, though I suspect the task was not an easy one. The choices made reflect on us all. Tell me, did you hold to Helm’s path, even in the mire?~
	== AJANTJ ~I am uncertain. We have fulfilled the task you gave us, but there was an evil lurking below the shadows—one that I did not see until it was too late.~
	== WNTEO ~Even so, you put an end to it. Not all losses can be prevented, but under Helm's gaze you have gained insight that will arm you well for the future.~ EXTERN WNTEO GoodReward

CHAIN WNTEO Ending4
~You have squandered Helm's duty and my faith in you both, Peitor. Your sister's body carries the evidence of your carelessness, and the shield that you so foolishly pawned is lost to us. You having been tested by Helm, and by life, and you have been found wanting.~
	== WNTEO ~I hope that you may one day return to us a bettered man, Peitor. However, I cannot allow you to remain with this temple.~
	== WNPEIT ~About as much as I was expectin', to be honest. I... I accept this decision. Maybe one day I will return before you, an' let Helm judge me truly. Till then, I... I ought t' bury my sister. Excuse me. (Cutscene -- Peitor Leaves)~ // CUTSCENE -- PEITOR LEAVES
	== WNTEO ~A shame, but perhaps things are as they should be. As for you, Ajantis, you and your companions pathed the road that brought Peitor to judgement, though I suspect the task was not an easy one. The choices made reflect on us all. Tell me, did you hold to Helm’s path, even in the mire?~
	== AJANTJ ~I know not, in truth. We put an end to an evil lurking beneath the shadows, but I did not see it until it was too late for Peitor's sister.~
	== WNTEO ~Indeed. Not all losses can be prevented, as you have learned. You carried this burden with vigilance, and that is no small thing. Helm sees all, Ajantis. If your path was righteous, His gaze will vindicate you—and if not, it will call you to reckon with the truth.~ EXTERN WNTEO LessGoodReward

CHAIN WNTEO BestReward
~But you came to this temple for a blessing, and a blessing you shall receive. The shield is yours, Ajantis, for as long as you wish to carry it. I am certain that it will serve you well. As for you, <CHARNAME>, please accept these gifts on behalf of the church of Helm.~
	END
		IF~~THEN REPLY ~Thank you, Teomara. You are most generous.~ EXTERN WNTEO BestRewardExit
		IF~~THEN REPLY ~Gifts. How lovely.~ EXTERN WNTEO BestRewardExit
		IF~~THEN REPLY ~I'd prefer gold, but I guess that's what I get for doing jobs for a church.~ EXTERN WNTEO BestRewardExit

CHAIN WNTEO BestRewardExit
~May the everseeing eye of Helm watch over you.~
  DO ~SetGlobal("WNAjantisQuestDone","GLOBAL",1)
        AddJournalEntry(@114, QUEST_DONE)
		ReputationInc(2)
		GiveItemCreate("brac22",LastTalkedToBy,1,0,0)
		GiveItemCreate("misc40",LastTalkedToBy,3,0,0)~
    EXIT


CHAIN WNTEO GoodReward
~But you came to this temple for a blessing, and a blessing you shall receive. Ajantis, the shield remains yours, should you wish to carry it. And to you, <CHARNAME>, our thanks. Please accept these gifts as a token of the temple's gratitude.~
	END
		IF~~THEN REPLY ~Thank you, Watcher. We did our best.~ EXTERN WNTEO GoodRewardExit
		IF~~THEN REPLY ~I'd prefer gold, but I'll take what I can get.~ EXTERN WNTEO GoodRewardExit
		IF~~THEN REPLY ~A shame about the girl. But I suppose it could’ve gone worse.~ EXTERN WNTEO GoodRewardExit

CHAIN WNTEO GoodRewardExit
~May the everseeing eye of Helm watch over you.~
  DO ~SetGlobal("WNAjantisQuestDone","GLOBAL",1)
		AddJournalEntry(@114, QUEST_DONE)
		ReputationInc(1)
		GiveItemCreate("brac22",LastTalkedToBy,1,0,0)
		GiveItemCreate("misc40",LastTalkedToBy,1,0,0)~
    EXIT

CHAIN WNTEO LessGoodReward
~This is not the ending any of us would have chosen. Still, you brought Peitor back to us, and faced what others would have turned from. That alone is worthy of respect. Please, accept a gift—what small thanks the temple can offer.~
	END
		IF~~THEN REPLY ~Thank you, Watcher. I appreciate it.~ EXTERN WNTEO LessGoodRewardExit
		IF~~THEN REPLY ~Well, we did what we could.~ EXTERN WNTEO LessGoodRewardExit
		IF~~THEN REPLY ~I'd prefer gold, but I'll take what I can get.~ EXTERN WNTEO LessGoodRewardExit

CHAIN WNTEO LessGoodRewardExit
~May the everseeing eye of Helm watch over you.~
  DO ~SetGlobal("WNAjantisQuestDone","GLOBAL",1)
	  SetGlobal("WNAjantisQuestBadEnding","GLOBAL",1)
        AddJournalEntry(@114, QUEST_DONE)
		GiveItemCreate("brac22",LastTalkedToBy,1,0,0)~
    EXIT

// Player is without AJANTIS

CHAIN IF~OR(2)
Global("WNAjantisQuest","GLOBAL",20)
Global("WNAjantisQuest","GLOBAL",30)
!InParty("AJANTIS")
!IsValidForPartyDialogue("AJANTIS")~THEN WNTEO AjantisQuestNoAjantis
~Why don't you come back here with Squire Ilvastarr, then we can discuss the day's events?~
EXIT
