hadoop/hadoop-3.2.1/bin/mapred streaming\ 
-D stream.num.map.output.key.fields=2\ 
-D mapred.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator\ 
-D mapred.text.key.comparator.options=-k2,2nr\ 
-input /user/peifeng/output\ 
-output /user/peifeng/output2\ 
-mapper cat\  
-reducer cat\ 

hadoop/hadoop-3.2.1/bin/hdfs dfs -get /user/peifeng/output/part-00000
