#!/bin/bash

index="/sys/class/backlight/intel_backlight"

nowIndex=${index}/brightness
maxIndex=${index}/max_brightness

printf "Current Brightness is "
cat $nowIndex

echo "Input New Brightness"
read newBrightness

maxBrightness=`cat $maxIndex`
minBrightness=1

if [ $newBrightness -gt $maxBrightness ]
then
	newBrightness=$maxBrightness
fi

if [ $newBrightness -lt $minBrightness ]
then
	newBrightness=$minBrightness
fi

#PASSWD Is Your Root Password, Change it
echo "PASSWD"|sudo -S sh -c "echo $newBrightness > $nowIndex"