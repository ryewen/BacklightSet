#!/bin/bash

index="/sys/class/backlight/intel_backlight"

nowIndex=${index}/brightness
maxIndex=${index}/max_brightness

nowBrightness=`cat $nowIndex`
maxBrightness=`cat $maxIndex`

newBrightness=$[nowBrightness + 20]

if [ $newBrightness -gt $maxBrightness ]
then
	newBrightness=$maxBrightness
fi

#PASSWD Is Your Root Password, Change it
echo "PASSWD"|sudo -S sh -c "echo $newBrightness > $nowIndex"

