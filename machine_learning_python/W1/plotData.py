from matplotlib import pyplot as plt

# PLOTDATA Plots the data points x and y into a new figure
#   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
#   population and profit.
def plotData(x, y):
    plt.plot(x, y, 'bo', markersize = 5)         # Plot the data
    plt.ylabel('Profit in $10,000s')             # Set the y-axis label
    plt.xlabel('Population of City in 10,000s')  # Set the x-axis label
    plt.show()                                   # Show the plot
