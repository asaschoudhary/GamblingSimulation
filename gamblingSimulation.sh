#!/bin/bash
echo "Welcome Gambling simulation"
#We are taking two constant varible
stake=100
bet=1
#Variable
win=0
loss=1
#Generate the random value
checkRandom=$(($RANDOM%2))
		
if ((checkRandom == win))
then
	echo "you stake is win"
	stake=$(($stake+$bet))
else
	echo "SORRY, You stake is loss"
	stake=$(($stake-$bet))
fi
echo $stake;





