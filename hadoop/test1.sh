docker run -ti --name namenode -h namenode -v $PWD/data:/data -p 50070:50070 gelog/hadoop:2.3.0 hdfs namenode -format /usr/local/hadoop/sbin/hadoop-daemon.sh start namenode
