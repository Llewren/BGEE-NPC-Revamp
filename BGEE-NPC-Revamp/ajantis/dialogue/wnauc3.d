BEGIN WNAUC3

CHAIN IF ~Global("WNAuctionDone","GLOBAL",1)~ THEN WNAUC3 WonAuction3
~Well, well, I honestly wasn't expecting that. Congratulations, and all that. I'd offer you a drink, but I'll need the rest of the wine to recover from the indecency of... defeat.~
	EXIT

// Lost

CHAIN IF ~Global("WNAuctionDone","GLOBAL",2)~ THEN WNAUC3 LostAuction3
~This happens every time. Don't be hard on yourself.~
	== CORANJ IF ~InParty("CORAN") IsValidForPartyDialogue("CORAN")~ THEN ~How touching.~
	EXIT