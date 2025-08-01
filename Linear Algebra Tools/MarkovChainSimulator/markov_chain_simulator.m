function markov_chain_simulator()
    clc;
    disp("=== Markov Chain Simulator ===");

    % Example transition matrix (can be replaced)
    P = input('Enter the transition matrix P (e.g., [0.9 0.1; 0.5 0.5]): ');

    % Validation
    [rows, cols] = size(P);
    if rows ~= cols
        error('Transition matrix must be square.');
    end
    if any(abs(sum(P,2) - 1) > 1e-6)
        error('Each row of P must sum to 1.');
    end

    % Initial state distribution
    pi0 = input(sprintf('Enter initial distribution (e.g., [%s]): ', ...
        num2str(ones(1,rows)/rows)));

    if length(pi0) ~= rows || abs(sum(pi0) - 1) > 1e-6
        error('Initial distribution must match size of P and sum to 1.');
    end

    % Number of steps
    steps = input('Number of steps to simulate: ');
    if isempty(steps) || steps < 1
        steps = 20;
    end

    % Simulation
    state_dist = zeros(steps+1, rows);
    state_dist(1,:) = pi0;

    for t = 2:steps+1
        state_dist(t,:) = state_dist(t-1,:) * P;
    end

    % Plotting
    figure;
    plot(0:steps, state_dist, 'LineWidth', 2);
    xlabel('Time Step'); ylabel('Probability');
    title('Markov Chain State Distribution Over Time');
    legend(arrayfun(@(i) sprintf('State %d', i), 1:rows, 'UniformOutput', false));
    grid on;
end
