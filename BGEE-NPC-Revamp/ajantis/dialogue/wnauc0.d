BEGIN WNAUC0


// Global: Auction Crashed (BoaFirst)
// 0: not started
// 1: auction ended peacefully
// 2: auction ended unhappily
// 3: everyone is dead
// 4: quest over

// FenaFirst -> Give shield to auctioneer
// Global("WNAuctionDone","GLOBAL",0) = not started
// Global("WNAuctionDone","GLOBAL",1) = won
// Global("WNAuctionDone","GLOBAL",2) = lost -> give shield to WNAUC4
// Global("WNAuctionDone","GLOBAL",3) = crashed

// WNAUC0 = Auctioneer
// WNAUC1 = Pushy Patrician
// WNAUC2 = Loud Lordling
// WNAUC3 = Nouveau Noble
// WNAUC4 = Bored Baroness

CHAIN IF ~Global("WNBoaFirst","GLOBAL",5)~ THEN WNAUC0 ShieldPath.00
~We'll begin shortly, everyone. Please, just a little patience.~
	== WNAUC1 ~How much longer is this going to take? We should LONG have since started by now.~
	== WNAUC2 ~Hear hear. Boa's no saint but he's never this bloody late.~
	== WNAUC0 ~Please, I—ah, we have more company. Are you here for business, friend? Or did you take a wrong turn?~
	END
		IF~~THEN REPLY ~I come bearing news regarding the subject of this auction.~ EXTERN WNAUC0 ShieldPath.01
		IF~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS")~ THEN REPLY ~Boa has sent me with the shield. Let us begin with the auction.~ EXTERN WNAUC0 ShieldPath.02
		IF~~THEN REPLY ~Gutless worms. I have you all right where I want you. Prepare to die.~ EXTERN WNAUC3 ShieldPath.03
		IF~~THEN REPLY ~Just dropping in to say hi. Excuse me.~ EXTERN WNAUC0 ShieldPath.04
		
CHAIN WNAUC0 ShieldPath.01
~Oh? I eagerly await to hear it, as I'm sure we all do.~
	END
		IF~~THEN REPLY ~The Flaming Fist has confiscated the relic and thus it shall not be available for auction tonight, nor ever.~ EXTERN WNAUC3 ShieldPath.05
		IF~~THEN REPLY ~I bought the shield from Boa myself, and I'm not giving it to any of you. Go home.~ EXTERN WNAUC2 ShieldPath.06
		IF~~THEN REPLY ~The shield was determined to be a fake by an expert. I apologize for the inconvenience.~ EXTERN WNAUC1 ShieldPath.07
		IF~~THEN REPLY ~The shield has been stolen. Unless one of you is hiding it under your coat, there’s nothing left to auction.~ EXTERN WNAUC3 ShieldPath.08
		IF~~THEN REPLY ~Boa has entrusted me with the task of delivering it. I am here to oversee the auction and return the payment back to him.~ EXTERN WNAUC0 ShieldPath.02

CHAIN WNAUC0 ShieldPath.02
~You're... not who I was expecting to bring it, but if you have the item with you then I suppose we can begin with the auction.~ EXTERN AJANTJ ShieldPath.Interject

CHAIN WNAUC0 ShieldPath.04
~I don't think so, friend. You've walked in on some rather delicate proceedings. Tell me why you're here, if you please.~
	END
		IF~~THEN REPLY ~I come bearing news regarding the subject of this auction.~ EXTERN WNAUC0 ShieldPath.01
		IF~~THEN REPLY ~Boa has sent me with the shield and to return to him with payment. Let us begin with the auction.~ EXTERN WNAUC0 ShieldPath.02
		IF~~THEN REPLY ~I'm here to kill you all and take your gold.~ EXTERN WNAUC3 ShieldPath.03
		
CHAIN AJANTJ ShieldPath.Interject
~You cannot be serious, <CHARNAME>. If you are playing some game, then I advise that you quit now. This shield must be returned to the Temple of Helm.~
	== WNAUC4 ~They're Helmites? We have to get out of here!~
	== WNAUC0 ~Please, if everyone could keep their heads, I'm sure we can sort all of this out—~
	== WNAUC1 ~Run for it!~
	DO ~SetGlobal("WNAuctionCrashed","GLOBAL",2) 
	ActionOverride("wnauc1",EscapeArea())
	ActionOverride("wnauc2",EscapeArea())
	ActionOverride("wnauc3",EscapeArea())
	ActionOverride("wnauc4",EscapeArea())~
	EXIT
	
