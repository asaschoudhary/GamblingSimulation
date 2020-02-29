#!/bin/bash
echo "Welcome Gambling simulation"
#We are taking two constant varible
bet=1
#Variable
win=0
loss=0
for((day=1;day<=20;day++))
do
	stake=100
	temp=$stake
	half=$(($stake/2))
	full=$(($half+stake))
	while((half<stake && full>stake))
	do
		#Generate the random value
		checkRandom=$((RANDOM%2))
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
	if(($temp<$stake))
	then
		stakeProfit=$((stake-temp))
		echo "$day- profit:$stakeProfit"
	else
		stakeLoss=$((stake-temp))
		echo "$day- loss:$stakeLoss"
	fi
done
