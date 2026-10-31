///////////////////////////////////
///Conversations with the player///
///////////////////////////////////

// Quest Dialogue

// Quest 1: Ajantis wishes to visit the Temple of Helm

CHAIN IF ~Global("WNAjantisQuest","GLOBAL",1)~ THEN AJANTJ Temple.01
~Hold a moment, <CHARNAME>. If my recollections are true, then there is a temple dedicated to Helm not far from here. It would do our quest well to pay respects to the Vigilant One in his church... and I would consider it a personal favor if we went there soon.~
END
IF~~THEN REPLY ~Of course, Ajantis. We will go there as soon as we are able.~ EXTERN AJANTJ Temple.02
IF~~THEN REPLY ~I suppose the blessing of Helm couldn't hurt.~ EXTERN AJANTJ Temple.03
IF~~THEN REPLY ~I have no interest in visiting a temple of your god.~ EXTERN AJANTJ Temple.04

CHAIN AJANTJ Temple.02
~It heartens me to see that you recognize the value of Helm's strength. In these times, his vigilance is more important than ever. The temple lies north of the Ducal Palace, just a short walk from here. It will be good to stand within its walls once more.~ EXTERN AJANTJ Temple.05

CHAIN AJANTJ Temple.03
~You would do well to speak of Helm with greater respect. The Vigilant One watches over us all, whether you offer your prayers to him or not. The temple is north of the Ducal Palace, not far from here. Perhaps standing in his house of worship will grant you a better appreciation of his strength.~ EXTERN AJANTJ Temple.05

CHAIN AJANTJ Temple.04
~I shall ignore your tone and urge you to reconsider. Helm’s guidance offers strength and clarity, blessings we should not lightly dismiss in times such as these. I trust that you will make the wiser decision.~
DO ~SetGlobal("WNAjantisQuest","GLOBAL",5) AddJournalEntry(@101, QUEST)~ EXIT

CHAIN AJANTJ Temple.05
~It has been so many years since I last visited the temple. I was but a boy then... I suspect it may not be quite so grand as my memories paint it to be, but it will strengthen our resolve nonetheless. Come, let us be off!~
DO ~SetGlobal("WNAjantisQuest","GLOBAL",5) AddJournalEntry(@101, QUEST)~ EXIT

// Quest 2: Peitor is not here

CHAIN IF~Global("WNAjantisTimeTalk","GLOBAL",1)~ THEN AJANTJ PeitorSpawn.00
~This is the right place, <CHARNAME>, but I see no sign of Peitor. Perhaps we ought to return later in the day.~
DO ~SetGlobal("WNAjantisTimeTalk","GLOBAL",2)~ EXIT

// Quest 3a: Good resolution

 CHAIN IF~Global("WNAjantisQuestDoneTalk","GLOBAL",1) Global("WNAjantisQuest","GLOBAL",20)~ THEN AJANTJ AjantisAfterQuest.00
~The task is done, and I am left to reflect on the day's events. Do you know what weighs on my mind the heaviest?~
	END
		IF~~THEN REPLY ~Something to do with Peitor?~ EXTERN AJANTJ AjantisAfterQuest.01
		IF~PartyHasItem("wnajsh")~THEN REPLY ~The shield, perhaps?~ EXTERN AJANTJ AjantisAfterQuest.02
		IF~~THEN REPLY ~The necromancer and what he wrought?~ EXTERN AJANTJ AjantisAfterQuest.03
		IF~~THEN REPLY ~Watcher Teomara's judgment?~ EXTERN AJANTJ AjantisAfterQuest.04
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
~Watcher Teomara—she could have sent anyone to see to this matter, or even approached it herself. In truth, I am wondering if Helm guided her to wait for our arrival, so that I would see something that I was meant to see.~
== AJANTJ ~But... I do not know if I see it.~
	END
		IF~~THEN REPLY ~I think you do, Ajantis. The conflict you feel is evidence enough of that.~ EXTERN AJANTJ AjantisAfterQuest.07
		IF~~THEN REPLY ~Well, think on it.~ EXTERN AJANTJ AjantisAfterQuest.08
		IF~~THEN REPLY ~I truly don't really care.~ EXTERN AJANTJ AjantisAfterQuest.09

