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
