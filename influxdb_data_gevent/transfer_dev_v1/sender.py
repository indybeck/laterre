import os
import gevent
from gevent.queue import Queue
import time
CLEANUP=True
tasks = Queue()

def influx_export(fifo, task):
    influx_export_cmd = "docker run --rm -v /mnt/data/influxdb:/var/lib/influxdb -w /var/lib/influxdb influxdb:alpine influx_inspect export"
    influx_options = "-database graphite -datadir /var/lib/influxdb/data -waldir /var/lib/influxdb/wal"
    influx_out =  "-out {0}".format(fifo)
    influx_task = task
    cmd = "{0} {1} {2} {3}".format(influx_export_cmd, influx_options, influx_out, influx_task)
    print cmd
    time.sleep(20)
    

def get_fifo():
    while True:
      if len(fifos) > 0:
        return fifos.pop()
      else:
        time.sleep(3)
    

def worker(n):
    while not tasks.empty():
        #task = tasks.get()
        task = tasks.get_nowait()
	print fifos
        print('Worker %s got a task'  % (n))
        fifo = get_fifo()
        influx_export(fifo, task)
        fifos.add(fifo)
        gevent.sleep(0)
     
    print("Quiting time!")


def boss():
    with open("timeranges", "rb") as f:
        for line in f:
            tasks.put_nowait(line) 

def make_fifo(fifo_name):
    try:
        os.mkfifo(fifo_name)
    except:
        pass

def remove_fifo(fifo_name):
    os.remove(fifo_name)

# main
fifos = set()
for x in range(5):
    spx_fifo = "/tmp/spx{0}.fifo".format(x)
    make_fifo(spx_fifo)
    fifos.add(spx_fifo)

print fifos
gevent.spawn(boss).join()
gevent.joinall([
    gevent.spawn(worker, 'worker1'),
    gevent.spawn(worker, 'worker2'),
    gevent.spawn(worker, 'worker3'),
    gevent.spawn(worker, 'worker4'),
    gevent.spawn(worker, 'worker5'),
    gevent.spawn(worker, 'worker6'),
])

# cleanup 
if CLEANUP:
   for path in fifos:
      remove_fifo(path)


