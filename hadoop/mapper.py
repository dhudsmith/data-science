#! /usr/bin/env python

import sys


# -- Stadium Data
# Stadium
# Stadium Capacity
# expanded capacity (standing)
# Location
# Playing surface
# Is Artificial Turf
# Team
# Opened
# Weather
# Station Roof Type
# elevation

for line in sys.stdin:
    line = line.strip()
    unpacked = [x.strip() for x in line.split(",")]
    stadium, capacity, expanded, \
        location, surface, turf, \
        team, opened, weather, \
        roof, elevation = unpacked
    results = [turf, "1"]
    print("\t".join(results))
