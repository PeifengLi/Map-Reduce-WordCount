#!/usr/bin/env python

import sys
 
words = {}

# Reading in the mapper OR combiner output
for line in sys.stdin:
    line = line.split("\t")
 
    current_word, count = line
    try:
        count = int(count)
    except ValueError:
        continue

    # Splitting for word and count i.e. <word, 1>
    
    try:
        words[current_word] = words[current_word]+count
    except:
        words[current_word] = count

# Sorting and printing words and final counts
for word in sorted(words, key=words.get, reverse=True):
    print('%s\t%s'% (word, words[word]))