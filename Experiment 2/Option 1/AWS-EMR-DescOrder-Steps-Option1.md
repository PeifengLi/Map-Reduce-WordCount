# AWS EMR Python Job Guide - Descending Order By Value - Option 1 - Modified Reducer

## Step 1:  custom JAR
- JAR location: command-runner.jar
- Arguments: 
```bash
bash -c “aws s3 cp s3://mymapreducejob/code/swaper.py /home/hadoop;
chmod u+x /home/hadoop/mapper.py;
aws s3 cp s3://mymapreducejob/code/swaper.py /home/hadoop;
chmod u+x /home/hadoop/swaper.py”
```
- Action on failure : Continue

## Step 2: custom JAR
- JAR location: command-runner.jar
- Arguments: 
```bash
hadoop-streaming 
-D mapred.reduce.tasks=1 
-mapper /home/hadoop/mapper.py 
-reducer /home/hadoop/swaper.py 
-input s3://mymapreducejob/input/ 
-output s3://mymapreducejob/sortdesc/ 
-file /home/hadoop/mapper.py 
-file /home/hadoop/swaper.py
```
- Action on failure : Continue
