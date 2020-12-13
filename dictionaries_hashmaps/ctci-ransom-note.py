#!/bin/python3

import math
import os
import random
import re
import sys

# Complete the checkMagazine function below.
def checkMagazine(magazine, note):
    #print("magazine={}".format(magazine))
    #print("note={}".format(note))
    
    # create dicts
    set_magazine = dict()
    set_note = dict()
    for w in magazine:
        set_magazine.update({w: 1} if w not in set_magazine else {w: set_magazine[w]+1})
    for w in note:
        set_note.update({w: 1} if w not in set_note else {w: set_note[w]+1})
    # print("set_magazine={}".format(set_magazine))
    # print("set_note={}".format(set_note))
    
    # check if subset
    is_subset = True
    for w in set_note:
        if w not in set_magazine or set_magazine[w] < set_note[w]:
            is_subset = False
            break
        
    # output
    print('Yes' if is_subset else 'No')
    

if __name__ == '__main__':
    mn = input().split()

    m = int(mn[0])

    n = int(mn[1])

    magazine = input().rstrip().split()

    note = input().rstrip().split()

    checkMagazine(magazine, note)
