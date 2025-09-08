///////////////////////////////////
///Conversations with the player///
///////////////////////////////////

// Quest Dialogue

// Quest 1: Ajantis wishes to visit the Temple of Helm

CHAIN IF ~Global("WNAjantisQuest","GLOBAL",1) !Global("WNAjantisQuestRefused","GLOBAL",1)~ THEN AJANTJ Temple.01
~Hold a moment, <CHARNAME>. If my recollections are correct, then there is a temple dedicated to Helm not far from here. It would do our quest well to pay respects to the Vigilant One in his church... and I would consider it a personal favor if we went there soon.~
END
IF~~THEN REPLY ~Of course, Ajantis. We will go there as soon as we are able.~ EXTERN AJANTJ Temple.02
IF~~THEN REPLY ~I suppose the blessing of Helm couldn't hurt.~ EXTERN AJANTJ Temple.03
IF~~THEN REPLY ~I have no interest in visiting a temple of your god.~ EXTERN AJANTJ Temple.04

CHAIN AJANTJ Temple.02
~It heartens me to see that you recognize the value of Helm's strength. In these times, his vigilance is more important than ever. The temple lies north of the Ducal Palace, just a short walk from here. It will be good to stand within its hallowed walls once more.~ EXTERN AJANTJ Temple.05

CHAIN AJANTJ Temple.03
~You would do well to speak of Helm with greater respect. The Vigilant One watches over us all, whether you offer your prayers to him or not. The temple is north of the Ducal Palace, not far from here. Perhaps standing in his house of worship will grant you a better appreciation of his strength.~ EXTERN AJANTJ Temple.05

CHAIN AJANTJ Temple.04
~I shall ignore your tone and urge you to reconsider. Helm’s guidance offers strength and clarity, blessings we should not lightly dismiss in times such as these. I trust that you will make the wiser decision.~
DO ~SetGlobal("WNAjantisQuest","GLOBAL",5) AddJournalEntry(@101, QUEST)~ EXIT

CHAIN AJANTJ Temple.05
~It has been so many years since I last visited the temple. I was but a child then... I suspect it may not be quite so grand as my memories paint it to be, but it will strengthen our resolve nonetheless. Come, let us go!~ 
DO ~SetGlobal("WNAjantisQuest","GLOBAL",5) AddJournalEntry(@101, QUEST)~ EXIT

// Quest 2: Peitor is not here

CHAIN IF~Global("WNAjantisTimeTalk","GLOBAL",1)~ THEN AJANTJ PeitorSpawn.00
~This is the right place, <CHARNAME>, but I see no sign of Peitor. Perhaps we ought to return later in the day.~
DO ~SetGlobal("WNAjantisTimeTalk","GLOBAL",2)~ EXIT

// Quest 3: After quest is over

CHAIN IF~Global("WNAjantisQuestDoneTalk","GLOBAL",1) !Global("WNAjantisQuestBadEnding","GLOBAL",1)~ THEN AJANTJ AjantisAfterQuest.00
~The task is done, and I am left to reflect on the day's events. Do you know what weighs on my mind the heaviest?~
	END
		IF~~THEN REPLY ~Something to with Peitor?~ EXTERN AJANTJ AjantisAfterQuest.01
		IF~PartyHasItem("wnajsh")~THEN REPLY ~The shield, perhaps?~ EXTERN AJANTJ AjantisAfterQuest.02
		IF~~THEN REPLY ~The necromancer and what he wrought?~ EXTERN AJANTJ AjantisAfterQuest.03
		IF~~THEN REPLY ~Watcher Teomara's judgement?~ EXTERN AJANTJ AjantisAfterQuest.04
		IF~~THEN REPLY ~I'm assuming it's probably related to Helm.~ EXTERN AJANTJ AjantisAfterQuest.05
		IF~~THEN REPLY ~I don't. Please, tell me.~ EXTERN AJANTJ AjantisAfterQuest.06