CHAIN AJANTJ AjantisAfterQuest.07
~Perhaps you are right. Your counsel continues to be a source of strength for me.~ EXTERN AJANTJ AjantisAfterQuest.10

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

// Quest 3b: Bad resolution

CHAIN IF~Global("WNAjantisQuestDoneTalk","GLOBAL",1) Global("WNAjantisQuest","GLOBAL",30)~ THEN AJANTJ AjantisBadQuest.00
~<CHARNAME>, a moment. I cannot put Ollera from my mind.~
== AJANTJ ~When Peitor told us his tale, I spoke of the shield as if it mattered above all else. I said the man who took his sister could wait. He... could not. And others paid for my certainty.~
	END
		IF~~THEN REPLY ~You couldn't have known what the necromancer was doing to her.~ EXTERN AJANTJ AjantisBadQuest.01
		IF~~THEN REPLY ~We made that choice together. The blame isn't yours alone.~ EXTERN AJANTJ AjantisBadQuest.02
		IF~~THEN REPLY ~Recovering the shield was our task. You did your duty.~ EXTERN AJANTJ AjantisBadQuest.03
		IF~~THEN REPLY ~No, it wasn't. You chose wrong.~ EXTERN AJANTJ AjantisBadQuest.04
		IF~~THEN REPLY ~Dwell on it later, Ajantis. We have work to do.~ EXTERN AJANTJ AjantisBadQuest.05

CHAIN AJANTJ AjantisBadQuest.01
~Perhaps not, but a paladin who will not look is little better than one who cannot see.~ EXTERN AJANTJ AjantisBadQuest.06

CHAIN AJANTJ AjantisBadQuest.02
~That is generous of you. But you heeded my counsel, and my counsel was poor.~ EXTERN AJANTJ AjantisBadQuest.06

CHAIN AJANTJ AjantisBadQuest.03
~That is what I told myself. But Helm's faithful are meant to guard the living and honor the dead, not just polish their relics.~ EXTERN AJANTJ AjantisBadQuest.06

CHAIN AJANTJ AjantisBadQuest.04
~...Yes, I did. I would rather hear it plainly than be comforted.~ EXTERN AJANTJ AjantisBadQuest.06

CHAIN AJANTJ AjantisBadQuest.06
~And Ollera is only half of it.~
// Ending 4: Peitor was expelled
== AJANTJ IF ~Global("WNPeitorExpelled","GLOBAL",1)~ THEN ~Peitor is cast out, and I cannot say the Watcher judged wrongly. Yet I wonder whether, had I been gentler with him in that tavern, he might have found his courage sooner.~
// Ending 3: Peitor forgiven, shield returned
== AJANTJ IF ~!Global("WNPeitorExpelled","GLOBAL",1)~ THEN ~Peitor was forgiven, and the shield is within my grasp. Yet I wonder if I am worthy of it.~
== AJANTJ ~Sir Keldorn once told me that a knight is not measured by whether he errs, but by what he does after the fact. I took that as a comfort at the time, but now I see that it is a burden, and it is one I mean to carry.~
	END
		IF~~THEN REPLY ~All we can do is endeavor to do better, Ajantis.~ EXTERN AJANTJ AjantisBadQuest.07
		IF~~THEN REPLY ~Just don't let it break you. You have a responsibility to our quest, and to yourself.~ EXTERN AJANTJ AjantisBadQuest.08
		IF~~THEN REPLY ~As long as it doesn't slow us down.~ EXTERN AJANTJ AjantisBadQuest.09

CHAIN AJANTJ AjantisBadQuest.07
~I will. Thank you, <CHARNAME>.~ EXTERN AJANTJ AjantisBadQuest.10

CHAIN AJANTJ AjantisBadQuest.08
~It will not, you have my word on that.~ EXTERN AJANTJ AjantisBadQuest.10

CHAIN AJANTJ AjantisBadQuest.10
~Let us go on. I will remember her name, not merely what was done to her.~
DO ~SetGlobal("WNAjantisQuestDoneTalk","GLOBAL",2)~ EXIT

