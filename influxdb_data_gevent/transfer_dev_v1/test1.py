from multiprocessing import Process
import os
import subprocess

def print_head(i):
    switch='google.com'
    response = subprocess.call("ping -c 3 " + switch, shell=True)

processes = [Process(target=print_head, args=(i,)) for i in range(3)]
for process in processes:
    process.start()
