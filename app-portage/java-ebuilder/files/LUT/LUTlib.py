#!/usr/bin/python
# -*- coding:utf-8 -*-

import json

def import_LUT(src):
    with open(src) as srcf:
        return json.loads(srcf.read())

def export_LUT(LUT, dst):
    with open(dst, 'w') as dstf:
        dstf.write(json.dumps(LUT))

def lookup(LUT, category, pkg):
    try:
        return LUT[category][pkg]
    except:
        return []

def insert_pkg(LUT, category, pkg, groupId, artifactId):
    if category not in LUT.keys():
        LUT[category] = {}
    if pkg not in LUT[category].keys():
        LUT[category][pkg] = []
    if [groupId, artifactId] not in LUT[category][pkg]:
        LUT[category][pkg].append([groupId, artifactId])

