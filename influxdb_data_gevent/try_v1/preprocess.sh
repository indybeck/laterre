#!/bin/bash
#

influx_inspect='docker run --rm -v /mnt/data/influxdb:/var/lib/influxdb -w /var/lib/influxdb influxdb:alpine influx_inspect'
influx_find='docker run --rm -v /mnt/data/influxdb:/var/lib/influxdb -w /var/lib/influxdb influxdb:alpine find'
influx_data='data/graphite/default'
influx_dumptsm_info='dumptsm.info'

for tsmfile in $($influx_find $influx_data -name '*.tsm' -print); do
	$influx_inspect dumptsm $tsmfile >> $influx_dumptsm_info
done

awk '/File:/ || /Time Range:/' $influx_dumptsm_info > tsm_summary.info
awk '/Time Range:/' tsm_summary.info | sed -e 's/Time Range: //g' | awk '{$1=$1;print}' | awk -F " - " '{ print "-start " $1 " -end " $2 }' > timeranges

while read line
do
	echo $line
done < timerange
