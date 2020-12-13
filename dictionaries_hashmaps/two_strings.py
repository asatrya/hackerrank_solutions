#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the twoStrings function below.
def twoStrings(s1, s2):
    # create sets
    set_s1 = set([])
    set_s2 = set([])
    for c in s1:
        set_s1.add(c)
    for c in s2:
        set_s2.add(c)
    print("set_s1={}".format(set_s1))
    print("set_s2={}".format(set_s2))
    
    # find intersections
    s1_s2 = set_s1 & set_s2
    print("intersection s1 & s2={}".format(s1_s2))
    
    # output
    return 'YES' if len(s1_s2) > 0 else 'NO'
    

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    q = int(input())

    for q_itr in range(q):
        s1 = input()

        s2 = input()

        result = twoStrings(s1, s2)

        fptr.write(result + '\n')

    fptr.close()
