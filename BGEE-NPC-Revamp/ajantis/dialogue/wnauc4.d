BEGIN WNAUC4

// After Winning:

CHAIN IF ~Global("WNAuctionDone","GLOBAL",1)~ THEN WNAUC4 WonAuction4
~You bid like a dairy farmer!~
	== MONTAJ IF ~InParty("MONTARON") IsValidForPartyDialogue("MONTARON")~ THEN ~How appropriate a barb from one so stuck up yer own arse as yerself!~
	EXIT

// After Losing:


CHAIN IF ~Global("WNAuctionDone","GLOBAL",2)~ THEN WNAUC4 LostAuction4
~All mine... all mine! I'll have it delivered to my estate. Gods forbid I walk out of here carrying that old hunk of metal!~
	== AJANTJ IF ~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS")~ THEN ~I'm afraid that shield belongs to the Church of Helm, ma'am.~
	== WNAUC4 IF ~InParty("AJANTIS") IsValidForPartyDialogue("AJANTIS")~ THEN ~Nope! Mine now.~	 
	EXIT