hadoop/hadoop-3.2.1/bin/mapred streaming 
-input /user/peifeng/input\ 
-output /user/peifeng/output\ 
-mapper "bash -c \"python3 mapper.py\""\
-reducer "bash -c \"python3 swaper.py\""\ 
-file mapper.py\
-file swaper.py

hadoop/hadoop-3.2.1/bin/hdfs dfs -get /user/peifeng/output/part-00000
