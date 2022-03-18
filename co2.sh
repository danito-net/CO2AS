#!/usr/bin/env bash

sudo /home/pi/CO2AS/led.sh

cd /home/pi/CO2AS

for (( ; ; ))
do

strRandom=$(tr -dc A-Za-z0-9 < /dev/urandom | head -c 9)
tmp1="/tmp/$strRandom.txt"

while [ -f $tmp1 ] ; do
   strRandom=$(tr -dc A-Za-z0-9 < /dev/urandom | head -c 9)
   tmp1="/tmp/$strRandom.txt"
done

python -m mh_z19 --all > $tmp1

data=$(cat $tmp1 | awk '{print $8 $10}' | awk -F\} '{print $1}')

# Dummy data (GPS not implemented yet in this first prototype
device="BD001"
label="Bandung"
latitude="-6.989562"
longitude="107.649681"
altitude="1200"
note="-"
status="0"

co2=$(echo $data | awk -F\, '{print $1}')
temp=$(echo $data | awk -F\, '{print $2}')

# echo $co2

# the CO2 gas concentration under 1000 ppm is fresh air
if [ "$co2" -lt "999" ] ; then
   green_led_on
   sleep 1
   green_led_off
fi

# the CO2 gas concentration with 2-3 persons in a room
if [ "$co2" -gt "1000" ] && [ "$co2" -lt "1100" ]; then
   blue_led_on
   sleep 1
   blue_led_off
fi

# the CO2 gas in the room is high, please open the window / door or bring the plants inside
if [ "$co2" -gt "1101" ] ; then
   red_led_on
   sleep 1
   red_led_off
fi

timestamp=$(date '+%Y-%m-%d %H:%M:%S')
epoch=$(date -d "$timestamp" +"%s")

# insert the sensor data from device to Astra DB
python3 insert-astra-db.py $epoch $device $label $latitude $longitude $altitude $co2 $temp $note $status

if [ -f $tmp1 ]; then rm -f $tmp1; fi

done
