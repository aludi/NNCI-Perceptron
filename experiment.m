function experiment()
    % params:
    % N = number of dimensions
    % alpha = ratio of patterns/dimensions
    % n_max = max_number of epochs
    % n_D = number of generated samples per pattern size
    
    N = 20;
    alpha = 0.75:0.25:3;
    n_max = 100;
    n_D = 50;
    
    Q_ls = alpha;  % gets overwritten later
    for alpha_idx = 1 : 10
        success_rate = perceptron_training(N, alpha(alpha_idx), n_max, n_D);
        Q_ls(alpha_idx) = success_rate;
    end
    
    figure
    plot(alpha, Q_ls)
    title("Alpha vs success-rate")
    xlabel("Alpha (ratio of Patterns over Dimensions)")
    ylabel("Success-rate of training")
   
    % plot looks about right (page 61 in LN)
    