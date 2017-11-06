#!/bin/bash
#

HOSTS="node-1 node-2 node-3"

for host in $HOSTS; do
    echo $host
    res=9999
    while [ $res != 0 ]; do
      echo $res
      ./wait-for-it.sh $host:2181
      res=$?
    done
done
