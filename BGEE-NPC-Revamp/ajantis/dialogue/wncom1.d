BEGIN WNCOM1

CHAIN IF~NumTimesTalkedTo(0)~THEN WNCOM1 Talk1
~It's not been easy, but Lady Teomara has taken good care of us.~
EXIT

CHAIN IF~NumTimesTalkedTo(1)~THEN WNCOM1 Talk2
~Most Helmites seem cold and distant, but they come through when you need them.~
EXIT

CHAIN IF~NumTimesTalkedTo(2)~THEN WNCOM1 Talk3
~We'll have a proper place to stay once the way to Blackgate opens up.~
DO ~SetNumTimesTalkedTo(0)~
EXIT
