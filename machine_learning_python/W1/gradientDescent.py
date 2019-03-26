from numpy import *
from computeCost import computeCost

def gradientDescent(X, y, theta, alpha, num_iters):
    # Initialize some useful values
    m = len(y) # number of training examples
    J_history = zeros([num_iters, 1])
    for iter in range(num_iters):
        sum = zeros([2,1])
        for i in range(m):
            sum[0][0] = sum[0][0] + (theta[0][0]+ theta[1][0]*X[i][1] - y[i])
            sum[1][0] = sum[1][0] + (theta[0][0]+ theta[1][0]*X[i][1] - y[i])*X[i][1]
        theta[0][0] = theta[0][0] - sum[0][0]*alpha/m
        theta[1][0] = theta[1][0] - sum[1][0]*alpha/m
        J_history[iter] = computeCost(X, y, theta)

    return theta, J_history

if __name__ == "__main__":
    X = array([[1, 5], [1, 2], [1, 4], [1, 5]])
    y = array([[1], [6], [4], [2]])
    theta = zeros([2, 1])
    alpha = 0.01
    num_iters = 1000
    print(gradientDescent(X, y, theta, alpha, num_iters))
