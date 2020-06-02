#!/usr/bin/python
# -*- coding:utf-8 -*-

from sys import argv

a = argv[1]

def purify_xml(lines, order = 'f'):
    if order == 'r':
        order = range(len(lines))
    else:
        order = reversed(range(len(lines)))

    for i in order:
        if lines[i].startswith('<'):
            break
        else:
            lines[i] = ''

with open(a) as f:
    lines = f.readlines()
    purify_xml(lines)
    purify_xml(lines, 'r')
            
    for line in lines:
        print(line, end = '')