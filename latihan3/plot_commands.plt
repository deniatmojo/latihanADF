set terminal wxt persist
plot 'quadratic_data.txt' using 1:2 with lines title 'x^2', 'quadratic_data.txt' using 1:3 with lines title '2x^2'