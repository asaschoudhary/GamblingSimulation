#!/bin/bash
echo "Welcome Gambling simulation"
#We are taking two constant varible
bet=1
#Variable
win=0
loss=0
for((day=1;day<=30;day++))
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
		 Array_profit[$count_win]=$day
		((count_win++))
	else
		stakeLoss=$((stake-temp))
		echo "$day- loss:$stakeLoss"
		Array_loss[$count_loss]=$day
		((count_loss++))
	fi
done
for value in ${Array_profit[@]}
do
echo $value "profit"
done
for value in ${Array_loss[@]}
do 
echo $value "loss"
done
