#!/bin/bash
#

start=$(date +%s)
echo $start > run.log
influx_inspect='docker run --rm -v /mnt/data/influxdb:/var/lib/influxdb -w /var/lib/influxdb influxdb:alpine influx_inspect'
$influx_inspect export -database graphite -datadir /var/lib/influxdb/data -waldir /var/lib/influxdb/wal -out ./datapipe $1 
end=$(date +%s)
echo $end >> run.log
diff=$(( $end - $start ))
echo "Elapsed time: " $diff >> run.log

