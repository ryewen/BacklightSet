#!/bin/bash

index="/sys/class/backlight/intel_backlight"

nowIndex=${index}/brightness

nowBrightness=`cat $nowIndex`

newBrightness=$[nowBrightness - 20]

minBrightness=1

if [ $newBrightness -lt $minBrightness ]
then
	newBrightness=$minBrightness
fi

#PASSWD Is Your Root Password, Change it
echo "PASSWD"|sudo -S sh -c "echo $newBrightness > $nowIndex"