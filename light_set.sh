#!/bin/bash

index="/sys/class/backlight/intel_backlight"

nowIndex=${index}/brightness
maxIndex=${index}/max_brightness

printf "Current Brightness is "
nowBrightness=`cat $nowIndex`

maxBrightness=`cat $maxIndex`
minBrightness=1

nowScale=$(echo "scale=5; $nowBrightness / $maxBrightness" | bc)

echo $nowBrightness" "$nowScale

echo "Input New Brightness Scale"
newScale=0.5
read newScale

if [ $(echo "$newScale > 1" | bc) -eq 1 ]
then
	newScale=1
fi

if [ $(echo "$newScale <= 0.1" | bc) -eq 1 ]
then
	newScale=0.10
fi

newBrightness=$(echo "$maxBrightness * $newScale" | bc)
newBrightness=${newBrightness%.*}
echo $newBrightness" "$maxBrightness
#PASSWD Is Your Root Password, Change it
echo "123456"|sudo -S sh -c "echo $newBrightness > $nowIndex"
