BEGIN WNCOM2

CHAIN IF~NumTimesTalkedTo(0)~THEN WNCOM2 Talk1
~I'm tired...~
EXIT

CHAIN IF~NumTimesTalkedTo(1)~THEN WNCOM2 Talk2
~It's cold here. I wish there was a fireplace.~
EXIT

CHAIN IF~NumTimesTalkedTo(2)~THEN WNCOM2 Talk3
~Paladins are *booooring*!~
DO ~SetNumTimesTalkedTo(0)~
EXIT
