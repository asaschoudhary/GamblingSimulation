#!/bin/bash
echo "Welcome Gambling simulation"
#We are taking two constant varible
stake=100
bet=1
#Variable
win=0
loss=1
half=$(($stake/2))
full=$(($half+stake))
while((half<stake && full>stake))
do
	#Generate the random value
	checkRandom=$(($RANDOM%2))
	case $checkRandom in
		0)
			stake=$((stake+bet))
			((win++))
			;;
		1)
			stake=$((stake-bet))
			((loss++))
			;;
	esac
done
echo $stake