CHAIN AJANTJ AjantisAfterQuest.01
~Perhaps, in a sense. He made a foolish mistake driven by his desperation, and when his mistakes left him stranded, he hid. Even so, I find that I cannot help but find a sense of sympathy for him. Helm's duty is ever demanding, and the worry that one might buckle under the weight of it is not one that my mind is free of. But no, Peitor is not what I was referring to exactly.~ EXTERN AJANTJ AjantisAfterQuest.06

CHAIN AJANTJ AjantisAfterQuest.02
~No, or at least, less than I thought it would be. It is an honor to carry it, but previously I thought it to be the most important thing. Now, I am not so sure.~ EXTERN AJANTJ AjantisAfterQuest.06

CHAIN AJANTJ AjantisAfterQuest.03
~No. The man was clearly as mad and evil as one can become. The Sword Coast is filled to excess with such villains, and it is our duty to set them to rights.~ EXTERN AJANTJ AjantisAfterQuest.06

CHAIN AJANTJ AjantisAfterQuest.04
~Indeed. You see the right of it, perhaps clearer than I see it myself.~ EXTERN AJANTJ AjantisAfterQuest.06

CHAIN AJANTJ AjantisAfterQuest.05
~Helm is ever on my mind, for his duty is not one that one can bear lightly.~ EXTERN AJANTJ AjantisAfterQuest.06

CHAIN AJANTJ AjantisAfterQuest.06
~Watcher Teomara—she could have sent anyone else to see to this matter, or even approached it herself. In truth, I am wondering if Helm guided her to wait for our arrival, so that I would see something that I was meant to see.~
== AJANTJ ~But... I do not know if I see it.~
	END
		IF~~THEN REPLY ~I think you do, Ajantis. The conflict you feel is evidence enough of that.~ EXTERN AJANTJ AjantisAfterQuest.07
		IF~~THEN REPLY ~Well, think on it.~ EXTERN AJANTJ AjantisAfterQuest.08
		IF~~THEN REPLY ~I truly, don't really care.~ EXTERN AJANTJ AjantisAfterQuest.09

CHAIN AJANTJ AjantisAfterQuest.07
~Perhaps you are right. You counsel continues to be a source of strength for me.~ EXTERN AJANTJ AjantisAfterQuest.10

CHAIN AJANTJ AjantisAfterQuest.08
~I am doing so. Deeply.~ EXTERN AJANTJ AjantisAfterQuest.10

CHAIN AJANTJ AjantisAfterQuest.10
~The path forward, fulfilling my duty, and honoring the trust others hold in me... it is not an easy route that can be decided simply by following that which I first believe holds truth.~
	== AJANTJ ~It is a lesson Sir Keldorn has done his best to instill in me, but only now do I see the roots of it taking place.~
	END
		IF~~THEN REPLY ~That is the nature of learning. You can be told something a hundred times, but learning it for yourself will always hold more weight.~ EXTERN AJANTJ AjantisAfterQuest.11
		IF~~THEN REPLY ~I'm sure that he would be proud with the way you have handled yourself today, Ajantis.~ EXTERN AJANTJ AjantisAfterQuest.12
		IF~~THEN REPLY ~I suppose even paladins need to stub their toes on life a few times before the lesson sinks in.~ EXTERN AJANTJ AjantisAfterQuest.13
		IF~~THEN REPLY ~That's great, Ajantis. Let's just move along, alright?~ EXTERN AJANTJ AjantisAfterQuest.14

CHAIN AJANTJ AjantisAfterQuest.11
~And yet no matter how many times such a realization comes around, it always feels like a surprise. Interesting how these things work, isn't it?~ EXTERN AJANTJ AjantisAfterQuest.15

CHAIN AJANTJ AjantisAfterQuest.12
~Ha! I thank you for saying so, and I hope that you are right. Perhaps your tone would be different had you met the man—he can be a hard teacher sometimes, but I know that it is only because he cares deeply.~ EXTERN AJANTJ AjantisAfterQuest.15

CHAIN AJANTJ AjantisAfterQuest.13
~We strive for infallible faith, but we as individuals can be far from it. There is comfort in believing otherwise, but… perhaps it is foolish.~ EXTERN AJANTJ AjantisAfterQuest.15