CHAIN WNAUC3 ShieldPath.05
~What?! This is outrageous!~
	== WNAUC1 ~The Flaming Fist have never intercepted one of these auctions before!~
	== WNAUC2 ~Wait, this <PRO_GIRLBOY> might be with the Fist... We should get out of here!~
	== WNAUC0 ~Please, if everyone could keep their heads, I'm sure we can sort all of this out—~
	== WNAUC3 ~Run for it!~
	== WNAUC0 ~Oh, blast it.~
	DO ~SetGlobal("WNAuctionCrashed","GLOBAL",1) 
	ActionOverride("wnauc1",EscapeArea())
	ActionOverride("wnauc2",EscapeArea())
	ActionOverride("wnauc3",EscapeArea())
	ActionOverride("wnauc4",EscapeArea())~
	EXIT
	
CHAIN WNAUC2 ShieldPath.06
~Bought it yourself? I don't bloody think so. This is an AUCTION!~
	== WNAUC1 ~You've already concluded the sale? What a waste of time this has been...~
	== WNAUC2 ~Whatever price you paid, I'll double it. I will!~
	== WNAUC0 ~Let's all keep our heads, friends and—~
	== WNAUC4 ~C'mon, see the way <PRO_HESHE>'s armed? Let's just get out of here.~
	== WNAUC3 ~Fine. I've a pile of gold burning a hole in my aurumthread trouser pockets. Let's go drinking, shall we?~
	DO ~SetGlobal("WNAuctionCrashed","GLOBAL",2) 
	ActionOverride("wnauc1",EscapeArea())
	ActionOverride("wnauc2",EscapeArea())
	ActionOverride("wnauc3",EscapeArea())
	ActionOverride("wnauc4",EscapeArea())~
	EXIT
	
CHAIN WNAUC1 ShieldPath.07
~Bah, not again!~
	== WNAUC4 ~At least they caught it early this time. The last thing I need is some tacky imitation on my wall.~
	== WNAUC2 ~Not early enough. This has been a godsdamned waste of time.~
	== WNAUC0 ~Please, if everyone could keep their heads, I'm sure we can sort all of this out—~
	== WNAUC3 ~Let's go. Perhaps I can get a carriage back to the estate...~
	== WNAUC0 ~Oh, blast it. I suppose the auction is off.~
	DO ~SetGlobal("WNAuctionCrashed","GLOBAL",1) 
	ActionOverride("wnauc0",EscapeArea())
	ActionOverride("wnauc1",EscapeArea())
	ActionOverride("wnauc2",EscapeArea())
	ActionOverride("wnauc3",EscapeArea())
	ActionOverride("wnauc4",EscapeArea())~
	EXIT
		
CHAIN WNAUC3 ShieldPath.08
~Stolen?! Outrageous. This is a terrible way to conduct business.~
	== WNAUC1 ~This is the last time I attend one of these auctions, that's for certain.~
	== WNAUC2 ~Let's get out of here. This has been a godsdamned waste of time.~
	== WNAUC0 ~I'd like to formally apologize, everyone. This is most unusual, but I assure you that it shan't happen again!~
	== WNAUC4 ~Whatever. I'm leaving.~
	DO ~SetGlobal("WNAuctionCrashed","GLOBAL",1) 
	ActionOverride("wnauc0",EscapeArea())
	ActionOverride("wnauc1",EscapeArea())
	ActionOverride("wnauc2",EscapeArea())
	ActionOverride("wnauc3",EscapeArea())
	ActionOverride("wnauc4",EscapeArea())~
	EXIT			
		
CHAIN WNAUC3 ShieldPath.03
~Aeeeeeeei! Run for it!~
	DO ~SetGlobal("WNAuctionCrashed","GLOBAL",3)
	ActionOverride("wnauc0",EscapeArea()) ActionOverride("wnauc0",Enemy())
	ActionOverride("wnauc1",EscapeArea()) ActionOverride("wnauc1",Enemy())
	ActionOverride("wnauc2",EscapeArea()) ActionOverride("wnauc2",Enemy())
	ActionOverride("wnauc3",EscapeArea()) ActionOverride("wnauc3",Enemy())
	ActionOverride("wnauc4",EscapeArea()) ActionOverride("wnauc4",Enemy())~
	EXIT

CHAIN IF ~OR(2)
		Global("WNAuctionCrashed","GLOBAL",2)
		Global("WNAuctionCrashed","GLOBAL",1)~ THEN WNAUC0 Leave
