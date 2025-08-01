function curve_fitting_tool()
    clc;
    disp("=== Least Squares Curve Fitting Tool ===");

    % Option 1: Manual input
    x = input('Enter x values as a row vector (e.g., [1 2 3 4]): ');
    y = input('Enter y values as a row vector (e.g., [2.3 3.5 3.8 5.1]): ');

    if length(x) ~= length(y)
        error("x and y must be of same length.");
    end

    degrees = input('Enter polynomial degrees to try (e.g., [1 2 3]): ');
    if isempty(degrees)
        degrees = 1:min(length(x)-1, 3);
    end

    figure;
    scatter(x, y, 40, 'filled'); hold on;
    title("Least Squares Polynomial Fits");
    xlabel('x'); ylabel('y');
    grid on;

    colors = lines(length(degrees));
    legends = cell(1, length(degrees));

    for i = 1:length(degrees)
        d = degrees(i);
        coeffs = polyfit(x, y, d);
        x_fit = linspace(min(x), max(x), 100);
        y_fit = polyval(coeffs, x_fit);
        plot(x_fit, y_fit, 'LineWidth', 2, 'Color', colors(i, :));
        legends{i} = ['Degree ' num2str(d)];
    end

    legend(['Data', legends]);
end
