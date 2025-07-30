BEGIN WNCOM3

CHAIN IF~NumTimesTalkedTo(0)~THEN WNCOM3 Talk1
~Helm... guide my steps as I walk this uncertain path. Shield my family from harm and grant me the strength to endure these trials...~
EXIT

CHAIN IF~NumTimesTalkedTo(1)~THEN WNCOM3 Talk2
~...May your vigilant gaze protect my daughter, now and always...~
EXIT

CHAIN IF~NumTimesTalkedToGT(1)~THEN WNCOM3 Talk3
~Excuse me. I'm in the middle of prayer.~
EXIT