~This is terribly inconvenient, but I suppose there's not much to do about it. Thank you for bringing this to my attention. Good day.~
DO ~EscapeArea()~ EXIT
	
// Real Auction

CHAIN IF ~Global("WNAuctionDone","GLOBAL",0) Global("WNFenaFirst","GLOBAL",1)~ THEN WNAUC0 NecroPath.00
~—and we begin! A relic of a disgraced religion, beautifully crafted, with power coursing through the very metal. The bid starts at three thousand gold, ladies and gentlemen.~
	== WNAUC1 ~Let's move this along—three thousand!~
	== WNAUC3 ~Three-thousand-eight-hundred. I trust that there will be a certificate of authenticity this time?~
	== WNAUC2 ~Quit yammering! Five thousand!~
	== WNAUC4 ~Six.~
	== WNAUC1 ~...~
	== WNAUC0 ~We have six thousand gold, will anyone step in? There's—oh, greetings my <PRO_LADYLORD>. I'm afraid this is a private event... unless you are here to participate in the auction.~
	END
		IF~~THEN REPLY ~I am, indeed. What is the current bid?~ EXTERN WNAUC0 NecroPath.01
		IF~~THEN REPLY ~Yes. I wish to make a bid.~ DO ~SetGlobal("WNAucPlayerBid","GLOBAL",0)~ EXTERN WNAUC0 BidMenu
		IF~~THEN REPLY ~I'm not here to buy. I'm here for the shield—and none of you are leaving with it.~ EXTERN WNAUC1 NecroPath.02
		IF~~THEN REPLY ~Just here to watch. Please, continue.~ EXTERN WNAUC0 NecroPath.03
		
CHAIN WNAUC0 NecroPath.01
~We are at six-thousand gold. I trust that you are informed on the nature of the auction? We have a shield of great value ~
	END
		IF~~THEN REPLY ~The Helmite shield? Yes, I wish to make a bid.~ DO ~SetGlobal("WNAucPlayerBid","GLOBAL",0)~ EXTERN WNAUC0 BidMenu
		IF~~THEN REPLY ~I'm not here to buy. I'm here for the shield—and none of you are leaving with it.~ EXTERN WNAUC1 NecroPath.02
		IF~~THEN REPLY ~I'm just here to watch. Please, continue.~ EXTERN WNAUC0 NecroPath.03
		
CHAIN WNAUC0 BidMenu
~Very well, my <PRO_LADYLORD>. What will your bid be?~
    END
        IF~PartyGoldGT(6000) GlobalLT("WNAucPlayerBid","GLOBAL",6001)~THEN REPLY ~Six-thousand-and-one.~ DO ~SetGlobal("WNAucPlayerBid","GLOBAL",6001)~ EXTERN WNAUC0 Bid01
        IF~PartyGoldGT(6999) GlobalLT("WNAucPlayerBid","GLOBAL",7000)~THEN REPLY ~Seven-thousand.~ DO ~SetGlobal("WNAucPlayerBid","GLOBAL",8200)~ EXTERN WNAUC0 Bid02
        IF~PartyGoldGT(7499) GlobalLT("WNAucPlayerBid","GLOBAL",7500)~THEN REPLY ~Seven-thousand-five-hundred.~ DO ~SetGlobal("WNAucPlayerBid","GLOBAL",8200)~ EXTERN WNAUC0 Bid03 // This would be 7500 but Neveau Noble bids 8200
        IF~PartyGoldGT(7999) GlobalLT("WNAucPlayerBid","GLOBAL",8000)~THEN REPLY ~Eight-thousand.~ DO ~SetGlobal("WNAucPlayerBid","GLOBAL",8000)~ EXTERN WNAUC0 Bid04
        IF~PartyGoldGT(8499) GlobalLT("WNAucPlayerBid","GLOBAL",8500)~THEN REPLY ~Eight-thousand-five-hundred.~ DO ~SetGlobal("WNAucPlayerBid","GLOBAL",8500)~ EXTERN WNAUC0 Bid05
        IF~PartyGoldGT(8999) GlobalLT("WNAucPlayerBid","GLOBAL",9000)~THEN REPLY ~Nine-thousand.~ DO ~SetGlobal("WNAucPlayerBid","GLOBAL",9000)~ EXTERN WNAUC0 Bid06
        IF~PartyGoldGT(9999) GlobalLT("WNAucPlayerBid","GLOBAL",10000)~THEN REPLY ~Ten-thousand.~ DO ~SetGlobal("WNAucPlayerBid","GLOBAL",10000)~ EXTERN WNAUC2 Bid07
        IF~!Global("WN50kBid","GLOBAL",1)~THEN REPLY ~Fifty-thousand!~ DO ~SetGlobal("WN50kBid","GLOBAL",1)~ EXTERN WNAUC0 Bid50k
        IF~~THEN REPLY ~On second thought, I don't actually have any money.~ EXTERN WNAUC0 NecroPath.03

