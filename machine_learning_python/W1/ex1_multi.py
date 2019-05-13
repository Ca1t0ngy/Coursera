## Machine Learning Online Class - Exercise 1: Linear Regression
## in python 3.7
# Functions implemented
#  ------------
#
import os
import sys
import scipy.linalg
import numpy as np

def pause():
    programPause = input('Program paused. Press enter to continue.')

## ================ Part 1: Feature Normalization ================
print('Loading data ...')
## Load Data
data = np.loadtxt('ex1data2.txt', delimiter=',')
X = data[:,:2]
y = data[:,2]
m = len(y)

# Print out some data points
print('First 10 examples from the dataset: ')
for x1, x2 in X[0:10]:
    print('{:.0f} {:.0f}'.format(x1, x2))

print(y[0:10])
pause()

# Scale features and set them to zero mean
print('Normalizing Features ...')

[X mu sigma] = featureNormalize(X)

# Add intercept term to X
X = zeros((m, 3))
X[:, 0] = ones(m) # Add a column of ones to x
X[:, 1:2] = data[:, 0:1]

'''
## ================ Part 2: Gradient Descent ================

# ====================== YOUR CODE HERE ======================
# Instructions: We have provided you with the following starter
#               code that runs gradient descent with a particular
#               learning rate (alpha).
#
#               Your task is to first make sure that your functions -
#               computeCost and gradientDescent already work with
#               this starter code and support multiple variables.
#
#               After that, try running gradient descent with
#               different values of alpha and see which one gives
#               you the best result.
#
#               Finally, you should complete the code at the end
#               to predict the price of a 1650 sq-ft, 3 br house.
#
# Hint: By using the 'hold on' command, you can plot multiple
#       graphs on the same figure.
#
# Hint: At prediction, make sure you do the same feature normalization.
#

print('Running gradient descent ...')

# Choose some alpha value
alpha = 0.5
num_iters = 50

# Init Theta and Run Gradient Descent
theta = zeros(3, 1)
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)

# Plot the convergence graph
figure
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2)
xlabel('Number of iterations')
ylabel('Cost J')

# Display gradient descent's result
print('Theta computed from gradient descent: ')
print(' #f ', theta)
print()

# Estimate the price of a 1650 sq-ft, 3 br house
# ====================== YOUR CODE HERE ======================
# Recall that the first column of X is all-ones. Thus, it does
# not need to be normalized.
norm = ([1650 3] - mu)./sigma
price = [1 norm]* theta # You should change this


# ============================================================

print(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent): $#f'], price)

print('Program paused. Press enter to continue.')
pause

## ================ Part 3: Normal Equations ================

print('Solving with normal equations...')

# ====================== YOUR CODE HERE ======================
# Instructions: The following code computes the closed form
#               solution for linear regression using the normal
#               equations. You should complete the code in
#               normalEqn.m
#
#               After doing so, you should complete this code
#               to predict the price of a 1650 sq-ft, 3 br house.
#

## Load Data
data = csvread('ex1data2.txt')
X = data(:, 1:2)
y = data(:, 3)
m = length(y)

# Add intercept term to X
X = [ones(m, 1) X]

# Calculate the parameters from the normal equation
theta = normalEqn(X, y)

# Display normal equation's result
print('Theta computed from the normal equations: ')
print(' #f ', theta)
print()


# Estimate the price of a 1650 sq-ft, 3 br house
# ====================== YOUR CODE HERE ======================
price = [1 1650 3] *theta # You should change this


# ============================================================

print(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations): $#f'], price)
'''
