#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the hourglassSum function below.
def hourglassSum(arr):
    print("arr={}".format(arr))
    
    arr_width = len(arr[0])
    print("arr_width={}".format(arr_width))
    arr_height = len(arr)
    print("arr_height={}".format(arr_height))
    
    hourglass_capacity_x = arr_width - 3 + 1
    hourglass_capacity_y = arr_height - 3 + 1
    max_hourglass = hourglass_capacity_x * hourglass_capacity_y
    print("max_hourglass={}*{}={}".format(hourglass_capacity_x, hourglass_capacity_y, max_hourglass))
    
    max_sum = None
    sum_hourglass_matrix = []
    for y in range(hourglass_capacity_y):
        sum_hourglass_row = []
        for x in range(hourglass_capacity_x):
            sum_hourglass = arr[y][x] + arr[y][x+1] + arr[y][x+2] + arr[y+1][x+1] + arr[y+2][x] + arr[y+2][x+1] + arr[y+2][x+2]
            if max_sum is None or sum_hourglass > max_sum:
                max_sum = sum_hourglass
            print("x={},y={},sum={},max_sum={}".format(x, y, sum_hourglass, max_sum))
            sum_hourglass_row.append(sum_hourglass)
        sum_hourglass_matrix.append(sum_hourglass_row)
        
    return max_sum
    

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    arr = []

    for _ in range(6):
        arr.append(list(map(int, input().rstrip().split())))

    result = hourglassSum(arr)

    fptr.write(str(result) + '\n')

    fptr.close()
