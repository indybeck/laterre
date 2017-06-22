docker run -d --name hdfs-namenode \
    -h hdfs-namenode -p 50070:50070 \
    gelog/hadoop hdfs namenode && \
docker logs -f hdfs-namenode
