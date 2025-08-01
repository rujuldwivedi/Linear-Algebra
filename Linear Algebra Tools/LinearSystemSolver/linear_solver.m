function linear_solver()
    clc;
    disp("=== Linear System Solver ===");

    % Example matrix A and vector b
    A = [2, -1; 1, 1]; % Coefficient matrix
    b = [1; 5];        % Constants

    % Display the system
    disp("Solving system:");
    disp("A * x = b");
    disp("A = "); disp(A);
    disp("b = "); disp(b);

    % Solve using MATLAB backslash operator
    if rank(A) == size(A,1)
        x = A \ b;
        disp("Unique solution:");
        disp(x);
    else
        disp("No unique solution (either none or infinitely many).");
    end

    % Visualization (for 2D systems only)
    if size(A,2) == 2 && size(A,1) == 2
        visualize_2d_system(A, b);
    else
        disp("Visualization only available for 2x2 systems.");
    end
end

function visualize_2d_system(A, b)
    figure;
    hold on; grid on; axis equal;
    xlabel('x'); ylabel('y');
    title('Graphical Representation of the System');

    % Define x-range for plotting
    x_vals = linspace(-10, 10, 400);

    % Plot each equation as a line
    for i = 1:size(A,1)
        a = A(i, :);
        if a(2) ~= 0
            y_vals = (b(i) - a(1)*x_vals) / a(2);
            plot(x_vals, y_vals, 'LineWidth', 2, 'DisplayName', sprintf('Eq %d', i));
        else
            x_line = repmat(b(i)/a(1), size(x_vals));
            plot(x_line, x_vals, 'LineWidth', 2, 'DisplayName', sprintf('Eq %d', i));
        end
    end

    legend;
end
