///////////////////////////////////
///Conversations with the player///
///////////////////////////////////

// Quest Dialogue

// Quest 1: Ajantis Wishes to Visit the Temple of Helm

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

// Quest 2: After sending Peitor away

// Quest 3: After quest is over









// Quest 2: 


// Leave party, go to Temple of Helm. Speaking to Ajantis will trigger a unique dialogue between the Cleric and Ajantis.

// Conversation 1

CHAIN IF ~Global("WNAjantisChat","GLOBAL",2)~ THEN AJANTJ Chat1.01x01
~I often forget just how strongly my Order regiments its knights. When we travel in groups, we are expected to move as one and follow strict orders from our leader, not gallivant around as we do now.~
END
IF~~THEN REPLY ~I am not a knight of your order, Ajantis, so don't expect that I act like one.~ EXTERN AJANTJ Chat1.01x02
IF~~THEN REPLY ~If you don't like the way I run things, I'm open to suggestions.~ EXTERN AJANTJ Chat1.01x03
IF~~THEN REPLY ~We are hardly gallivanting. I am committed to our quest.~ EXTERN AJANTJ Chat1.01x04
IF~~THEN REPLY ~I don't wish to listen to your complaining.~ EXTERN AJANTJ Chat1.01x05

CHAIN AJANTJ Chat1.01x02
~Of course, I meant no offense! I am simply still growing accustomed to this way of doing things.~ EXTERN AJANTJ Chat1.01x06

CHAIN AJANTJ Chat1.01x03
~I don't mean to say- I dislike it, only that I am still growing accustomed to this way of doing things.~ EXTERN AJANTJ Chat1.01x06

CHAIN AJANTJ Chat1.01x04
~It does me well to hear this, and I see in your face that it is the truth. I apologize if I insulted you— I am simply still growing accustomed to this way of doing things.~ EXTERN AJANTJ Chat1.01x06

CHAIN AJANTJ Chat1.01x06
~My Order teaches that our skills must be nurtured and developed, so that they may serve to protect our allies in times of need. There is no greater honor than that of absolute dedication to your brothers-and-sisters in arms.~
== AJANTJ ~Leadership too, is a skill, and one that you already seem somewhat proficient in— Proficiency is not enough, though. We must all strive for greatness, for that is how we earn our honor.~
END
IF~~THEN REPLY ~I didn't ask to be a leader. I'd happily leave it to someone else.~ EXTERN AJANTJ Chat1.01x07
IF~~THEN REPLY ~Proficiency is all I care for now. The rest will come with time.~ EXTERN AJANTJ Chat1.01x08
IF~~THEN REPLY ~I intend on improving my abilities, but perhaps not quite as strictly as your order would have it.~ EXTERN AJANTJ Chat1.01x09
IF~~THEN REPLY ~If you wish to lead this group, then you are welcome to.~ EXTERN AJANTJ Chat1.01x10
IF~~THEN REPLY ~I have no interest in converting, if that's what you're getting at...~ EXTERN AJANTJ Chat1.01x11

CHAIN AJANTJ Chat1.01x07
~Ah, is that not the classic virtue of a righteous leader? Helm willing, you will do just fine, my friend. I am glad to serve as your shield in this glorious quest!~ EXTERN AJANTJ Chat1.01x12

CHAIN AJANTJ Chat1.01x08
~I simply wish to impart upon you some wisdom granted to me. Do not grow content with your ability to protect, my friend. There is always room to improve, and to do so is admirable.~ EXTERN AJANTJ Chat1.01x12

CHAIN AJANTJ Chat1.01x09
~I am most glad to hear it, my friend. I have no doubt that you will make a righteous leader, and I shall be glad to act as your shield in our glorious quest!~ EXTERN AJANTJ Chat1.01x12

CHAIN AJANTJ Chat1.01x10
~I thank you for the offer, but I happily leave the role to you. If you have need of rest, however, I shall gladly take up a vanward position. I would be a poor servant of Helm if I refused to act as your shield.~ EXTERN AJANTJ Chat1.01x12

CHAIN AJANTJ Chat1.01x11
~Hah! The Order of the Radiant Heart does not accept just anyone. I, myself, am but a squire. Helm willing, I shall be knighted having completed our righteous quest in these lands— You are under no duty to worship as I do, and I respect you no less for it.~ EXTERN AJANTJ Chat1.01x12

CHAIN AJANTJ Chat1.01x05
~Very well. Forgive the intrustion— Let us continue our quest for righteousness!~
DO ~SetGlobal("WNAjantisChat","GLOBAL",3)~ EXIT

CHAIN AJANTJ Chat1.01x12
~I believe our time for conversation draws to a close. Let us move onwards.~
DO ~SetGlobal("WNAjantisChat","GLOBAL",3)~ EXIT


// DO ~SetGlobal("WNAjantisChat","GLOBAL",3)~
// EXIT

// PC IS A PALADIN

// CHAIN IF ~Global("WNPaladinChat","GLOBAL",1)~ THEN AJANTJ Pal.01



// It has been some time since I last traveled with dedicated company. 

// EM DASH —