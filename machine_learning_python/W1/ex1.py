## Machine Learning Online Class - Exercise 1: Linear Regression
## in python 3.7
# Functions implemented
#  ------------
#  warmUpExercise.py
#
#
# x refers to the population size in 10,000s
# y refers to the profit in $10,000s
#

## Initialization
import os
import sys
import numpy as np
from matplotlib import pyplot as plt

from warmUpExercise import warmUpExercise
from plotData import plotData

def pause():
    programPause = input('Program paused. Press enter to continue.')


## ==================== Part 1: Basic Function ====================
# refer to warmUpExercise.py
print('Running warmUpExercise ... ')
Matrix = warmUpExercise()

print('5x5 Identity Matrix: ')
print(Matrix)

pause()

## ======================= Part 2: Plotting =======================
print('Plotting Data ...')
data = np.loadtxt('ex1data1.txt', delimiter = ',');
X = data[:, 0]; y = data[:, 1];
m = len(y); # number of training examples

# Plot Data
# Note: refer to plotData.py
plotData(X,y)
pause()
