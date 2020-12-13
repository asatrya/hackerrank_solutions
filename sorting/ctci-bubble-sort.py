#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the countSwaps function below.
def countSwaps(a):
    count_swap = 0
    for i in range(0, len(a)-1):
        for j in range(0, len(a)-1-i):
            if a[j] > a[j+1]:
                temp = a[j]
                a[j] = a[j+1]
                a[j+1] = temp
                count_swap = count_swap + 1
        #print("a={}, count_swap={}".format(a, count_swap))
    print("Array is sorted in {} swaps.".format(count_swap))
    print("First Element: {}".format(a[0]))
    print("Last Element: {}".format(a[len(a)-1]))

if __name__ == '__main__':
    n = int(input())

    a = list(map(int, input().rstrip().split()))

    countSwaps(a)
