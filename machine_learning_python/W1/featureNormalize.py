#FEATURENORMALIZE Normalizes the features in X
#   FEATURENORMALIZE(X) returns a normalized version of X where
#   the mean value of each feature is 0 and the standard deviation
#   is 1. This is often a good preprocessing step to do when
#   working with learning algorithms.

import numpy as np

def featureNormalize(X):
    # You need to set these values correctly
    X_norm = X
    N = np.shape(X)[1]
    mu = np.zeros([1, N])
    sigma = np.zeros([1, N])
    # ====================== YOUR CODE HERE ======================
    for i in range(N):
        # Calculate mean value
        mu[0, i] = np.mean(X[:, i])
        # Caclculate standard deviation
        sigma[0, i] = np.std(X[:, i])
        X_norm[:, i] = (X[:,i] - mu[0, i])/sigma[0, i]

    return X_norm, mu, sigma

if __name__ == "__main__":
    X = np.array([[1], [2], [3]])
    X_norm, mu, sigma = featureNormalize(X)
    print(X_norm, mu, sigma)
