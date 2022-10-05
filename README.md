# CS645 Advanced Database Systems
We will going to perform simple MapReduce job using hadoop streaming. There will be two experiments in this MapReduce task. A sample utf-8 format ebook was stored in the input folder and named input.txt.

## Experiment 1
Execute the WordCount Job including sorting the result into one file. ```mapper.py``` and ```swaper.py``` were used in this case.

## Experiment 2
Revise the WordCount Job to sort the words in descending order by count. Be sure to produce one file as a result with the keyword and a positive count sorted in descending order by count. 

- Option 1 : ```mapper.py``` and ```swaper.py``` were used and it gives me the correct result. swaper.py is a slightly modified reducer where I add a sort method at the end of the reducer. 
- Option 2: ```mapper.py``` and ```reducer.py``` were used and it gives me the correct result too. And I use hadoop streaming twice, the first hadoop streaming I used ```mapper.py``` and ```reducer.py``` and for the second hadoop streaming I use ```/bin/cat``` as both mapper and reducer.
