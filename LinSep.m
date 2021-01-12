function mean_error_rate = LinSep(N_par, alpha, n_max, n_generated_sets)
    error_rate = zeros(n_generated_sets, 1);
    for iter_gen_set = 1 : n_generated_sets
        N = N_par;

        w = randn(N, 1);
        norm_w = w / norm(w);
        w_star = sqrt(N)*norm_w;
        norm(w_star)^2; % check: this should be equal to N

        P = round(alpha*N);

        matrix = zeros(P, N + 1);

        for pattern_idx = 1:P
            pattern = randn(N, 1);
            S = sign(w_star' * pattern);
            pattern(N+1, 1) = S;
            matrix(pattern_idx, :) = pattern';  % patterns and output are stored as row vectors in P x N + 1 matrix
        end

        W = zeros(N, 1);
        n = n_max;
        p = P;
        E = 1;

        % for the first epoch, pick the first pattern
        chosen_pattern = 1;

        W = W + 1/N*(matrix(1, N+1) * matrix(1, 1:N))';

        
        for epoch = 1:n  
           lowest_stability_found = 100;
           stability_holder = chosen_pattern;
           for pattern = 1:p
           
               stability_pattern = (dot(W, matrix(pattern, 1:N))*matrix(pattern, N+1))/norm(W);
               if stability_pattern < lowest_stability_found
                   stability_holder = pattern;
                   lowest_stability_found = stability_pattern;
               end
              
           end
           W = W + (1/N) * (matrix(stability_holder, 1:N) * matrix(stability_holder, N+1))';
        end
        
        stability_holder;
        lowest_stability_found;
        dot(W, w_star)/(norm(W)*norm(w_star));
        generalization_error = 1/pi * acos(dot(W, w_star)/(norm(W)*norm(w_star)));
        error_rate(iter_gen_set, 1) = generalization_error;
    end
    mean_error_rate = mean(error_rate)
    fprintf("Done!\n")






