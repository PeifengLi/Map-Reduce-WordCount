# AWS EMR Python Job Guide - Descending Order By Value

## Step 1:  custom JAR
- JAR location: command-runner.jar
- Arguments: 
```bash
bash -c “aws s3 cp s3://mymapreducejob/code/mapper.py /home/hadoop;
chmod u+x /home/hadoop/mapper.py;
aws s3 cp s3://mymapreducejob/code/reducer.py /home/hadoop;
chmod u+x /home/hadoop/reducer.py”
```
- Action on failure : Continue

## Step 2: custom JAR
- JAR location: command-runner.jar
- Arguments: 
```bash
hadoop-streaming 
-mapper /home/hadoop/mapper.py
-reducer /home/hadoop/reducer.py
-input s3://mymapreducejob/input/
-output s3://mymapreducejob/intermediates/
-file /home/hadoop/mapper.py
-file /home/hadoop/reducer.py
```
- Action on failure : Continue

## Step 3: Streaming program
- Mapper /bin/cat
- Reducer org.apache.hadoop.mapred.lib.IdentityReducer
- Input s3: s3://mymapreducejob/intermediates/ 
- Output s3 s3://mymapreducejob/output/
- Arguments
```bash
-D mapred.reduce.tasks=1
```
- Action on failure : Continue

## Step 4: Streaming program
- Mapper /bin/cat
- Reducer /bin/cat
- Input s3: s3://mymapreducejob/output/ 
- Output s3 s3://mymapreducejob/descsort/
- Arguments:
```bash
hadoop-streaming 
-D stream.num.map.output.key.fields=2 
-D mapred.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator 
-D mapred.text.key.comparator.options=-k2,2nr 
-D mapred.reduce.tasks=1
```
- Action on failure : Continue

#### Notes:
1. ```-D stream.num.map.output.key.fields```: Specify how many fields as the key
2. ```-D mapred.output.key.comparator.class```:Use the library class, ```KeyFieldBasedComparator```, as the comparator, allowing the Map/Reduce framework to compare the map outputs based on certain key fields, not the whole keys.
3. ```-D mapred.text.key.comparator.options```: Specify the comparator rule -- ```-k2,2``` means sort the second field; ```n``` means in numerical order; ```r``` means reverse.
4. ```-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner```: Use the library class, ```KeyFieldBasedPartitioner```, as the Partitioner, allowing the Map/Reduce framework to partition the map outputs based on certain key fields, not the whole keys.
5. ```-D mapred.text.key.partitioner.options```: Specify the rule to partition the intermediate tuples.
6. ```-D stream.map.output.field.separator```: Specify your own separator between key and value.
7. ```-D mapred.reduce.tasks```: Specify the number of reducers.
8. ```-D mapred.map.tasks```: A hint to the number of mappers. If not work, we may want to change ```mapred.min.split.size in mapred-site.xml```.
