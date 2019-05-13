from numpy import *
import scipy.linalg

def computeCost(X, y, theta):
    # COMPUTECOST Compute cost for linear regression
    #   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
    #   parameter for linear regression to fit the data points in X and y

    # Initialize some useful values
    m = len(y); # number of training examples

    #  need to return the following variables correctly
    J = 0;

    """ non vectorized
    for i in range(m):
        J = J + (theta[0, 0]+ theta[1, 0]* X[i, 1] - y[i])**2;
    """
    J = sum((X.dot(theta)[:,0] - y)**2)

    J = J/(2*m)

    return J
