#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the rotLeft function below.
def rotLeft(a, d):
    #print("a={}".format(a))
    
    new_a = [None for i in a]
    #print("new_a={}".format(new_a))
    min_rotation = d % len(a)
    #print("min_rotation={}".format(min_rotation))
    
    idx = 0
    for v in a:
        new_idx = idx-min_rotation if idx-min_rotation >=0 else len(a)+(idx-min_rotation)
        #print("{} to {}".format(idx, new_idx))
        new_a[new_idx]= a[idx]
        #print("new_a={}".format(new_a))
        idx = idx + 1
        
    return new_a
    

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    nd = input().split()

    n = int(nd[0])

    d = int(nd[1])

    a = list(map(int, input().rstrip().split()))

    result = rotLeft(a, d)

    fptr.write(' '.join(map(str, result)))
    fptr.write('\n')

    fptr.close()
