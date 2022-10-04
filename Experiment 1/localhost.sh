$HADOOP_HOME/bin/mapred streaming \
-input /user/peifeng/input \
-output /user/peifeng/output \
-mapper "bash -c \"python3 mapper.py\"" \
-reducer "bash -c \"python3 reducer.py\"" \
-file mapper.py \
-file reducer.py

$HDFS_HOME/bin/hdfs dfs -cat /output/part-00000
