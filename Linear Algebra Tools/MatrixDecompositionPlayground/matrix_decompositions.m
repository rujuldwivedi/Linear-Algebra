function matrix_decompositions()
    clc;
    disp("=== Matrix Decomposition Playground ===");

    A = input('Enter matrix A (e.g., [2 1; 1 3]): ');

    [m, n] = size(A);
    fprintf("Matrix A is %dx%d\n", m, n);

    % --- LU Decomposition ---
    if m == n
        [L,U,P] = lu(A);
        disp("LU Decomposition:");
        disp("P:"); disp(P);
        disp("L:"); disp(L);
        disp("U:"); disp(U);
        fprintf('Check: norm(P*A - L*U) = %e\n\n', norm(P*A - L*U));
    else
        disp("LU: Skipped (A is not square)");
    end

    % --- QR Decomposition ---
    [Q,R] = qr(A);
    disp("QR Decomposition:");
    disp("Q:"); disp(Q);
    disp("R:"); disp(R);
    fprintf('Check: norm(A - Q*R) = %e\n\n', norm(A - Q*R));

    % --- Eigen Decomposition ---
    if m == n
        [V,D] = eig(A);
        disp("Eigen Decomposition:");
        disp("Eigenvalues (D):"); disp(D);
        disp("Eigenvectors (V):"); disp(V);
        fprintf('Check: norm(A*V - V*D) = %e\n\n', norm(A*V - V*D));
    else
        disp("Eigen: Skipped (A is not square)");
    end

    % --- Singular Value Decomposition ---
    [U,S,V] = svd(A);
    disp("SVD:");
    disp("U:"); disp(U);
    disp("S (Σ):"); disp(S);
    disp("V:"); disp(V);
    fprintf('Check: norm(A - U*S*V'') = %e\n\n', norm(A - U*S*V'));
end