CHAIN WNAUC0 Bid01
~A BOLD strategy! Will anyone stand up to the challenge?~
	== WNAUC2 ~Six-thousand-and-one? How quaint. Did your nursemaid teach you to haggle?~
	== WNAUC1 ~*snicker*~
	== WNAUC3 ~Shut up! Six-thousand-seven-hundred!~
	== WNAUC0 ~What a dynamic! Things are getting heated now—will anyone contest it?~
	END
		IF~~THEN REPLY ~Fine, time for a real bid.~ EXTERN WNAUC0 BidMenu
		IF~~THEN REPLY ~Nope, I've had my fun. Everyone out! Now!~ EXTERN WNAUC1 NecroPath.02
		IF~~THEN REPLY ~I've decided to end my auctioning career early, actually.~ EXTERN WNAUC0 NecroPath.03
		
CHAIN WNAUC0 Bid02
~We have SEVEN-THOUSAND! The stakes are getting hefty here tonight, my friends. Will ANYONE contest it?~
	== WNAUC1 ~I doubt a low-life like yourself even has such coin, but even so... I bid eight-thousand!~
	== WNAUC4 ~Eighty-two-hundred.~
	== WNAUC1 ~Bah...! Take the damn thing, then.~
	== WNAUC2 ~Out so easily? I expected more from you and your bluster.~
	== WNAUC0 ~Eight-thousand-two-hundred gold from our lady in red. Will anyone outbid her?~
	END
		IF~~THEN REPLY ~With pleasure.~ EXTERN WNAUC0 BidMenu
		IF~~THEN REPLY ~That's it. This auction is over!~ EXTERN WNAUC1 NecroPath.02
		IF~~THEN REPLY ~I'll sit out, thanks.~ EXTERN WNAUC0 NecroPath.03
		
CHAIN WNAUC0 Bid03
~A bold move! Seventy-five-hundred gold on the line for this artifact tonight! Will anyone outbid this <PRO_RACE>?~
	== WNAUC3 ~... Hmph.~
	== WNAUC1 ~I doubt a low-life like yourself even has such coin, but even so... I bid eight-thousand!~
	== WNAUC4 ~Eighty-two-hundred.~
	== WNAUC1 ~Bah...! Take the damn thing, then.~
	== WNAUC2 ~Out so easily? I expected more from you and your bluster.~
	== WNAUC0 ~Eight-thousand-two-hundred gold from our lady in red. Will anyone outbid her?~
	END
		IF~~THEN REPLY ~With pleasure.~ EXTERN WNAUC0 BidMenu
		IF~~THEN REPLY ~That's it. This auction is over!~ EXTERN WNAUC1 NecroPath.02
		IF~~THEN REPLY ~I'll sit out this one.~ EXTERN WNAUC0 NecroPath.03	
		
CHAIN WNAUC0 Bid04
~A thunderous bid from our newcomer! Will anyone match <PRO_HISHER> bid?~
	== WNAUC1 ~What a racket. I doubt <PRO_HESHE> even has that much gold!~
	== WNAUC0 ~Everything will be accounted for after the dealings.~
	== WNAUC2 ~Fine way of saying this thing was rigged from the get-go...~
	== WNAUC0 ~*ahem* Will ANYONE bid higher than our newcomer?~
	== WNAUC4 ~Eighty-two-hundred.~
	== WNAUC0 ~Eight-thousand-two-hundred gold from our lady in blue! Will anyone outbid her?~
	END
		IF~~THEN REPLY ~I'm not out yet.~ EXTERN WNAUC0 BidMenu
		IF~~THEN REPLY ~Okay, I'm done playing about. Everyone out!~ EXTERN WNAUC1 NecroPath.02
		IF~~THEN REPLY ~I'm afraid not.~ EXTERN WNAUC0 NecroPath.03
	
