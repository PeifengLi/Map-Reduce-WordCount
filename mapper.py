#!/usr/bin/env python3
# reading entire line from STDIN (standard input)
import sys
for line in sys.stdin:
    line = line.strip()
    line = line.lower()
    words = line.split()
    for word in words:
        print('%s\t%s' % (word, 1))