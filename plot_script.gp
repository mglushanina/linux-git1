# plot_script.gp

# Set data file and separator
set datafile separator ','

# Define the function for the linear regression
f(x) = m * x + b

# Fit the data to the linear regression function
fit f(x) '/home/mglushanina/linux-git1/tmp/hotels_filtered.csv' using 2:1 via m, b

# Set plot title and labels
set title 'Linear Regression: Cleanliness vs Overall Rating'
set xlabel 'Overall Rating'
set ylabel 'Cleanliness'

# Plot the data points and the regression line
plot '/home/mglushanina/linux-git1/tmp/hotels_filtered.csv' using 2:1 title 'Data Points' with points, \
     f(x) title sprintf('Regression Line: y = %.2fx + %.2f', m, b) with lines

# Save the plot as a PNG file
set term pngcairo enhanced font 'Verdana,10'
set output 'linear_regression_plot.png'
replot
set output