CHAIN AJANTJ AjantisAfterQuest.09
~Then fear not, I will keep such ruminations to myself.~
DO ~SetGlobal("WNAjantisQuestDoneTalk","GLOBAL",2)~ EXIT

CHAIN AJANTJ AjantisAfterQuest.14
~As you wish. Let us go forth and tackle our quest with the strength that it requires!~
DO ~SetGlobal("WNAjantisQuestDoneTalk","GLOBAL",2)~ EXIT

CHAIN AJANTJ AjantisAfterQuest.15
~Thank you for listening to me. I have much to think on, it seems. Now, let us go forth and tackle our quest with the strength that it requires!~
DO ~SetGlobal("WNAjantisQuestDoneTalk","GLOBAL",2)~ EXIT

// OTR Talks

// Conversation 1: Marching Order [req: none]

CHAIN IF ~Global("WNAjantisChat","GLOBAL",2)~ THEN AJANTJ Chat.01x01
~I often forget just how strongly my Order regiments its knights. When we travel in groups, we are expected to move as one and follow strict orders from our leader, not gallivant around as we do now.~
	END
		IF~~THEN REPLY ~I am not a knight of your order, Ajantis. I'm not sure if it's fair to hold me to those standards.~ EXTERN AJANTJ Chat.01x02
		IF~~THEN REPLY ~If you don't like the way I run things, I'm open to suggestions.~ EXTERN AJANTJ Chat.01x03
		IF~~THEN REPLY ~We are hardly gallivanting. I am committed to our quest.~ EXTERN AJANTJ Chat.01x04
		IF~~THEN REPLY ~I don't wish to listen to your complaining.~ EXTERN AJANTJ Chat.01x05

CHAIN AJANTJ Chat.01x02
~Of course, I meant no offense! I am simply still growing accustomed to this way of doing things, so I apologize for my bluntness. I have been on the road alone for some time.~ EXTERN AJANTJ Chat.01x06

CHAIN AJANTJ Chat.01x03
~I don't mean to say I dislike it, only that I am still growing accustomed to this way of doing things. I apologize if I came across as insulting, that was not my intention.~ EXTERN AJANTJ Chat.01x06

CHAIN AJANTJ Chat.01x04
~It does me well to hear this, and I see in your face that it is the truth. I apologize if I insulted you—I am simply still growing accustomed to this way of doing things.~ EXTERN AJANTJ Chat.01x06

CHAIN AJANTJ Chat.01x06
~The Order of the Radiant Heart teaches that our skills must be nurtured and developed, so that they may serve to protect our allies in times of need. There is no greater honor than that of absolute dedication to your brothers-and-sisters in arms.~
== AJANTJ ~Leadership too, is a skill, and one that you already seem proficient in. Proficiency may not be enough, however. We must all strive for greatness, for that is how we earn our honor.~
	END
		IF~~THEN REPLY ~I didn't ask to be a leader. I'd happily leave it to someone else.~ EXTERN AJANTJ Chat.01x07
		IF~~THEN REPLY ~Proficiency is all I care for now. The rest will come with time.~ EXTERN AJANTJ Chat.01x08
		IF~~THEN REPLY ~I intend on improving my abilities, but perhaps not quite as strictly as your order would have it.~ EXTERN AJANTJ Chat.01x09
		IF~~THEN REPLY ~If you wish to lead this group, then you are welcome to.~ EXTERN AJANTJ Chat.01x10
		IF~~THEN REPLY ~I have no interest in converting, if that's what you're getting at...~ EXTERN AJANTJ Chat.01x11

CHAIN AJANTJ Chat.01x07
~Ah, is that not the classic virtue of a righteous leader? Helm willing, you will do just fine, my friend. I am glad to serve as your shield in this glorious quest.~ EXTERN AJANTJ Chat.01x12

CHAIN AJANTJ Chat.01x08
~I simply wish to impart upon you some wisdom granted to me. Do not grow content with your ability to protect, my friend. There is always room to improve, and to do so is admirable.~ EXTERN AJANTJ Chat.01x12

