# Y
# ^  <-
# |   |+M
# ___>X
#ASCII Axis 😂

#angle defined from 0,0 in degrees going counter clockwise to the x axsis


import math
import operator

#2D profile of part as defined by functions


def stress(force, area):
    return(force/area)


def normalStress(force, angle, area):
    nForce = float(math.cos(math.radians(angle)))*float(force)
    return(stress(nForce,area))

def shearStress(force, angle, area):
    nForce = float(math.sin(math.radians(angle)))*float(force)
    return(stress(nForce,area))

shears = {}
normal = {}

for i in range (0,90):
    shears[i]=shearStress(10,i,5)
    normal[i]=normalStress(10,i,5)

print(shears)
print(normal)