# Y
# ^  <-
# |   |+M
# ___>X
#ASCII Axis 😂

#angle defined from 0,0 in degrees going counter clockwise to the x axsis


import math
import operator

#2D profile of part as defined by functions

stressUnits="PSI"

sheetThickness = [0.198, 0.198, 0.123, 0.123, 0.123, 0.123, 0.123, 0.123, 0.123,0.123,0.092, 0.092,0.063,0.063]

sheetWidth = [0.200, 0.100, 0.200, 0.150, 0.150, 0.100, 0.100, 0.100, 0.050, 0.050, 0.200, 0.088, 0.200,0.070]

maxForce = [447.0, 208.0, 220.0, 181.8, 182.5, 105.0, 116.2, 117.5, 050.0, 050.6, 162.0, 070.0, 115.0, 037.5]


def findE(sheetThickness, sheetWidth, maxForce):
    eList = []
    for i in sheetThickness:
        area = i*sheetWidth[sheetThickness.index(i)]
        p = maxForce[sheetThickness.index(i)]
        E = p/area
        eList.append(E)
    return(eList)

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

# print(shears)
# print(normal)

shearMaxAngle=max(shears.items(), key=operator.itemgetter(1))[0]
shearMax=shears[shearMaxAngle]
normalMaxAngle=max(normal.items(), key=operator.itemgetter(1))[0]
normalMax=normal[normalMaxAngle]

print(f"Max Shear is {shearMax} {stressUnits} at an angle of  {shearMaxAngle} degrees")
print(f"Max Normal is {normalMax} {stressUnits} at an angle of  {normalMaxAngle} degrees")

print(findE(sheetThickness, sheetWidth, maxForce))