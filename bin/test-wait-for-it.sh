#!/bin/bash
compose_file=/etc/spx/metrics/docker-compose.yml
waitforit="/usr/local/bin/wait-for-it.sh"

wait()
{
  for h in $HOSTS; do
    res=9999
    while [ $res != 0 ]; do
      #echo $res
      $waitforit $h:$PORT
      res=$?
    done
  done
}

start_service()
{
  docker-compose -f $compose_file up -d $1
}

start()
{
  start_service zoo
  HOSTS="node-1 node-2 node-3" PORT=2181 wait
  start_service clickhouse
  HOSTS="node-1 node-2 node-3" PORT=8123 wait
  start_service graphouse
}

start