CHAIN WNAUC0 Bid05
~Eight-thousand-five-hundred, everyone. Our most impressive bid of the night... Will anyone contest it?~ 
	== WNAUC1 ~Bah. This isn't worth my time.~
	== WNAUC3 ~I... no, I'll pass.~ EXTERN WNAUC0 BidWon

CHAIN WNAUC0 Bid06
~NINE-THOUSAND GOLD! Unbelievable. Yes, looking around the room, I do see eyes absolutely FLOODED with disbelief. That's what it's all about, folks. Nine-thousand, going once... twice...~
	== WNAUC1 ~Ridiculous. Who comes to an auction and acts this way?~
	== WNAUC3 ~I think I... I must pass, as dashing as the piece would look atop my wall.~
	== WNAUC4 ~Mm. Fine.~ EXTERN WNAUC0 BidWon
	
	
CHAIN WNAUC2 Bid07
~You don't have that much money! That's outrageous.~
    == WNAUC3 ~Do us all a favor and hand over your estate next, darling.~
    == WNAUC1 ~This is absurd. No one here actually believes this, do they?~
    == WNAUC4 ~...Ten thousand. Hm.~
    == WNAUC0 ~Please, friends, if there is foul play then I assure you that I am well equipped to handle it. When we walked in here today we all agreed to take one another at their word. Ten-thousand, going once... twice...~
    == WNAUC1 ~What a farce...~ EXTERN WNAUC0 BidWon

CHAIN WNAUC0 Bid50k
~You... what?~
	== WNAUC3 ~Stop playing games. We're here as respectable business-folk, not children wasting each other's time.~
	== WNAUC2 ~You think you're some kind of jester? Get out of here!~
	== WNAUC0 ~Uhm, well if you have such coin, we would of course welcome it, though if you cannot provide sufficient evidence, then I'm afraid your bid is invalid.~
	END
		IF~PartyGoldGT(50000)~THEN REPLY ~No need. Here's the gold.~ EXIT
		IF~~THEN REPLY ~Very well. I will place a more reasonable bid.~ EXTERN WNAUC0 BidMenu
		IF~~THEN REPLY ~In that case, I'll just watch.~ EXTERN WNAUC0 NecroPath.03

CHAIN WNAUC0 BidWon
~SOLD, to our newcomer! Please, let us discuss the details when you have a moment. This is a VERY happy day for you, I'm sure.~ DO ~SetGlobal("WNAuctionDone","GLOBAL",1)~
	== WNAUC1 ~And for no one else!~
	== WNAUC3 ~Oh, you're ALWAYS a sore loser. Maybe come with some more of daddy's money next time, hm?~
	== AJANTJ IF ~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS")~ THEN ~Disgraceful. These men and women ought to be reported to the authorities for trading so flippantly in holy artifacts... but I suppose we are now no better than them. Pfeh.~
	== ALORAJ IF ~InParty("ALORA") IsValidForPartyDialogue("ALORA")~ THEN ~Aw, man. We should've just stolen it. Bye bye, gold...~
	== SKIEJ IF ~InParty("SKIE") IsValidForPartyDialogue("SKIE")~ THEN ~I've witnessed more thrilling scenes at charity galas. I HATE charity galas.~
	== CORANJ IF ~InParty("CORAN") IsValidForPartyDialogue("ALORA")~ THEN ~I hope that you somehow manage to reconcile the absurd amount of gold you just spent on this trinket, <CHARNAME>.~
	== KIVANJ IF ~InParty("KIVAN") IsValidForPartyDialogue("KIVAN")~ THEN ~So much posturing over coin and appearance. Truly, this the city at its lowest.~
	== IMOEN IF ~InParty("IMOEN") IsValidForPartyDialogue("IMOEN")~ THEN ~Wow. Auctions are boring!~
	EXIT

CHAIN WNAUC1 NecroPath.02
~Huh? What is this, some kind of extortion? You think you can just waltz in and—?~
	== WNAUC3 ~*sigh* Must we play at intrigue with peasants waving swords? Have them removed. Guards? GUARDS?~
	== WNAUC2 ~Don't call the guards, you imbecile! The less attention drawn to us, the better.~
	== WNAUC1 ~What if they're with the Flaming Fist? Or here to rob us? Gods, we—we should get out of here. Now.~
	== WNAUC4 ~...I don't want to die.~
	== WNAUC0 ~Please, if everyone could keep their heads, I'm sure we can sort all of this out—~
	== WNAUC3 ~Run for it!~	
	DO ~ActionOverride("wnauc1",EscapeArea())
	ActionOverride("wnauc2",EscapeArea())
	ActionOverride("wnauc3",EscapeArea())
	ActionOverride("wnauc4",EscapeArea())
	SetGlobal("WNAuctionDone","GLOBAL",3)~
	EXIT

