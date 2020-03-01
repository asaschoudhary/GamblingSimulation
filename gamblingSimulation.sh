#!/bin/bash
echo "Welcome Gambling simulation"
#Constant variable
bet=1
#We are taking Variable
win=0
loss=0
count=0
woncount=0
losscount=0
tempStake=$stake
for((day=1;day<=30;day++))
do
	stake=100
	#temp=$stake
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
			#Total maximum won and loss the amount for the day  
			case $stake in
				$full)
						echo "you won for a day:"
						echo "Total win amount:"$half
						tempStake=$((tempStake+half))
						stakeArray[$((count++))]=$tempStake
						((woncount++))
						;;
				$half)
						echo "you loss for a day:"
               	echo "Total loss  amount:"$half
               	tempStake=$((tempStake-half))
               	stakeArray[$((count++))]=$tempStake
               	((losscount++))
						;;
			esac
done

echo "number of day loss:" $losscount
echo "you lost by:" $((losscount*half))
echo "number of day won:" $woncount
echo "you won by:"$((woncount*half))
echo "${stakeArray[@]}"
#find the maximum won and loss
maximumWon=${stakeArray[1]}
maximumLoss=${stakeArray[1]}
for stake in ${stakeArray[@]}
do
	if(($stake>$maximumWon))
   then
    maximumWon=$stake
   elif (($stake<$maximumLoss))
   then
     maximumLoss=$stake
   fi
done
echo "you won maximum:"$maximumWon
echo "you loss maximum:" $maximumLoss
#check Luckiest day and unluckiest day
day=0
for day in ${!stakeArray[@]}
do
  if((${stakeArray[day]} == $maximumWon))
  then
     ((day++))
     echo "Luckiest day:"$day
	elif((${stakeArray[day]} == $maximumLoss))
  then 
      ((day++))
     echo "Unluckiest day:"$day
  fi
done