CHAIN AJANTJ AjantisBadQuest.09
~...As you say.~
DO ~SetGlobal("WNAjantisQuestDoneTalk","GLOBAL",2)~ EXIT

CHAIN AJANTJ AjantisBadQuest.05
~As you wish. But I will not forget it.~
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
~Very well, forgive the intrusion. Let us continue our quest for righteousness!~
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
~I am sorry to hear of your loss. Such a thing cannot be easy, and you can count on my strength to support you. Nonetheless, it is good to hear that you had a teacher of sorts. Bonds as these can hold great value.~ EXTERN AJANTJ Chat.02x06

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
~Perhaps, but he is old and wise enough that his judgment holds a truth that others filled with certainty are bereft of.~ EXTERN AJANTJ Chat.02x10

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
~With each passing battle won, I am affirmed of the rightness in my decision to join you. I am earning my honor in ways I had not imagined, and I am not short of gratitude for that fact.~
	END
		IF~~THEN REPLY ~How did you imagine earning your honor, if not like this?~ EXTERN AJANTJ Chat.03x01
		IF~~THEN REPLY ~I'm glad to hear that, Ajantis.~ EXTERN AJANTJ Chat.03x02
		IF~~THEN REPLY ~I don’t know about honor, but we’re certainly winning battles.~ EXTERN AJANTJ Chat.03x03
		IF~~THEN REPLY ~That's great, but we haven't the time to stop and pat ourselves on the back.~ EXTERN AJANTJ Chat.03x04
	
CHAIN AJANTJ Chat.03x01
~Not like this, I confess. Sir Keldorn warned me as much, many times, as a weathered and experienced warrior himself.~ EXTERN AJANTJ Chat.03x05

CHAIN AJANTJ Chat.03x02
~That you are willing to take the time for each member of your party is a sign of a great leader, too. It is something that I have seen Sir Keldorn do on many occasions. The effectiveness of your group is determined by the morale of the individuals within it.~ EXTERN AJANTJ Chat.03x05

CHAIN AJANTJ Chat.03x03
~That is what I speak of, try as you might to be modest. Our quest takes us to many places, many people, that I would have balked at otherwise. Under your leadership, though, I feel that we are on the right path.~ EXTERN AJANTJ Chat.03x05

CHAIN AJANTJ Chat.03x05
~When I dreamed of following knighthood during my training, it always involved grand acts filtered through glory and chivalrous battle. There are many boastful souls in the Order of the Radiant Heart in Athkatla that perpetuate this vision, though they tend to be the ones that do not stray far from the city.~
== AJANTJ ~With you, our every day is filled with unsung acts of heroism. Often, we are dirty, caked in mud and blood, whether it be ours or our foes'. It is oft unglamorous, yet I know that under the eye of Helm, we are doing good.~
	END
		IF~~THEN REPLY ~Aye, I was raised on tales of heroes and villains within the halls of my home. The life of an adventurer is not exactly what I imagined it to be.~ EXTERN AJANTJ Chat.03x06
		IF~CLASS(player1,PALADIN)~THEN REPLY ~I know exactly what you mean. The life of a paladin is far less ceremonial than I once believed, though no less necessary.~ EXTERN AJANTJ Chat.03x06
		IF~CLASS(Player1,RANGER_ALL)~THEN REPLY ~I never expected glamor, only my purpose. But I never imagined how far that purpose would stretch, or how many would rely on us out here.~ EXTERN AJANTJ Chat.03x06
		IF~CLASS(Player1,MAGE_ALL)~THEN REPLY ~I know what you mean. In all my time of arcane study I learned only from pristine books and lessons from Gorion. Now I learn from experience and the spellbooks of fallen foes.~ EXTERN AJANTJ Chat.03x06
		IF~CLASS(Player1,CLERIC_ALL)~THEN REPLY ~I once thought service to my god would come through doctrine and my temple. I suppose we have both found that the fates have their own plans for us.~ EXTERN AJANTJ Chat.03x06
		IF~CLASS(Player1,MONK)~THEN REPLY ~My training taught me to find clarity in peace, but there is much more chaos in my life now than I ever could have imagined.~ EXTERN AJANTJ Chat.03x06
		IF~~THEN REPLY ~The work is ugly, but someone has to do it. Most who do don't get the luxury of reflecting on it.~ EXTERN AJANTJ Chat.03x07
		IF~~THEN REPLY ~I just take it one fight at a time. If we're all still breathing at the end of the day, that's a win.~ EXTERN AJANTJ Chat.03x08
		IF~~THEN REPLY ~A paladin discovering that life is hard? What a shock.~ EXTERN AJANTJ Chat.03x09
		
		
