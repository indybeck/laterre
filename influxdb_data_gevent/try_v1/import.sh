#!/bin/bash
# $1 = /tmp/spx0.fifo
# $2 = ip address  (where graphouse is running)

sed -e '1,7d' -e 's/value=//g' -e 's/.\{9\}$//' <$1 | nc $2 2003
