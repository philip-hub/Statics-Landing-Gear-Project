import math


def stress(force, area):
    return(force/area)

# Y
# ^  <-
# |   |M
# ___>X

#angle defined from 0,0 in degrees going counter clockwise to the x axsis

def normalStress(force, angle, area):
    nForce = float(math.cos(math.radians(angle)))*float(force)
    return(stress(nForce,area))
