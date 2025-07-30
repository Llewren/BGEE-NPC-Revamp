BEGIN WNAUC1

// Won Auction

CHAIN IF ~Global("WNAuctionDone","GLOBAL",1)~ THEN WNAUC1 WonAuction1
~Congratulations, stranger. You and your benefactor's coin have won out this day, but should I see you again... well, let's just say I'm not above a little fisticuffs!~
	== RASAADJ IF ~InParty("RASAAD") IsValidForPartyDialogue("RASAAD")~ THEN ~You may not like where that line of thinking takes you in life, friend.~
	EXIT
	
// Lost Auction

CHAIN IF ~Global("WNAuctionDone","GLOBAL",2)~ THEN WNAUC1 LostAuction1
~That contemptuous harpy always bids higher than me. One wonders where she gets the money!~
	== SHARTJ IF ~InParty("SHARTEEL") IsValidForPartyDialogue("SHARTEEL")~ THEN ~Likely by some more respectable means than you, scum.~
	EXIT