CHAIN AJANTJ Chat.03x06
~We have much in common, as ever. It reassures me that I am not the only one adjusting to this life.~ EXTERN AJANTJ Chat.03x10

CHAIN AJANTJ Chat.03x07
~Indeed, and for that I am grateful. Our swords and our wits have seen us through, as has Helm's watchful eye. I pray that it continues to be so, and with the skill of our group I am without doubts.~ EXTERN AJANTJ Chat.03x10

CHAIN AJANTJ Chat.03x08
~An understandable position as leader. Though, you ought to credit yourself—each victory seized brings us closer to realizing our goals.~ EXTERN AJANTJ Chat.03x10

CHAIN AJANTJ Chat.03x09
~You jest, but in some ways it is easier now than it used to be. The pressure of training and imagining a future that may never come was oft greater than living out my purpose day to day as I do now.~ EXTERN AJANTJ Chat.03x10

CHAIN AJANTJ Chat.03x10
~If I were alone, perhaps I would still be chasing those grand deeds, but in this group I have seen the value in helping a single person. It is in these actions that we shall prevail in our quest, and I am more invigorated than ever to see it through.~
== AJANTJ ~After a long expedition I accompanied Sir Keldorn on once, he told me that our swords are not the only thing worth raising. I believe I am beginning to understand him. Come, let us press on!~
DO ~SetGlobal("WNAjantisChat","GLOBAL",9)~ EXIT

CHAIN AJANTJ Chat.03x04
~You might find that group morale would improve should you take the time to tend to your compatriots, but I shall not bother you further with this.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",9)~ EXIT

// Conversation 4: What Duty Demands [req: Completed "The Errant Acolyte"]

CHAIN IF ~Global("WNAjantisChat","GLOBAL",10)~ THEN AJANTJ Chat.04x00
~<CHARNAME>, may I borrow your ear for a moment? I have been turning over a question that Watcher Teomara asked me before Helm's altar.~
== AJANTJ ~She asked whether I held true to Helm's path, even in the mire.~
	END
		IF~~THEN REPLY ~And what's your answer?~ EXTERN AJANTJ Chat.04x01
		IF~~THEN REPLY ~You've been thinking about a swamp this whole time?~ EXTERN AJANTJ Chat.04x02
		IF~~THEN REPLY ~I'm not sure I'm the right person to judge that.~ EXTERN AJANTJ Chat.04x03
		IF~~THEN REPLY ~We haven't the time to stop now, Ajantis.~ EXTERN AJANTJ Chat.04x04

CHAIN AJANTJ Chat.04x01
~At first, I thought myself unable to answer truly, for Helm's path is not one lightly walked.~ EXTERN AJANTJ Chat.04x05

CHAIN AJANTJ Chat.04x02
~If my conscience be a swamp, I find myself wading through it with fervor. But it has been worth the effort.~ EXTERN AJANTJ Chat.04x05

CHAIN AJANTJ Chat.04x03
~I do not ask you to judge it—only to hear it, if you would.~ EXTERN AJANTJ Chat.04x05

CHAIN AJANTJ Chat.04x04
~Of course. I will come to you another time, then.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",9) SetGlobal("WNAjantOTR4","GLOBAL",0)~ EXIT

