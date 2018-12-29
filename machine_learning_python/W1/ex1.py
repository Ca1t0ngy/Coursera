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
from computeCost import computeCost

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

## =================== Part 3: Cost and Gradient descent ===================
X = np.zeros((m, 2))
X[:, 0] = np.ones(m) # Add a column of ones to x
X[:, 1] = data[:, 0]

theta = np.zeros((2, 1)); # initialize fitting parameters

# Some gradient descent settings
iterations = 1500;
alpha = 0.01;

print('Testing the cost function ...')
# compute and display initial cost; refer to computeCost
J = computeCost(X, y, theta);
print('With theta = [0 ; 0]\nCost computed = {0:.2f}'.format(J));
print('Expected cost value (approx) 32.07');

pause();
# further testing of the cost function
theta = np.array([[-1], [2]])
J = computeCost(X, y, theta);
print('With theta = [-1 ; 2]\nCost computed = {0:.2f}'.format(J));
print('Expected cost value (approx) 54.24');

print('Program paused. Press enter to continue.');

"""
print('Running Gradient Descent ...')
% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);
fprintf('Expected theta values (approx)\n');
fprintf(' -3.6303\n  1.1664\n\n');

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;
"""
