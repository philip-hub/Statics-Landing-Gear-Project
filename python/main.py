# Y
# ^  <-
# |   |+M
# ___>X

#angle defined from 0,0 in degrees going counter clockwise to the x axsis


import math





def stress(force, area):
    return(force/area)


def normalStress(force, angle, area):
    nForce = float(math.cos(math.radians(angle)))*float(force)
    return(stress(nForce,area))

def shearStress(force, angle, area):
    nForce = float(math.sin(math.radians(angle)))*float(force)
    return(stress(nForce,area))


# for i in range (0,90):
