
function experiment_linsep()
    % params:
    % N = number of dimensions
    % alpha = ratio of patterns/dimensions
    % n_max = max_number of epochs
    % n_D = number of generated samples per pattern size
    
    %
    upper = 50;
    N = {10};
    alpha = 0.25:0.25:upper;
    n_max = 1000;
    n_D = 10;
    
    alpha_max = upper/0.25;
    
    for N_idx = 1:length(N)
        for alpha_idx = 1 : alpha_max
            [error, mean_epoch] = LinSep(N{N_idx}, alpha(alpha_idx), n_max, n_D);
    
            Q_ls(alpha_idx) = error;
            epochs_for_alpha(alpha_idx) = mean_epoch;
            P = round(alpha(alpha_idx)*N{N_idx});
            expected_error(alpha_idx) = (1/2)* (calculate_capacity_hyperplane(P, N{N_idx}-1)/calculate_capacity_hyperplane(P, N{N_idx}));
        end
        %figure(1)     
        plot(alpha, Q_ls, '-o');
        %plot(alpha, expected_error);
        hold on
        
        %figure(2)
        %plot(alpha, epochs_for_alpha, '-o');
        %hold on


        plot(alpha, expected_error);
        
    end
    %figure(1)
    title("Generalization Error, Predicted vs Real")
    xlabel("Alpha (ratio of Patterns over Dimensions)")
    ylabel("Generalization Error")
    
    %figure(2)
    %title("Alpha vs epochs per alpha")
    %xlabel("Alpha (ratio of Patterns over Dimensions)")
    %ylabel("average epochs needed for max stability")