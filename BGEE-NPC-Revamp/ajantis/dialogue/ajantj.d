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


// Conversation 1: Marching Order

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

// Conversation 2: Mentors

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
~I have a mentor of my own. Sir Keldorn Firecam, a senior paladin of the Order of the Radiant Heart. It is he who took me on as his squire and taught me that which the schools and tutors in Waterdeep could not. I admire him greatly. He is... everything I hope to be. When others doubt, he knows the righteous path as though Torm himself whispers in his ear.~
== AJANTJ ~I must prove myself worthy in his eyes. If I stumble in my quest for knighthood, then all I have striven for will crumble.~
	END
		IF~~THEN REPLY ~He sounds like a hard man to live up to.~ EXTERN AJANTJ Chat.02x07
		IF~~THEN REPLY ~Men can be certain without being right, Ajantis.~ EXTERN AJANTJ Chat.02x08
		IF~~THEN REPLY ~What else? Has he never lost a game of dice? Perhaps he rides a silver dragon into battle too.~ EXTERN AJANTJ Chat.02x09

CHAIN AJANTJ Chat.02x07
~Aye, in more ways than one. He sees with a clarity I can only aspire to, though I chase it with all my strength.~ EXTERN AJANTJ Chat.02x10

CHAIN AJANTJ Chat.02x08
~Perhaps, but he is old and wise enough that his judgment holds a weight that others filled with certainty would not have.~ EXTERN AJANTJ Chat.02x10

CHAIN AJANTJ Chat.02x09
~Hah! No silver dragon, though I have seen him ride a steed as fine a destrier as any knight could ask for. Even so, perhaps my tongue runs away with me when I speak of him.~ EXTERN AJANTJ Chat.02x10

CHAIN AJANTJ Chat.02x10
~Whether I speak too highly of him or too gravely of myself, I know this much: his example drives me forward. If I can prove myself on my mission here on the Sword Coast, then perhaps one day I will stand with him as an equal knight of the Radiant Heart.~
== AJANTJ ~But come, I have spoken for long enough, and our journey demands focus. We will have plenty of time for conversation in the future.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",6)~ EXIT

CHAIN AJANTJ Chat.02x05
~As you wish it. I simply wished to get to know you better. The bonds we forge as a party are ever important, as it is each other that we trust with our lives.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",6)~ EXIT
