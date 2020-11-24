function success_rate = perceptron_training(N_par, alpha, n_max, generated_par)
    % N = number of dimensions
    % P = number of patterns

    N = N_par;
    % calculate P from alpha
    P = alpha * N;
    
    
    % n = number of epochs
    % t = time steps (resets to 1 after reaching P)

    n = n_max;
    t = P;

    n_generated_sets = generated_par;
    success_iter = 0; % yet
    
    for iter_gen_set = 1 : n_generated_sets
        matrix = zeros(P, N + 1);

        for pattern = 1:P
            idx = randperm(2, 1);
            A = [-1, 1];
            S = A(idx);
            for dimension = 1:N
                matrix(pattern, dimension) = randn();
            end
            matrix(pattern, N + 1) = S;
        end

        % W = weights array (size Nx1)
        W = zeros(N, 1);

        for epoch = 1:n
           flag = 0;
           for pattern_presented = 1:t
               E = dot(W, matrix(pattern_presented, 1:N)) * matrix(pattern_presented, N+1);
               if E <= 0
                   W = W + (matrix(pattern_presented, N+1)/N)*matrix(pattern_presented, 1:N)';
                   flag = 1;
               end
           end
           if flag == 0
               %fprintf("All E's are okay (E > 0)  after %d epochs! Done!\n", epoch)
               success_iter = success_iter + 1;
               break
           end
        end
        %fprintf("Done!\n")
    end
   success_rate = success_iter / n_generated_sets;
   %fprintf("Success rate: %f \n", success_rate);
end
    