CHAIN AJANTJ Chat.01x09
~I am most glad to hear it, my friend. I have no doubt that you will make a righteous leader, and I shall be honored to act as your shield in our glorious quest!~ EXTERN AJANTJ Chat.01x12

CHAIN AJANTJ Chat.01x10
~I thank you for the offer, but I happily leave the role to you. My time here on the Sword Coast is one of learning, not of leading. If you have need of rest, however, I shall gladly take up a vanward position. I would be a poor servant of Helm if I refused to act as your shield.~ EXTERN AJANTJ Chat.01x12

CHAIN AJANTJ Chat.01x11
~Hah! The Order of the Radiant Heart does not accept just anyone. I, myself, am but a squire. Helm willing, I shall be knighted having completed our righteous quest in these lands. You are under no duty to worship as I do, and I respect you no less for it.~ EXTERN AJANTJ Chat.01x12

CHAIN AJANTJ Chat.01x05
~Very well, forgive the intrustion. Let us continue our quest for righteousness!~
DO ~SetGlobal("WNAjantisChat","GLOBAL",3)~ EXIT

CHAIN AJANTJ Chat.01x12
~I believe our time for conversation draws to a close, as pleasant as it may be. Let us move onwards.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",3)~ EXIT

// Conversation 2: Mentors [req: none]

CHAIN IF ~Global("WNAjantisChat","GLOBAL",5)~ THEN AJANTJ Chat.02x01
~Have you benefitted from the guidance of a mentor, <CHARNAME>? Someone whose example shines so brightly that it makes your own faults plain to see? You are consistently impressing me with your skills and abilities out on the field, it would surprise me if you had no formal tutorship.~
	END
		IF~~THEN REPLY ~Yes, my foster father Gorion served as my mentor in many ways before he passed, but it wasn't quite so extravagant as that.~ EXTERN AJANTJ Chat.02x02
		IF~~THEN REPLY ~I never had one mentor. It was always different people traveling through Candlekeep through the years.~ EXTERN AJANTJ Chat.02x03
		IF~~THEN REPLY ~There was someone in Candlekeep who taught me, but I wouldn't consider them a mentor, let alone a shining example.~ EXTERN AJANTJ Chat.02x04
		IF~~THEN REPLY ~No, not particularly.~ EXTERN AJANTJ Chat.02x04
		IF~~THEN REPLY ~We don't have time to talk, Ajantis.~ EXTERN AJANTJ Chat.02x05
		
CHAIN AJANTJ Chat.02x02
~I am sorry to hear of your loss. Such a thing cannot be easy, and you can count on my strength to support you. Nonetheless, it is good to hear that you had a teacher of sorts. Such a thing can hold great value.~ EXTERN AJANTJ Chat.02x06

CHAIN AJANTJ Chat.02x03
~Varied talents having a hand in your learning certainly shows. You are a dynamic individual—a valuable quality in any capacity. There is something to be said for having a longstanding relationship with a teacher, though. It is oft an impenetrable bond.~ EXTERN AJANTJ Chat.02x06

CHAIN AJANTJ Chat.02x04
~I see. You have many respectable talents, so it speaks to the strength of your character that you have not received formal training in that capacity.~ EXTERN AJANTJ Chat.02x06

CHAIN AJANTJ Chat.02x06
~I have a mentor of my own. Sir Keldorn Firecam, a senior paladin of the Order of the Radiant Heart. It is he who took me on as his squire and taught me that which the schools and tutors in Waterdeep could not. I admire him greatly. He is... everything I hope to be. When others may have doubts, he seems to know the righteous path as though Torm himself whispers in his ear.~
== AJANTJ ~I must prove myself worthy in his eyes. If I stumble in my quest for knighthood, then all I have striven for will crumble.~
	END
		IF~~THEN REPLY ~He sounds like a hard man to live up to.~ EXTERN AJANTJ Chat.02x07
		IF~~THEN REPLY ~Men can be certain without being right, Ajantis.~ EXTERN AJANTJ Chat.02x08
		IF~~THEN REPLY ~What else? Has he never lost a game of dice? Perhaps he rides a silver dragon into battle too.~ EXTERN AJANTJ Chat.02x09
		