CHAIN WNAUC0 NecroPath.03
~Very well! Any more offers?~
	== WNAUC2 ~Let's get this over with. Eight-thousand-five-hundred!~
	== WNAUC1 ~Bah! Typical.~
	== WNAUC0 ~We have eight-thousand-five-hundred! Any who dare challenge?~
	== WNAUC4 ~Eight-thousand-seven-hundred.~
	== WNAUC0 ~There it is! Going once... twice... and SOLD to our lady in red!~
	== WNAUC3 ~Let’s hope you enjoy it more than the last trinket you overspent for, hm?~
	== WNAUC0 ~Congratulations, my lady. And to the rest—better luck next time, should there be one. Please, enjoy the wine while I sort out this paperwork.~
	== WNAUC4 ~Oh, we will. We will indeed.~
	== SHARTJ IF ~InParty("SHARTEEL") IsValidForPartyDialogue("SHARTEEL")~ THEN ~Let's just gut them all and get what we came for.~
	DO ~SetGlobal("WNAuctionDone","GLOBAL",2)~ EXIT

// PLAYER WON THE AUCTION 

CHAIN IF WEIGHT #-1 ~Global("WNAuctionDone","GLOBAL",1)~THEN WNAUC0 AuctionWon.00
~It is rare to see a newcomer at one of these events. Watching you stun the others was quite the spectacle— I do hope you return for another auction, should your coinpurse allow.~
	END
		IF~~THEN REPLY ~Just give me the shield and I'll be on my way.~ EXTERN WNAUC0 AuctionWon.01
		IF~~THEN REPLY ~Seeing those nobles squirm with discomfort made this entire debacle worth it.~ EXTERN WNAUC0 AuctionWon.02
		IF~~THEN REPLY ~Perhaps I will. It was quite envigorating.~ EXTERN WNAUC0 AuctionWon.03
		IF~~THEN REPLY ~Don't count on it.~ EXTERN WNAUC0 AuctionWon.04
		
CHAIN WNAUC0 AuctionWon.01
~All that we have to do is discuss the matter of payment. Most of the time we settle payments on the spot, but given that you are new, I will be happy to make an exception should you need to withdraw funds to finalize your purchase.~
	END
		IF ~PartyGoldGT(8499)Global("WNAucPlayerBid","GLOBAL",8500)~ THEN REPLY ~Very well. Here is the 8500 gold I owe for the shield.~ EXTERN WNAUC0 AuctionWon.85k
		IF ~PartyGoldGT(8999)Global("WNAucPlayerBid","GLOBAL",9000)~ THEN REPLY ~9000, was it? Here you go.~ EXTERN WNAUC0 AuctionWon.9k
		IF ~PartyGoldGT(9999)Global("WNAucPlayerBid","GLOBAL",10000)~ THEN REPLY ~10,000 gold, I believe? Here you go.~ EXTERN WNAUC0 AuctionWon.10k
		IF~~THEN REPLY ~As you say. I will return shortly.~ DO ~SetGlobal("WNAuctionWonReturn","GLOBAL",1)~ EXIT

CHAIN WNAUC0 AuctionWon.02
~I must admit to have rather enjoyed it myself, though perhaps that's just the exhileration of having a high bidder in the house!~ EXTERN WNAUC0 AuctionWon.01

CHAIN WNAUC0 AuctionWon.03
~Indeed! A few of those you see around you have been attending these events monthly for several years now. There's something to be said for the thrill!~ EXTERN WNAUC0 AuctionWon.01

CHAIN WNAUC0 AuctionWon.04
~As you wish. I will count myself glad for having made your acquaintance and call it at that.~ EXTERN WNAUC0 AuctionWon.01

CHAIN WNAUC0 AuctionWon.85k
~Excellent. I will sort the paperwork on my end over the coming days and inform Boa of the purchase. Thank you for your patronage, friend. Who's joining me for drinks? My throat's parched.~
DO ~TakePartyGold(8500) 
	GiveItem("WNAJSH",player1)
	ActionOverride("wnauc0",EscapeArea())
	ActionOverride("wnauc1",EscapeArea())
	ActionOverride("wnauc2",EscapeArea())
	ActionOverride("wnauc3",EscapeArea())
	ActionOverride("wnauc4",EscapeArea())
	AddJournalEntry(@112, QUEST)~
	EXIT
	