CHAIN AJANTJ Chat.04x05
~You know of Helm's actions during the Time of Troubles, yes? He was bidden to guard the way to the heavens, and when Mystra—goddess of magic—tried to pass, he struck her down. Many have never forgiven him for it.~
== AJANTJ ~When I was younger, I thought his strength was in holding steadfast to his order. He was commanded, so he obeyed, and if that were enough for Helm himself, then that was all a paladin need understand.~
== AJANTJ ~I see it differently now. Helm did not strike Mystra down because obedience is a virtue. He did it because he had given his word, and he bore the cost of that promise knowingly, without turning away. The sorrowful tale instills a new kind of strength in me now—I am emboldened not by duty itself, but by the courage to carry the weight of my own choices.~
	END
		IF~~THEN REPLY ~So what does that make you now?~ EXTERN AJANTJ Chat.04x06
		IF~~THEN REPLY ~That sounds like a convenient way to forgive your god for a terrible act.~ EXTERN AJANTJ Chat.04x07
		IF~~THEN REPLY ~It's good to hear you sounding sure of yourself again.~ EXTERN AJANTJ Chat.04x08
		IF~~THEN REPLY ~Gods do what they do. I try not to read into it too much.~ EXTERN AJANTJ Chat.04x09

CHAIN AJANTJ Chat.04x06
~A squire who has finally learned what his oath asks of him, I hope.~ EXTERN AJANTJ Chat.04x10

CHAIN AJANTJ Chat.04x07
~I have nothing to forgive. Even Helm himself would not deny that the events of that day were dreadful, but his sorrow over it has left a lasting impression on me.~ EXTERN AJANTJ Chat.04x10

CHAIN AJANTJ Chat.04x08
~I have doubted enough for one lifetime, I think. It is about time that I do something with all that I have learned.~ EXTERN AJANTJ Chat.04x10

CHAIN AJANTJ Chat.04x09
~Maybe so, but there is wisdom to be found in revisiting such ideas.~ EXTERN AJANTJ Chat.04x10

CHAIN AJANTJ Chat.04x10
~And so, when I consider whether or not I held true to Helm's path in the face of the trial Watcher Teomara put before me, I believe I have an answer.~
	END
		IF~Global("WNAjantisEnding","GLOBAL",1)~ THEN EXTERN AJANTJ Chat.04xEnd1
		IF~Global("WNAjantisEnding","GLOBAL",2)~ THEN EXTERN AJANTJ Chat.04xEnd2
		IF~Global("WNAjantisEnding","GLOBAL",3)~ THEN EXTERN AJANTJ Chat.04xEnd3
		IF~Global("WNAjantisEnding","GLOBAL",4)~ THEN EXTERN AJANTJ Chat.04xEnd4

// Ending 1: shield recovered, Ollera saved
CHAIN AJANTJ Chat.04xEnd1
~I held true, but not through rigidly following my orders to the letter. I stayed true to myself because I listened—to you, and to my own conscience, not only to the task before me. Through these things I found temperance. For that, I am grateful to you.~
== AJANTJ ~Orders are far from meaningless, do not mistake me, but they are no substitute for judgment—a tool I mean to keep sharp. Come, let us move onwards!~
DO ~SetGlobal("WNAjantisChat","GLOBAL",11)~ EXIT

// Ending 2: Ollera saved, shield lost
CHAIN AJANTJ Chat.04xEnd2
~I failed the task I was given, and saved a girl's rest instead. If the Order asks me to account for it, I will, and gladly.~
== AJANTJ ~Objects may come and go, but life—and death—are delicate things to be protected. I would make the same choice a hundred times over, and I have you to thank for helping me find my mind amidst it all. Come, let us go on.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",11)~ EXIT

// Ending 3: shield recovered, Ollera defiled
CHAIN AJANTJ Chat.04xEnd3
~I did not, then. I put the task first, and a girl's rest paid the price for it. That burden is mine, and I shall carry it for a long time.~
== AJANTJ ~But I know now what such a choice costs. I will not make it blindly again. Come, let us go on.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",11)~ EXIT

// Ending 4: everything lost, Peitor expelled
CHAIN AJANTJ Chat.04xEnd4
~Not as I should have. We lost the shield, and Peitor lost his place among the faithful, just as he lost his sister.~
== AJANTJ ~Yet the Watcher showed me that justice need not be cruel to be right. To guard the weak, and to show them mercy when they fall—I shall hold this responsibility close to my heart. Come, let us continue on, to better things.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",11)~ EXIT




