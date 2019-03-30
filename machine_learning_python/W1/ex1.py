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
import scipy.linalg
import matplotlib.pyplot as plt
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D

from warmUpExercise import *
from plotData import *
from computeCost import *
from gradientDescent import *

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
data = loadtxt('ex1data1.txt', delimiter = ',')
X = data[:, 0]
y = data[:, 1]
m = len(y) # number of training examples
# Plot Data
# Note: refer to plotData.py
plotData(X,y)
pause()

## =================== Part 3: Cost and Gradient descent ===================
X = zeros((m, 2))
X[:, 0] = ones(m) # Add a column of ones to x
X[:, 1] = data[:, 0]

theta = zeros((2, 1)) # initialize fitting parameters

# Some gradient descent settings
iterations = 1500
alpha = 0.01

print('Testing the cost function ...')
# compute and display initial cost refer to computeCost
J = computeCost(X, y, theta)
print('With theta = [0  0]\nCost computed = {0:.2f}'.format(J))
print('Expected cost value (approx) 32.07')
pause()
# further testing of the cost function
J = computeCost(X, y, np.array([[-1], [2]]))
print('With theta = [-1  2]\nCost computed = {0:.2f}'.format(J))
print('Expected cost value (approx) 54.24')

print('Program paused. Press enter to continue.')
print('Running Gradient Descent ...')

# run gradient descent refer to gradientDescent
theta, J = gradientDescent(X, y, theta, alpha, iterations)

# print theta to screen
print('Theta found by gradient descent:')
print('{0:.4f} \n {1:.4f}'.format(theta[0][0], theta[1][0]))
print('Expected theta values (approx)')
print(' -3.6303\n  1.1664')

# Plot the linear fit
plt.plot(X[:,1], X.dot(theta), 'r-')
plt.legend(['Training data', 'Linear regression'])
plt.show()
pause()

# Predict values for population sizes of 35,000 and 70,000
predict1 = np.array([1, 3.5]).dot(theta)
# should be around 4519
print('For population = 35,000, we predict a profit of {}'.format(predict1*10000))
predict2 = np.array([1, 7]).dot(theta)
# should be around 45342
print('For population = 70,000, we predict a profit of {}'.format(predict2*10000))

## ============= Part 4: Visualizing J(theta_0, theta_1) =============
print('Visualizing J(theta_0, theta_1) ...')

# Grid over which we will calculate J
theta0_vals = np.linspace(-10, 10, 100)
theta1_vals = np.linspace(-1, 4, 100)

# initialize J_vals to a matrix of 0's
J_vals = np.zeros((len(theta0_vals), len(theta1_vals)))

# Fill out J_vals
for i in range(len(theta0_vals)):
    for j in range(len(theta1_vals)):
        t = np.array([[theta0_vals[i]], [theta1_vals[j]]])
        J_vals[i,j] = computeCost(X, y, t)

# Surface plot
fig = plt.figure()
ax = fig.gca(projection='3d')
surf = ax.plot_surface(theta0_vals, theta1_vals, J_vals, cmap=cm.coolwarm,
                       linewidth=0, antialiased=False)
plt.show()

# Contour plot
# Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
plt.contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
plt.xlabel('theta_0')
plt.ylabel('theta_1')
plt.plot(theta[0], theta[1], 'rx')
plt.show()