CHAIN AJANTJ Chat.02x07
~Aye, in more ways than one. He sees with a clarity I can only aspire to, though I chase it with all my strength.~ EXTERN AJANTJ Chat.02x10

CHAIN AJANTJ Chat.02x08
~Perhaps, but he is old and wise enough that his judgement holds a weight that others filled with certainty would not have.~ EXTERN AJANTJ Chat.02x10

CHAIN AJANTJ Chat.02x09
~Hah! No silver dragon, though I have seen him ride a steed as fine a destrier as any knight could ask for. Even so, perhaps my tongue runs away with me when I speak of him.~ EXTERN AJANTJ Chat.02x10

CHAIN AJANTJ Chat.02x10
~Whether I speak too highly of him or too gravely of myself, I know this much: his example drives me forward. If I can prove myself on my mission here on the Sword Coast, then perhaps one day I will stand beside him as an equal member of the Radiant Heart.~
== AJANTJ ~But come, I have spoken for long enough, and our journey demands focus. We will have plenty of time for conversation in the future.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",6)~ EXIT

CHAIN AJANTJ Chat.02x05
~As you wish it. I simply wished to get to know you better. The bonds we forge as a party are ever important, as it is each other that we trust with our lives.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",6)~ EXIT

// Conversation 3: A Worthy Leader [req: Chapter 4]

CHAIN IF ~Global("WNAjantisChat","GLOBAL",8)~ THEN AJANTJ Chat.03x00
~With each passing battle won, I am affirmed of the rightness in my decision to join you. I am earning my honor in ways I had not imagined, and for that I am grateful.~
	END
		IF~~THEN REPLY ~How did you imagine earning your honor, if not like this?~ EXTERN AJANTJ Chat.03x01
		IF~~THEN REPLY ~I'm glad to hear that Ajantis.~ EXTERN AJANTJ Chat.03x02
		IF~~THEN REPLY ~I don't know about GOOD things, but we're certainly doing things.~ EXTERN AJANTJ Chat.03x03
		IF~~THEN REPLY ~That's great, but we haven't the time to stop and pat ourselves on the back.~ EXTERN AJANTJ Chat.03x04
	
CHAIN AJANTJ Chat.03x01
~Perhaps it's silly, because it's something that Sir Keldorn has reminded me time and time again. Even so, I find that only now I see it with open eyes.~ EXTERN AJANTJ Chat.03x05

CHAIN AJANTJ Chat.03x02
~That you are willing to take the time for each member of your party is a sign of a great leader, too. It is something that I have seen Sir Keldorn do on many occasions. The effectiveness of your group is only as good as the morale of each member.~ EXTERN AJANTJ Chat.03x05

CHAIN AJANTJ Chat.03x03
~That is exactly what I speak of, try as you might to be modest. Our quest takes us to many places, many people, that I would have balked at otherwise. Under your leadership, though, I feel that we are on the right path.~ EXTERN AJANTJ Chat.03x05