CHAIN WNAUC0 AuctionWon.9k
~Excellent. I truly do hope to see you here again, friend. We could use more willing spenders thrown in the ring. Ah, well... enjoy your purchase! Who's joining me for drinks? My throat's parched.~
DO ~TakePartyGold(9000) 
	GiveItem("WNAJSH",player1)
	ActionOverride("wnauc0",EscapeArea())
	AddJournalEntry(@112, QUEST)~
	EXIT

CHAIN WNAUC0 AuctionWon.10k
~Done and done. We are MOST grateful for your generous spending, friend. I shan't bother you a moment longer but to once again say thank you. Enjoy your purchase! Come, everyone, let's get drinks!~
DO ~TakePartyGold(10000) 
	GiveItem("WNAJSH",player1)
	ActionOverride("wnauc0",EscapeArea())
	ActionOverride("wnauc1",EscapeArea())
	ActionOverride("wnauc2",EscapeArea())
	ActionOverride("wnauc3",EscapeArea())
	ActionOverride("wnauc4",EscapeArea())
	AddJournalEntry(@112, QUEST)~
	EXIT

CHAIN IF~Global("WNAuctionWonReturn","GLOBAL",1)~ THEN WNAUC0 AuctionWonReturn.01
~You return! Are you ready to discuss finalizing the purchase of your latest acquisition?~
	END
		IF ~PartyGoldGT(8499)Global("WNAucPlayerBid","GLOBAL",8500)~ THEN REPLY ~Here is the 8500 gold I owe for the shield.~ EXTERN WNAUC0 AuctionWon.85k
		IF ~PartyGoldGT(8999)Global("WNAucPlayerBid","GLOBAL",9000)~ THEN REPLY ~9000, was it? Here you go.~ EXTERN WNAUC0 AuctionWon.9k
		IF ~PartyGoldGT(9999)Global("WNAucPlayerBid","GLOBAL",10000)~ THEN REPLY ~10,000 gold, I believe? Here you go.~ EXTERN WNAUC0 AuctionWon.10k
		IF~~THEN REPLY ~I need a little more time. I'll return shortly.~ EXIT

// PLAYER CRASHED THE AUCTION

CHAIN IF WEIGHT #-1 ~Global("WNAuctionDone","GLOBAL",3)~THEN WNAUC0 AuctionCrashed.00
~Please, my <PRO_LADYLORD>, whatever it is you are here for, I-I'm sure that we can make an arrangement.~
	END
		IF~~THEN REPLY ~Name a price for the shield and I'll pay it.~ EXTERN WNAUC0 AuctionCrashed.01
		IF~~THEN REPLY ~I'm with the Flaming Fist. I'll need to confiscate the shield.~ EXTERN WNAUC0 AuctionCrashed.02
		IF~~THEN REPLY ~This shield was acquired wrongfully. I'm going to need it back.~ EXTERN WNAUC0 AuctionCrashed.03
		IF~~THEN REPLY ~Give me the shield and I won't butcher you where you stand.~ EXTERN WNAUC0 AuctionCrashed.04

CHAIN WNAUC0 AuctionCrashed.01
~After scaring away all the other attendees? Not usually how business is done but I'm sure I can make an exception for one as, ah, well-armed as yourself.~ EXTERN WNAUC0 AuctionCrashed.05

CHAIN WNAUC0 AuctionCrashed.02
~If you were truly with the Fist you would have come in here and arrested everyone on the spot. No, I think you'd best just be honest so we can work out a deal that benefits the both of us.~ EXTERN WNAUC0 AuctionCrashed.05

CHAIN WNAUC0 AuctionCrashed.03
~Wrongfully? If I do not have faulty information—which I never do—then this artifact was sold willingly and with all the proper documentation and payment. I think you'll find any potential issues with its acquisition to falter before the courts.~ EXTERN WNAUC0 AuctionCrashed.05

