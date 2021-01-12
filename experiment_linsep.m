function experiment_linsep()
    % params:
    % N = number of dimensions
    % alpha = ratio of patterns/dimensions
    % n_max = max_number of epochs
    % n_D = number of generated samples per pattern size
    
    %
    
    N = {100};
    alpha = 0.25:0.25:5;
    n_max = 200;
    n_D = 20;
    
    
    for N_idx = 1:length(N)
        for alpha_idx = 1 : 20
            error = LinSep(N{N_idx}, alpha(alpha_idx), n_max, n_D);
            Q_ls(alpha_idx) = error;
        end
             
        plot(alpha, Q_ls, '-o'); 
        hold on
        
    end
    title("Alpha vs mean-error-rate")
    xlabel("Alpha (ratio of Patterns over Dimensions)")
    ylabel("mean-error rate")
    