CHAIN AJANTJ Chat.03x05
~When I dreamed of following knighthood during my training, it always involved grand acts colored by absolute truth and certainty. There are many boastful souls in the Order of the Radiant Heart in Athkatla that perpetuate this vision, though they tend to be the ones that do not stray far from the city.~
== AJANTJ ~With you, our every day is filled with unsung acts of heroism. Often, we are dirty, caked in mud and blood, whether it be ours or our foes. It is oft unglamorous, yet I know that under the eye of Helm, we are doing good.~
	END
		IF~~THEN REPLY ~Aye, I was raised on tales of heroes and villains within the halls of my home. The life of an adventurer is not exactly what I imagined it to be.~ EXTERN AJANTJ Chat.03x06
		IF~CLASS(player1,PALADIN)~THEN REPLY ~I know exactly what you mean. The life of a paladin is far less ceremonial than I once believed, though no less necessary.~ EXTERN AJANTJ Chat.03x06
		IF~CLASS(Player1,RANGER_ALL)~THEN REPLY ~I never expected glamor, only purpose. But I never imagined how far that purpose would stretch, or how many would rely on us out here.~ EXTERN AJANTJ Chat.03x06
		IF~CLASS(Player1,MAGE_ALL)~THEN REPLY ~I know what you mean. In all my time of arcane study I learned from pristine books and lessons from tutors. Now I learn from experience and the spellbooks of fallen foes.~ EXTERN AJANTJ Chat.03x06
		IF~CLASS(Player1,CLERIC_ALL)~THEN REPLY ~I once thought service to my god would come through doctrine and my temple. I suppose we have both found that the fates have their own plans for us.~ EXTERN AJANTJ Chat.03x06
		IF~CLASS(Player1,MONK)~THEN REPLY ~My training taught me to find clarity in peace, but there is much more chaos in my life now than I ever could have imagined.~ EXTERN AJANTJ Chat.03x06
		IF~~THEN REPLY ~The work is ugly, but someone has to do it. Most who do don't get the luxury of reflecting on it.~ EXTERN AJANTJ Chat.03x07
		IF~~THEN REPLY ~I just take it one fight at a time. If we're all still breathing at the end of the day, that's a win.~ EXTERN AJANTJ Chat.03x08
		IF~~THEN REPLY ~A paladin discovering that life is hard? What a shock.~ EXTERN AJANTJ Chat.03x09
		
		
CHAIN AJANTJ Chat.03x06
~We have much in common, as ever. It reassures me that I am not the only one adjusting to this life.~ EXTERN AJANTJ Chat.03x10

CHAIN AJANTJ Chat.03x07
~Indeed, and for that I am grateful. Our swords and our wits have seen us through, as has Helm's watchful eye. I would pray that it continue to be so, but I have confidence enough in our abilities that such a thing is unneeded.~ EXTERN AJANTJ Chat.03x10

CHAIN AJANTJ Chat.03x08
~An understandable position as leader. Though, you ought to credit yourself—in the grand scheme of things, each victory seized brings us closer to our goals.~ EXTERN AJANTJ Chat.03x10

CHAIN AJANTJ Chat.03x09
~You jest, but in some ways it is easier now than it used to be. The pressure of training and imagining a future that may never come was oft greater than living out my purpose day to day as I do now.~ EXTERN AJANTJ Chat.03x10

CHAIN AJANTJ Chat.03x10
~If I were alone, perhaps I would still be chasing those grand deeds, but in this group I have seen the value in helping a single person. It is in these actions that we shall prevail in our quest, and I am more envigorated than ever to see it through.~
== AJANTJ ~Next time we stop at an inn, I shall raise a tankard to our party! I am certain that Sir Keldorn would do the same in fairer times.~
	END
		IF~~THEN REPLY ~Then we shall seek warm beds soon. It's past time that we stop for a drink, anyway.~ EXTERN AJANTJ Chat.03x11
		IF~~THEN REPLY ~Just be sure not to spill your drink during that speech.~ EXTERN AJANTJ Chat.03x12
		IF~~THEN REPLY ~I'll drink to living through the day, at least.~ EXTERN AJANTJ Chat.03x13
		IF~~THEN REPLY ~If you're buying the first round, I may even let you toast me by name.~ EXTERN AJANTJ Chat.03x14
		
CHAIN AJANTJ Chat.03x11
~It does me well to hear that. There's nothing quite like a restful eve amongst friends to raise morale.~ EXTERN AJANTJ Chat.03x15

CHAIN AJANTJ Chat.03x12
~I'll do my best, but I shan't promise anything.~ EXTERN AJANTJ Chat.03x15

CHAIN AJANTJ Chat.03x13
~Come now, there's more to life than survival. Perhaps it will do us both some good.~ EXTERN AJANTJ Chat.03x15

CHAIN AJANTJ Chat.03x14
~You drive a hard bargain, my <PRO_LADYLORD>, but perhaps it shall be so.~ EXTERN AJANTJ Chat.03x15