CHAIN WNAUC0 AuctionCrashed.05
~As a special case, just for you, I shall depart with the shield for a matter of seven thousand gold. I think you'll find it to be more than fair.~
	END
		IF~PartyGoldGT(6999)~THEN REPLY ~Fine. Take it and let's be done with this.~ EXTERN WNAUC0 AuctionCrashed.06
		IF~PartyGoldGT(5999)~THEN REPLY ~I'll do six-thousand and not a copper more.~ EXTERN WNAUC0 AuctionCrashed.07
		IF~~THEN REPLY ~Give me the shield and I won't tell the Flaming Fist that you're holding illegal auctions.~ EXTERN WNAUC0 AuctionCrashed.08
		IF~~THEN REPLY ~Your head will depart from your body if you don't give me the shield now!~ EXTERN WNAUC0 AuctionCrashed.04
		IF~~THEN REPLY ~I don't have that much money.~ EXTERN WNAUC0 AuctionCrashed.09

CHAIN WNAUC0 AuctionCrashed.06
~A... pleasure doing business with you. No need for paperwork, I'm sure you're a busy <PRO_MANWOMAN>. Please, enjoy your purchase!~
DO ~GiveItem("WNAJSH",player1) 
	ActionOverride("wnauc0",EscapeArea())
	AddJournalEntry(@112, QUEST)~ 
	EXIT
	
CHAIN WNAUC0 AuctionCrashed.07
~Fine. So long as you leave the events of this <DAYNIGHTALL> out of any Flaming Fist reports, hm? The last thing we need is more eyes. Now that our business is concluded, I hope you enjoy your purchase. I'll be going now.~
DO ~GiveItem("WNAJSH",player1) 
	ActionOverride("wnauc0",EscapeArea())
	AddJournalEntry(@112, QUEST)~ 
	EXIT
	
CHAIN WNAUC0 AuctionCrashed.08
~The Flaming Fist are likely well aware of master Boa's operations, both below the city and above. That being said...~
END
IF ~OR(2) CheckStatGT(Player1,15,STR) CheckStatGT(Player1,15,CHR)~ THEN EXTERN WNAUC0 Intimidated
IF ~OR(2) !CheckStatGT(Player1,15,STR) !CheckStatGT(Player1,15,CHR)~ THEN EXTERN WNAUC0 Steadfast

CHAIN WNAUC0 Intimidated
~Hm. I would not be surprised if they launched some kind of performative investigation if one such as yourself brought the matter before them. Very well, you shall have your shield, but do not expect any reasonable businessman in the greater region to look upon you fondly for this.~
DO ~GiveItem("WNAJSH",player1) 
	ActionOverride("wnauc0",EscapeArea())
	AddJournalEntry(@112, QUEST)~ 
	EXIT
	
CHAIN WNAUC0 Steadfast
~No, I doubt that anyone in the compound would even take your complaints seriously. I shan't be departing with the shield unless it is paid for.~ EXTERN WNAUC0 AuctionCrashed.05

CHAIN WNAUC0 AuctionCrashed.04
~Ah, w-well, of course. Well, here you go—all yours! Isn't it shiny? I'll be going now. Goodbye!~
DO ~GiveItem("WNAJSH",player1) 
	ReputationInc(-2)
	ActionOverride("wnauc0",EscapeArea())
	AddJournalEntry(@112, QUEST)~ 
	EXIT
		
CHAIN WNAUC0 AuctionCrashed.09
~What a mess... I shall be here a short while longer, so should you decide that you've scrounged up the coin, return to me—but do not tarry!~
DO ~SetGlobal("WNCantAffordAuc","GLOBAL",1)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("WNCantAffordAuc","GLOBAL",1)~ THEN WNAUC0 PricyReturn.00
~Hello, again. Have you decided to purchase the shield after all? It will be... difficult to return to master Boa without a completed sale.~
	END
		IF~PartyGoldGT(6999)~THEN REPLY ~Fine. Take it and let's be done with this.~ EXTERN WNAUC0 AuctionCrashed.06
		IF~PartyGoldGT(5999)~THEN REPLY ~I'll do six-thousand and not a copper more.~ EXTERN WNAUC0 AuctionCrashed.07
		IF~~THEN REPLY ~Give me the shield and I won't tell the Flaming Fist that you're holding illegal auctions.~ EXTERN WNAUC0 AuctionCrashed.08
		IF~~THEN REPLY ~Your head will depart from your body if you don't give me the shield now!~ EXTERN WNAUC0 AuctionCrashed.04
		IF~~THEN REPLY ~I don't have that much money.~ EXTERN WNAUC0 AuctionCrashed.09
		
// PLAYER LOST THE AUCTION
		
CHAIN IF WEIGHT #-1~Global("WNAuctionDone","GLOBAL",2)~ THEN WNAUC0 Loser.00
~Tough luck, friend. Maybe next time, eh?~
EXIT