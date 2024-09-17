% Define the function to be integrated
syms x
syms f
f = input('Enter the function to be integrated (use "." for element-wise operations): ');
F = @(x) eval(vectorize(f));

% Define the interval [a, b] and number of subintervals n
a = input('Enter the lower limit (a): ');
b = input('Enter the upper limit (b): ');
n = input('Enter the number of subintervals (n): ');

% Calculate the width of each subinterval
dx = (b - a) / n;

% Initialize variables to store the Riemann sums
left_sum = 0;
right_sum = 0;
midpoint_sum = 0;

% Calculate Riemann sums
for i = 1:n
    xi = a + (i - 1) * dx; % Left endpoint of the subinterval
    left_sum = left_sum + F(xi) * dx;
    
    xi = a + i * dx; % Right endpoint of the subinterval
    right_sum = right_sum + F(xi) * dx;
    
    xi = a + (i - 0.5) * dx; % Midpoint of the subinterval
    midpoint_sum = midpoint_sum + F(xi) * dx;
end

% Clear command window and enable grid
clc;
grid on;

% Left sum graph
figure;
hold on;
fplot(f, [a b], 'k'); % Plot the function over the given interval [a, b]
fplot('y == 0', [a b], 'b'); % Plot the x-axis
title('Left Riemann Sum');
for i = a:dx:b-dx
    xi = i;
    height = F(xi); % Evaluate the function at the left endpoint
    line([i i], [0 height]); % Vertical line at the left endpoint
    line([i+dx i+dx], [0 height]); % Vertical line at the right side of the rectangle
    line([i i+dx], [height height]); % Horizontal top line of the rectangle
end

% Right sum graph
figure;
grid on;
hold on;
fplot(f, [a b], 'k'); % Plot the function over the given interval [a, b]
fplot('y == 0', [a b], 'b'); % Plot the x-axis
title('Right Riemann Sum');
for i = a+dx:dx:b
    xi = i;
    height = F(xi); % Evaluate the function at the right endpoint
    line([i i], [0 height]); % Vertical line at the right endpoint
    line([i-dx i-dx], [0 height]); % Vertical line at the left side of the rectangle
    line([i-dx i], [height height]); % Horizontal top line of the rectangle
end

% Midpoint sum graph
figure;
grid on;
hold on;
fplot(f, [a b], 'k'); % Plot the function over the given interval [a, b]
fplot('y == 0', [a b], 'b'); % Plot the x-axis
title('Midpoint Riemann Sum');
for i = a+0.5*dx:dx:b-0.5*dx
    xi = i; % Midpoint of the subinterval
    height = F(xi); % Evaluate the function at the midpoint
    line([i-0.5*dx i-0.5*dx], [0 height]); % Left vertical line of the rectangle
    line([i+0.5*dx i+0.5*dx], [0 height]); % Right vertical line of the rectangle
    line([i-0.5*dx i+0.5*dx], [height height]); % Horizontal top line of the rectangle
end

% Display the Riemann sums
fprintf('Left Riemann Sum: %f\n', left_sum);
fprintf('Right Riemann Sum: %f\n', right_sum);
fprintf('Midpoint Riemann Sum: %f\n', midpoint_sum);