CHAIN AJANTJ Chat.03x15
~In the meantime, I suspect we have business to attend to. Relaxation must be earned, after all!~
DO ~SetGlobal("WNAjantisChat","GLOBAL",9) SetGlobal("WNAjantisTavern","GLOBAL",1)~ EXIT

CHAIN AJANTJ Chat.03x04
~You might find that group morale would improve should you take the time to tend to your compatriots, but I shall not bother you farther with this.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",9)~ EXIT

// Conversation 4: A Toast to the Heroes! [req: agreed to a drink last conversation]

CHAIN IF ~Global("WNAjantisTavern","GLOBAL",2)~ THEN AJANTJ Chat.04x00
~My mentor, Sir Keldorn, once taught me that camaraderie is a gift not to be shirked. I accompanied him on a campaign during my training—after our hard-fought victory, the men were drinking and laughing, and I felt... out of place, like my duty commanded me to remain vigilant even when rest called.~
== AJANTJ ~He approached me, armor set aside, and when I asked him if such merriment was proper for knights befitting our order, he merely laughed. "Ajantis," he said, "We celebrate not because we are proud, but because we are grateful. The sword is not the only thing worth raising." Although that night I did not truly feel at ease in his words, today I do.~
== AJANTJ ~I am honored to fight among this righteous band, and so today I raise my tankard to our quest and all our victories!~
== IMOEN2 IF ~InParty("IMOEN") IsValidForPartyDialogue("IMOEN")~ THEN ~Hear hear! Pass me a drink, I'm not lettin' you all enjoy yourselves without me.~
== RASAADJ IF ~InParty("RASAAD") IsValidForPartyDialogue("RASAAD")~ THEN ~I am blessed, truly, to be among such a group. Company like this is hard to come by.~
== BRANWJ IF ~InParty("BRANWEN") IsValidForPartyDialogue("BRANWEN")~ THEN ~We have fought, we have bled, and we have earned this ale! Tempus smiles on those who fight hard and drink hard, and we're only half way there.~
== YESLIJ IF ~InParty("YESLICK") IsValidForPartyDialogue("YESLICK")~ THEN ~Aye, now that’s a proper toast! To friends, to Clangeddin, and to the next foe we flatten!~
== JAHEIJ IF ~InParty("JAHEIRA") IsValidForPartyDialogue("JAHEIRA")~ THEN ~I am grateful indeed for a warm place to rest in good company. Would that our good fortune continue in the face of adversity.~
== KHALIJ IF ~InParty("KHALID") IsValidForPartyDialogue("KHALID")~ THEN ~I-I agree! To comradeship, and the r-road well traveled!~
== ALORAJ IF ~InParty("ALORA") IsValidForPartyDialogue("ALORA")~ THEN ~Yeah! But, uh, I might toast with cider instead of ale if Helm doesn't mind, Ajantis.~
== QUAYLJ IF ~InParty("QUAYLE") IsValidForPartyDialogue("QUAYLE")~ THEN ~To heroes! Even the armored, self-important ones!~
== MINSCJ IF ~InParty("MINSC") IsValidForPartyDialogue("MINSC")~ THEN ~Evil shall tremble anew with our reinvigorated spirits! When the next villains set eye on Minsc and Boo and friends, they shall turn tail and run!~
== DYNAHJ IF ~InParty("DYNAHEIR") IsValidForPartyDialogue("DYNAHEIR") InParty("MINSC") IsValidForPartyDialogue("MINSC")~ THEN ~Egh. Minsc, please stop waving thy hamster around so. It is surely not sanitary.~
== SKIEJ IF ~InParty("SKIE") IsValidForPartyDialogue("SKIE")~ THEN ~Cheers to you, Ajantis! If I faint from too much wine, you've only yourself to blame for being so inspiring.~
== NEERAJ IF ~InParty("NEERA") IsValidForPartyDialogue("NEERA")~ THEN ~If we're all sharing our feelings, I'm gonna need a stronger drink. Who's paying? Anyone? Don't leave me hanging.~
== CORANJ IF ~InParty("CORAN") IsValidForPartyDialogue("CORAN")~ THEN ~I didn't think room for merriment existed beneath your breastplate, Ajantis. Hear hear!~
== SAFANJ IF ~InParty("SAFANA") IsValidForPartyDialogue("SAFANA")~ THEN ~I've heard worse speeches in my time, but I've heard more than most. To our success, then.~
== VICONJ IF ~InParty("VICONIA") IsValidForPartyDialogue("VICONIA")~ THEN ~Shall we clasp hands and weep for the fallen now? I shall drink, if only to drown out the sound of your voice.~
== SHARTJ IF ~InParty("SHARTEEL") IsValidForPartyDialogue("SHARTEEL")~ THEN ~*grunt* That's supposed to be rousing? I've heard better from a dying pig.~
== ELDOTJ IF ~InParty("ELDOTH") IsValidForPartyDialogue("ELDOTH")~ THEN ~How charming. I am ever so relieved to have such a bastion of wisdom in our front lines.~
== EDWINJ IF ~InParty("EDWIN") IsValidForPartyDialogue("EDWIN")~ THEN ~Yes, yes, a valliantly grating speech. Keep it down, will you?~
== KIVANJ IF ~InParty("KIVAN") IsValidForPartyDialogue("KIVAN")~ THEN ~I find no comfort in cheers, but I shall not begrudge yours.~
== KAGAIJ IF ~InParty("KAGAIN") IsValidForPartyDialogue("KAGAIN")~ THEN ~I'll drink to good battlin' and the gold flowin' our way. You lot get sentimental, I'll get drunk.~
== FALDOJ IF ~InParty("FALDORN") IsValidForPartyDialogue("FALDORN")~ THEN ~The need for this display escapes me, and I will not be poisoning myself with any of this swill. Direct your praises elsewhere.~
== XANJ IF ~InParty("XAN") IsValidForPartyDialogue("XAN")~ THEN ~To the fleeting illusion of safety, then.~
== AJANTJ ~And to <CHARNAME>, a finer leader we could not ask for, and a <PRO_MANWOMAN> I am proud to call my friend!~
	END
		IF~~THEN REPLY ~Hear hear! We've much to be proud of.~ EXTERN AJANTJ Chat.04x01
		IF~~THEN REPLY ~I would not be here if not for the people around me. To all of us!~ EXTERN AJANTJ Chat.04x02
		IF~~THEN REPLY ~I'd rather not be the center of attention.~ EXTERN AJANTJ Chat.04x03
		IF~~THEN REPLY ~The road before us is long. Let's not celebrate too hard just yet.~ EXTERN AJANTJ Chat.04x04
		IF~~THEN REPLY ~Great. Now let us drink in peace.~ EXTERN AJANTJ Chat.04x05
		
CHAIN AJANTJ Chat.04x01
~And there will be much more still! Tomorrow, we continue on our righteous journey. For now, we drink.~
DO ~SetGlobal("WNAjantisTavern","GLOBAL",3) RestParty()~ EXIT

CHAIN AJANTJ Chat.04x02
~And to the friends we are yet to meet. Drink up!~
DO ~SetGlobal("WNAjantisTavern","GLOBAL",3) RestParty()~ EXIT

CHAIN AJANTJ Chat.04x03
~Apologies, my friend. For tonight, though, you deserve it. Get some rest, I'm sure it is needed.~
DO ~SetGlobal("WNAjantisTavern","GLOBAL",3) RestParty()~ EXIT

CHAIN AJANTJ Chat.04x04
~Of course, we must keep our wits about us. Remember, though, that relaxation is as important as any training. Now, let us drink!~
DO ~SetGlobal("WNAjantisTavern","GLOBAL",3) RestParty()~ EXIT

CHAIN AJANTJ Chat.04x05
~Of course, I shall not rob you of another moment of rest. We've well earned it.~
DO ~SetGlobal("WNAjantisTavern","GLOBAL",3) RestParty()~ EXIT


// Em dash — — — — —